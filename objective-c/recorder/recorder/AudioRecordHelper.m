#import "AudioRecordHelper.h"
#import <CoreAudio/CoreAudioTypes.h>

static const NSTimeInterval kMaximunRecordTimeInterval = 60.0;
static NSString *const kRecordFile = @"recordFile";

@interface AudioRecordHelper () <AVAudioRecorderDelegate>

@property (nonatomic, readwrite) NSURL *recordFileURL;
@property (nonatomic, strong) NSString *recordFilePath;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) AVAudioRecorder *audioRecorder;

@end

@implementation AudioRecordHelper

+ (AudioRecordHelper *)sharedInstance {
    static AudioRecordHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)prepareAudioSession {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;
    if (![audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&error]) {
        LOG(@"Error: %@", [error description]);
        return;
    }

    error = nil;
    if (![audioSession setActive:YES error:&error]) {
        LOG(@"Error: %@", [error description]);
        return;
    }
}

- (BOOL)isRecording {
    return self.audioRecorder ? self.audioRecorder.isRecording : NO;
}

- (void)startRecording {
    if (self.audioRecorder) {
        [self stopRecording];
        self.audioRecorder = nil;
    }

    [self prepareAudioSession];

    self.recordFilePath = [[AudioRecordHelper recordFileDirectory]
        stringByAppendingPathComponent:[AudioRecordHelper createRecordFileName]];
    self.recordFileURL = [NSURL fileURLWithPath:self.recordFilePath];

    self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:self.recordFileURL
                                                     settings:[AudioRecordHelper audioRecorderSettings]
                                                        error:nil];
    self.audioRecorder.delegate = self;
    self.audioRecorder.meteringEnabled = YES;
    [self.audioRecorder prepareToRecord];

    if ([self.audioRecorder record]) {
        [self resetTimer];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                      target:self
                                                    selector:@selector(checkRecorderParameters)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

- (void)stopRecording {
    if (!self.audioRecorder || !self.audioRecorder.isRecording) {
        return;
    }

    [self.audioRecorder stop];
    [self resetTimer];
}

- (void)cancelRecording {
    if (!self.audioRecorder || !self.audioRecorder.isRecording) {
        return;
    }

    [self stopRecording];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self.recordFilePath]) {
        NSError *error = nil;
        LOG(@"--- filename: %@", self.recordFilePath);
        if (![fileManager removeItemAtPath:self.recordFilePath error:&error]) {
            LOG(@"Unable to delete:%@  %@", self.recordFilePath, [error localizedDescription]);
        }
    }
}

// 删除/documents/Audio下的录音文件
- (void)removeAllRecordFiles {
    NSString *path = [AudioRecordHelper recordFileDirectory];
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:NULL];

    for (NSString *filename in contents) {
        if ([filename rangeOfString:kRecordFile].length > 0) {
            LOG(@"--- filename: %@", filename);
            [[NSFileManager defaultManager] removeItemAtPath:[path stringByAppendingPathComponent:filename]
                                                       error:NULL];
        }
    }
}

#pragma mark - Private Methods
+ (NSDictionary *)audioRecorderSettings {
    NSDictionary *recordSettings = @{
        [NSNumber numberWithInt:kAudioFormatAMR] : AVFormatIDKey, //音频编码格式
        [NSNumber numberWithFloat:16000.0] : AVSampleRateKey,     //采样率
        [NSNumber numberWithInt:1] : AVNumberOfChannelsKey        //通道的数目
    };
    return recordSettings;
}

+ (NSString *)createRecordFileName {
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    dateformat.dateFormat = @"yyyyMMddHHmmss";
    NSString *dateString = [dateformat stringFromDate:[NSDate date]];
    return [dateString stringByAppendingString:kRecordFile];
}

+ (NSString *)recordFileDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *audioDirectory = [paths[0] stringByAppendingPathComponent:@"Audio"];
    BOOL isDirectory = YES;
    if (![[NSFileManager defaultManager] fileExistsAtPath:audioDirectory isDirectory:&isDirectory]) {
        BOOL isCreateDirectorySuccess = [[NSFileManager defaultManager] createDirectoryAtPath:audioDirectory
                                                                  withIntermediateDirectories:YES
                                                                                   attributes:nil
                                                                                        error:nil];
        if (!isCreateDirectorySuccess) {
            LOG(@"创建Audio目录失败");
        }
    }
    return audioDirectory;
}

- (void)checkRecorderParameters {
    if (!self.audioRecorder) {
        return;
    }

    [self.audioRecorder updateMeters];

    if ([self.delegate respondsToSelector:@selector(recorderCurrentPeakPower:progress:)]) {
        double peakPower = pow(10, (0.015 * [self.audioRecorder averagePowerForChannel:0]));
        float progress = self.audioRecorder.currentTime / kMaximunRecordTimeInterval;
        [self.delegate recorderCurrentPeakPower:peakPower progress:progress];
    }

    if (self.audioRecorder.currentTime > kMaximunRecordTimeInterval) {
        [self stopRecording];
    }
}

- (void)resetTimer {
    if (!self.timer) {
        return;
    }

    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - AVAudioRecorderDelegate
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    self.recordFileURL = recorder.url;
    if ([self.delegate respondsToSelector:@selector(recordingDidFinish:)]) {
        [self.delegate recordingDidFinish:recorder];
    }

    [[AVAudioSession sharedInstance] setActive:NO error:nil];
    LOG(@"--- Finish Recording: %@", recorder.url);
}

@end

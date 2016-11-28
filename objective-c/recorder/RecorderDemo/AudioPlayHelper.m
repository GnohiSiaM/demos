#import "AudioPlayHelper.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioSession.h>

@interface AudioPlayHelper () <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, copy) NSURL *playingFileURL;

@end

@implementation AudioPlayHelper

#pragma mark - Lifecycle
- (void)dealloc {
    if ([self isProximityDetectorAvailable]) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIDeviceProximityStateDidChangeNotification
                                                      object:nil];
        [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
    }
}

- (id)init {
    if (self = [super init]) {
        if ([self isProximityDetectorAvailable]) {
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(sensorStateChange:)
                                                         name:UIDeviceProximityStateDidChangeNotification
                                                       object:nil];
            [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
        }
    }
    return self;
}

+ (AudioPlayHelper *)shareInstance {
    static AudioPlayHelper *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      shareInstance = [[AudioPlayHelper alloc] init];
    });
    return shareInstance;
}

#pragma mark - Proximity Detector
- (BOOL)isProximityDetectorAvailable {
    // 设置proximityMonitoringEnabled为YES之后若其仍为NO，则当前设备没有近距离传感器
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    return [UIDevice currentDevice].proximityMonitoringEnabled;
}

- (void)sensorStateChange:(NSNotificationCenter *)notification {
    // 手机若靠近面部，声音改为听筒输出，并关闭屏幕背光灯，否则声音外放并在播放结束时关闭传感器
    if ([UIDevice currentDevice].proximityState) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    } else {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        if (!self.audioPlayer || !self.audioPlayer.isPlaying) {
            [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
        }
    }
}

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
    if ([self.delegate respondsToSelector:@selector(audioDidStop:)]) {
        [self.delegate audioDidStop:self.audioPlayer];
    }
}

#pragma mark - Public Methods
- (BOOL)isPlaying {
    return self.audioPlayer ? self.audioPlayer.isPlaying : NO;
}

- (void)playAudioWithFile:(NSURL *)fileURL {
    if (!fileURL) {
        return;
    }
    
    // 不随静音键和屏幕关闭而静音
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];

    if (self.audioPlayer && self.playingFileURL && [self.playingFileURL isEqual:fileURL]) {
        [self.audioPlayer play];
    } else {
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
        self.audioPlayer.delegate = self;
        [self.audioPlayer play];
    }

    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    if ([self.delegate respondsToSelector:@selector(audioDidPlay:)]) {
        [self.delegate audioDidPlay:self.audioPlayer];
    }

    self.playingFileURL = fileURL;
}

- (void)pauseAudio {
    if (!self.audioPlayer) {
        return;
    }

    [self.audioPlayer pause];
    if ([self.delegate respondsToSelector:@selector(audioDidPause:)]) {
        [self.delegate audioDidPause:self.audioPlayer];
    }
}

- (void)stopAudio {
    if (self.audioPlayer && self.audioPlayer.isPlaying) {
        [self.audioPlayer stop];
    }

    self.playingFileURL = nil;
    [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
    if ([self.delegate respondsToSelector:@selector(audioDidStop:)]) {
        [self.delegate audioDidStop:self.audioPlayer];
    }
}

@end

#import "ViewController.h"
#import "AudioRecordHelper.h"
#import "AudioPlayHelper.h"

@interface ViewController () <AudioPlayHelperDelegate, AudioRecordHelperDelegate>

@property (weak, nonatomic) IBOutlet UIView *recordingView;
@property (weak, nonatomic) IBOutlet UIImageView *recordingSignalImageView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (nonatomic, weak) IBOutlet UIButton *playerButton;
@property (nonatomic, weak) IBOutlet UIButton *recorderButton;
@property (nonatomic, strong) AudioRecordHelper *audioRecordHelper;
@property (nonatomic, strong) AudioPlayHelper *audioPlayHelper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.audioRecordHelper = [AudioRecordHelper sharedInstance];
    self.audioRecordHelper.delegate = self;
    self.audioPlayHelper = [AudioPlayHelper shareInstance];
    self.audioPlayHelper.delegate = self;
}

- (IBAction)startOrStopRecording:(id)sender {
    if ([self.audioRecordHelper isRecording]) {
        [self.audioRecordHelper stopRecording];
        [self.recorderButton setTitle:@"开始录音" forState:UIControlStateNormal];
    } else {
        self.progressView.hidden = NO;
        self.recordingView.hidden = NO;
        [self.audioRecordHelper startRecording];
        [self.recorderButton setTitle:@"停止录音" forState:UIControlStateNormal];
    }
}

- (IBAction)cancelRecording:(id)sender {
    [self.audioRecordHelper cancelRecording];
    [self.recorderButton setTitle:@"开始录音" forState:UIControlStateNormal];
}

- (IBAction)clearCache:(id)sender {
    [self.audioRecordHelper removeAllRecordFiles];
}

- (IBAction)playOrPauseAudio:(id)sender {
    if ([self.audioPlayHelper isPlaying]) {
        [self.audioPlayHelper pauseAudio];
        [self.playerButton setTitle:@"开始播放" forState:UIControlStateNormal];
    } else if (self.audioRecordHelper.recordFileURL) {
        [self.audioPlayHelper playAudioWithFile:self.audioRecordHelper.recordFileURL];
        [self.playerButton setTitle:@"暂停播放" forState:UIControlStateNormal];
    }
}

- (IBAction)stopPlaying:(id)sender {
    [self.audioPlayHelper stopAudio];
}

- (UIImage *)getImageWithPeakPower:(CGFloat)peakPower {
    NSString *imageName = @"RecordingSignal00";
    if (peakPower < 0) {
        return nil;
    } else if (peakPower <= 0.3) {
        imageName = [imageName stringByAppendingString:@"1"];
    } else if (peakPower <= 0.4) {
        imageName = [imageName stringByAppendingString:@"2"];
    } else if (peakPower <= 0.5) {
        imageName = [imageName stringByAppendingString:@"3"];
    } else if (peakPower <= 0.6) {
        imageName = [imageName stringByAppendingString:@"4"];
    } else if (peakPower <= 0.7) {
        imageName = [imageName stringByAppendingString:@"5"];
    } else if (peakPower <= 0.8) {
        imageName = [imageName stringByAppendingString:@"6"];
    } else if (peakPower <= 0.9) {
        imageName = [imageName stringByAppendingString:@"7"];
    } else {
        imageName = [imageName stringByAppendingString:@"8"];
    }
    return [UIImage imageNamed:imageName];
}

#pragma mark - AudioRecordHelperDelegate
- (void)recorderCurrentPeakPower:(double)peakPower progress:(float)progress {
    self.progressView.progress = progress;
    self.recordingSignalImageView.image = [self getImageWithPeakPower:peakPower];
}

- (void)recordingDidFinish:(AVAudioRecorder *)recorder {
    [self.recorderButton setTitle:@"开始录音" forState:UIControlStateNormal];
    self.progressView.hidden = YES;
    self.recordingView.hidden = YES;
}

#pragma mark - AudioPlayHelperDelegate
- (void)audioDidStop:(AVAudioPlayer *)audioPlayer {
    [self.playerButton setTitle:@"开始播放" forState:UIControlStateNormal];
}

@end

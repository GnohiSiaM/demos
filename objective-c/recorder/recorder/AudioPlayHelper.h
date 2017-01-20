#import <Foundation/Foundation.h>
#import <AVFoundation/AVAudioPlayer.h>

@protocol AudioPlayHelperDelegate <NSObject>

@optional
- (void)audioDidPlay:(AVAudioPlayer *)audioPlayer;
- (void)audioDidStop:(AVAudioPlayer *)audioPlayer;
- (void)audioDidPause:(AVAudioPlayer *)audioPlayer;

@end

@interface AudioPlayHelper : NSObject

@property (nonatomic, assign) id<AudioPlayHelperDelegate> delegate;

+ (AudioPlayHelper *)shareInstance;
- (BOOL)isPlaying;
- (void)playAudioWithFile:(NSURL *)fileURL;
- (void)pauseAudio;
- (void)stopAudio;

@end
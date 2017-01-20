#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#ifdef DEBUG
#define LOG(fmt, ...) NSLog((@"%s [Line %d] ==> \n  " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define LOG(...) ;
#endif

@protocol AudioRecordHelperDelegate <NSObject>

@optional
- (void)recorderCurrentPeakPower:(double)peakPower progress:(float)progress;
- (void)recordingDidFinish:(AVAudioRecorder *)recorder;
@end

@interface AudioRecordHelper : NSObject

@property (nonatomic, assign) id<AudioRecordHelperDelegate> delegate;
@property (nonatomic, readonly) NSURL *recordFileURL;

+ (AudioRecordHelper *)sharedInstance;
- (BOOL)isRecording;
- (void)startRecording;
- (void)stopRecording;
- (void)cancelRecording;
- (void)removeAllRecordFiles;

@end

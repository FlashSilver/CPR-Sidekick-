//
//  UntrainViewController.h
//  voice
//
//  Created by zhangtianren on 11/15/15.
//  Copyright © 2015 zhangtianren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<QuartzCore/QuartzCore.h>
//#import "MCSoundBoard.h"
#import <AVFoundation/AVFoundation.h>

@interface UntrainViewController : UIViewController
<AVAudioPlayerDelegate>
{
    AVAudioPlayer* avAudioPlayer;
    NSTimer* timer;
    NSInteger seconds;
    NSTimer *timer2;
    int second;
    __weak IBOutlet UILabel *time;
}
@end

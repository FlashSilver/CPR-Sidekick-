//
//  ViewController.h
//  CPR Sidekick
//
//  Created by Kay Lab on 11/10/15.
//  Copyright © 2015 Kay Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

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


//
//  PulseView.h
//  CPR Sidekick
//
//  Created by Kay Lab on 11/11/15.
//  Copyright © 2015 Kay Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iflyMSC/iflyMSC.h"
#import "iflyMSC/IFlySpeechRecognizerDelegate.h"
#import "iflyMSC/IFlySpeechRecognizer.h"
#import<QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
@interface PulseView : UIViewController <IFlySpeechRecognizerDelegate,UIActionSheetDelegate>{
    IBOutlet UIImageView *pulse;
}

@property (nonatomic, strong) IFlySpeechRecognizer *iFlySpeechRecognizer;

@end

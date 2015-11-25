//
//  CPRTrained.h
//  CPR Sidekick
//
//  Created by zhangtianren on 11/15/15.
//  Copyright © 2015 Antonio Margheriti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import "iflyMSC/iflyMSC.h"
#import "iflyMSC/IFlySpeechRecognizerDelegate.h"
#import "iflyMSC/IFlySpeechRecognizer.h"

@interface CPRTrained : UIViewController <IFlySpeechRecognizerDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) IFlySpeechRecognizer *iFlySpeechRecognizer;

@end

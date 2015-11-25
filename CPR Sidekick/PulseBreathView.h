//
//  PulseBreathView.h
//  CPR Sidekick
//
//  Created by Antonio Margheriti on 11/12/15.
//  Copyright © 2015 Kay Lab. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "iflyMSC/iflyMSC.h"
#import "iflyMSC/IFlySpeechRecognizerDelegate.h"
#import "iflyMSC/IFlySpeechRecognizer.h"
#import<QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
@interface PulseBreathView : UIViewController <IFlySpeechRecognizerDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) IFlySpeechRecognizer *iFlySpeechRecognizer;

@end

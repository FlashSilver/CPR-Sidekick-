//
//  main.m
//  CPR Sidekick
//
//  Created by Antonio Margheriti on 11/13/15.
//  Copyright © 2015 Antonio Margheriti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "iflyMSC/iflyMSC.h"
#import "iflyMSC/IFlySpeechRecognizerDelegate.h"
#import "iflyMSC/IFlySpeechRecognizer.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",@"564697cb"];
        [IFlySpeechUtility createUtility:initString];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

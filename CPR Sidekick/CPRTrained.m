//
//  CPRTrained.m
//  CPR Sidekick
//
//  Created by zhangtianren on 11/15/15.
//  Copyright © 2015 Antonio Margheriti. All rights reserved.
//

#import "CPRTrained.h"
#import "ISRDataHelper.h"
#import "ViewController.h"
#import "UntrainViewController.h"

@interface CPRTrained ()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation CPRTrained

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [NSString stringWithFormat:@"%@/IfTrained.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [self.audioPlayer setDelegate:self];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer delegate];
    [self.audioPlayer play];
    
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",@"564697cb"];
    [IFlySpeechUtility createUtility:initString];
    // Do any additional setup after loading the view.
    if (self.iFlySpeechRecognizer == nil) {
        self.iFlySpeechRecognizer = [IFlySpeechRecognizer sharedInstance];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.iFlySpeechRecognizer cancel];
    [self.iFlySpeechRecognizer setDelegate:nil];
    [self.iFlySpeechRecognizer setParameter:@"" forKey:[IFlySpeechConstant PARAMS]];
    [self.audioPlayer stop];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.iFlySpeechRecognizer setParameter:IFLY_AUDIO_SOURCE_MIC forKey:@"audio_source"];
    
    [self.iFlySpeechRecognizer setParameter:@"json" forKey:[IFlySpeechConstant RESULT_TYPE]];
    
    [self.iFlySpeechRecognizer setParameter:@"en_us" forKey:[IFlySpeechConstant LANGUAGE]];
    [_iFlySpeechRecognizer setParameter:@"2500" forKey:[IFlySpeechConstant SPEECH_TIMEOUT]];
    [self.iFlySpeechRecognizer startListening];
    [self.iFlySpeechRecognizer setDelegate:self];
}

- (void) onResults:(NSArray *) results isLast:(BOOL)isLast
{
    NSMutableString *resultString = [[NSMutableString alloc] init];
    NSDictionary *dic = results[0];
    for (NSString *key in dic) {
        [resultString appendFormat:@"%@",key];
    }
    NSString * resultFromJson =  [ISRDataHelper stringFromJson:resultString];
    if([resultFromJson isEqualToString:@"Yes"])
    {
        ViewController *nextPage = (ViewController *)[self.storyboard instantiateViewControllerWithIdentifier: @"ViewController"];
        [self presentViewController:nextPage animated:YES completion:nil];
        
    }
    else if ([resultFromJson isEqualToString:@"No"])
    {
        UntrainViewController *nextPage = (UntrainViewController *)[self.storyboard instantiateViewControllerWithIdentifier: @"UntrainViewController"];
        [self presentViewController:nextPage animated:YES completion:nil];
    }
    else
    {
        [self.iFlySpeechRecognizer startListening];
    }
}

@end

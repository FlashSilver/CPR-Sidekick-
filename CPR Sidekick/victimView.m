//
//  victimView.m
//  CPR Sidekick
//
//  Created by Antonio Margheriti on 11/12/15.
//  Copyright © 2015 Kay Lab. All rights reserved.
//

#import "victimView.h"
#import "PulseView.h"
#import "YesBreathView.h"
#import "ISRDataHelper.h"

@interface victimView ()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@end

@implementation victimView

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [NSString stringWithFormat:@"%@/Responsive.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    
    // Create audio player object and initialize with URL to sound
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [self.audioPlayer setDelegate:self];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer delegate];
    [self.audioPlayer play];

    
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",@"564697cb"];
    [IFlySpeechUtility createUtility:initString];
    // Do any additional setup after loading the view, typically from a nib.
    if (self.iFlySpeechRecognizer == nil) {
        self.iFlySpeechRecognizer = [IFlySpeechRecognizer sharedInstance];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
        YesBreathView *nextPage = (YesBreathView *)[self.storyboard instantiateViewControllerWithIdentifier: @"YesBreathView"];
        [self presentViewController:nextPage animated:YES completion:nil];
        
    }
    else if ([resultFromJson isEqualToString:@"No"] || [resultFromJson isEqualToString:@"I don't know"] )
    {
        PulseView *nextPage = (PulseView *)[self.storyboard instantiateViewControllerWithIdentifier: @"PulseView"];
        [self presentViewController:nextPage animated:YES completion:nil];
    }
    else
    {
        [self.iFlySpeechRecognizer startListening];
    }
}
@end

//
//  NormalBreathViewController.m
//  CPR Sidekick
//
//  Created by zhangtianren on 11/16/15.
//  Copyright © 2015 Antonio Margheriti. All rights reserved.
//

#import "NormalBreathViewController.h"

@interface NormalBreathViewController ()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation NormalBreathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *path = [NSString stringWithFormat:@"%@/Monitor.mp3", [[NSBundle mainBundle] resourcePath]];
//    NSURL *soundUrl = [NSURL fileURLWithPath:path];
//    
//    
//    // Create audio player object and initialize with URL to sound
//    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
//    
//    [self.audioPlayer setDelegate: self];
//    [self.audioPlayer prepareToPlay];
//    [self.audioPlayer delegate];
//    [self.audioPlayer play];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.audioPlayer stop];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

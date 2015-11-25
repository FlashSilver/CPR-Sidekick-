//
//  PulseNormalBreathView.m
//  CPR Sidekick
//
//  Created by Antonio Margheriti on 11/12/15.
//  Copyright © 2015 Kay Lab. All rights reserved.
//

#import "PulseNormalBreathView.h"

@interface PulseNormalBreathView ()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation PulseNormalBreathView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *path = [NSString stringWithFormat:@"%@/Monitor.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [self.audioPlayer setDelegate:self];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer delegate];
    [self.audioPlayer play];

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

//
//  UntrainViewController.m
//  voice
//
//  Created by zhangtianren on 11/15/15.
//  Copyright © 2015 zhangtianren. All rights reserved.
//

#import "UntrainViewController.h"

@interface UntrainViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *Vent;
@property (weak, nonatomic) IBOutlet UIButton *stopbutton;
@property (weak, nonatomic) IBOutlet UILabel *Ventlabel;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation UntrainViewController
bool c=true;

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.Vent.hidden=YES;
    //self.Ventlabel.hidden=YES;
    
     self.Ventlabel.text=@"Start chest compressions!";
    //    [self.view addSubview: animatedImageView];
    
//    timer2= [NSTimer scheduledTimerWithTimeInterval:1.0f
//                                             target:self
//                                           selector:@selector(addTime)
//                                           userInfo:nil
//                                            repeats:YES];
    
    
    NSString *path = [NSString stringWithFormat:@"%@/StartCompressions.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    
    // Create audio player object and initialize with URL to sound
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [self.audioPlayer setDelegate:self];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer delegate];
    [self.audioPlayer play];
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
    if (c) {
        
        timer2= [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                 target:self
                                               selector:@selector(addTime)
                                               userInfo:nil
                                                repeats:YES];
        c=false;
        
    }
    
    self.Vent.animationImages = [NSArray arrayWithObjects:
                                 [UIImage imageNamed:@"cpr1.png"],
                                 
                                 
                                 [UIImage imageNamed:@"cpr2.png"], nil];
    
    self.Vent.animationDuration = 0.6f;
    
    self.Vent.animationRepeatCount = 0;
    
    [self.Vent startAnimating];

    
    //    self.Vent.hidden=NO;
    //    self.Ventlabel.hidden=NO;
    
    // [NSThread sleepForTimeInterval:3.0f];
    //[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timeaction) userInfo:nil repeats:NO];
    NSString *path = [NSString stringWithFormat:@"%@/heartbeats.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [self.audioPlayer setDelegate:self];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer delegate];
    [self.audioPlayer play];
}

//-(void)timeaction{
//    //[self.audioPlayer play];
//    //self.Vent.hidden=YES;
//    //self.Ventlabel.hidden=YES;
//    [self.audioPlayer play];
//    self.Ventlabel.text=@"Continue chest compressions!";
//}
- (IBAction)stop:(id)sender {
    if (self.audioPlayer.isPlaying) {
        [self.audioPlayer stop];
        [self.stopbutton setTitle:@"Resume" forState:UIControlStateNormal];
        [self.Vent stopAnimating];
        
    }else{
        [self.audioPlayer play];
        [self.Vent startAnimating];
        [self.stopbutton setTitle:@"Stop" forState:UIControlStateNormal];

}



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.audioPlayer stop];
        c=true;
    
}
- (void)addTime
{
    seconds++;
    time.text = [NSString stringWithFormat:@"Time: %is", seconds];
}
@end

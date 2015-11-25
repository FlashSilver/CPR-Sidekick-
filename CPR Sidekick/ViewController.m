//
//  ViewController.m
//  CPR Sidekick
//
//  Created by Kay Lab on 11/10/15.
//  Copyright © 2015 Kay Lab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *stopbutton;
@property (weak, nonatomic) IBOutlet UITextView *Ventlabel;
@property (weak, nonatomic) IBOutlet UIImageView *Vent;


@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer2;
@end

@implementation ViewController
bool a=false;
bool h=true;

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.Vent.hidden=YES;
    //self.Ventlabel.hidden=YES;
    NSString *path = [NSString stringWithFormat:@"%@/StartCompressions.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
  
//    [NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(aftersay) userInfo:nil repeats:NO];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [self.audioPlayer setDelegate:self];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer delegate];
    [self.audioPlayer play];
    
   }


-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{

    if (a) {
        [self.Vent stopAnimating];
        self.Ventlabel.text=@"Administer 2 rescue breaths!";
        self.Vent.animationImages = [NSArray arrayWithObjects:
                                     [UIImage imageNamed:@"breath1.png"],
                                     
                                     
                                     [UIImage imageNamed:@"breath2.png"], nil];
        
        self.Vent.animationDuration = 3.5f;
        
        self.Vent.animationRepeatCount = 2;
        
        [self.Vent startAnimating];

        NSString *path = [NSString stringWithFormat:@"%@/Breath.mp3", [[NSBundle mainBundle] resourcePath]];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        [self.audioPlayer setDelegate:self];
        [self.audioPlayer prepareToPlay];
        [self.audioPlayer delegate];
        [self.audioPlayer play];
        a=false;

    }else{
        if (h) {
            timer2= [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                     target:self
                                                   selector:@selector(addTime)
                                                   userInfo:nil
                                                    repeats:YES];
            h=false;

        }
        self.Vent.animationImages = [NSArray arrayWithObjects:
                                     [UIImage imageNamed:@"cpr1.png"],
                                     
                                     
                                     [UIImage imageNamed:@"cpr2.png"], nil];
        
        self.Vent.animationDuration = 0.6f;
        
        self.Vent.animationRepeatCount = 0;
        
        [self.Vent startAnimating];
        self.Ventlabel.text=@"Start chest compressions!";
        //    [self.view addSubview: animatedImageView];
        

        NSString *path = [NSString stringWithFormat:@"%@/heartbeats.mp3", [[NSBundle mainBundle] resourcePath]];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
        // Create audio player object and initialize with URL to sound
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        [self.audioPlayer setDelegate:self];
        [self.audioPlayer prepareToPlay];
        [self.audioPlayer delegate];
        [self.audioPlayer play];
         a=true;
    }

}




//-(void)timeaction{
//    //[self.audioPlayer play];
//    //self.Vent.hidden=YES;
//    //self.Ventlabel.hidden=YES;
//    
//    self.Vent.animationImages = [NSArray arrayWithObjects:
//                                 [UIImage imageNamed:@"cpr1.png"],
//                                 
//                                 
//                                 [UIImage imageNamed:@"cpr2.png"], nil];
//    
//    self.Vent.animationDuration = 0.6f;
//    
//    self.Vent.animationRepeatCount = 0;
//    
//    NSString *path = [NSString stringWithFormat:@"%@/heartbeats.mp3", [[NSBundle mainBundle] resourcePath]];
//    NSURL *soundUrl = [NSURL fileURLWithPath:path];
//
//    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
//    
//    [self.audioPlayer setDelegate:self];
//    [self.audioPlayer prepareToPlay];
//    [self.audioPlayer delegate];
//
//    [self.audioPlayer play];
//    [self.Vent startAnimating];
//    self.Ventlabel.text=@"Continue chest compressions!";
//}


- (IBAction)stop:(id)sender {
    if (self.audioPlayer.isPlaying) {
        [timer2 invalidate];
        [self.audioPlayer stop];
        [self.stopbutton setTitle:@"Resume" forState:UIControlStateNormal];
        [self.Vent stopAnimating];
    }else{
        [self.audioPlayer play];
        [self.Vent startAnimating];
        [self.stopbutton setTitle:@"Stop" forState:UIControlStateNormal];
        timer2= [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                 target:self
                                               selector:@selector(addTime)
                                               userInfo:nil
                                                repeats:YES];
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.audioPlayer stop];
    [self.audioPlayer2 stop];
    a=false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addTime
{
    seconds++;
    time.text = [NSString stringWithFormat:@"Time: %is", seconds];
}
@end

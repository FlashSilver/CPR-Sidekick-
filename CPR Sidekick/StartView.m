//
//  StartView.m
//  CPR Sidekick
//
//  Created by Kay Lab on 11/11/15.
//  Copyright © 2015 Kay Lab. All rights reserved.
//

#import "StartView.h"

@interface StartView ()

@end

@implementation StartView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *Question = [[UILabel alloc] initWithFrame: CGRectMake(130, 180, 400, 40)];
    Question.text = @"Is victim responsive?";
    
    UIButton *Yes =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Yes setTitle:@"Yes" forState:UIControlStateNormal];
    
    UIButton *No =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [No setTitle:@"No" forState:UIControlStateNormal];
    
    UIButton *Unsure =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Unsure setTitle:@"Unsure" forState:UIControlStateNormal];
    
    
    Yes.frame = CGRectMake(30,300, 100,40);
    No.frame = CGRectMake(160, 300,100,40);
    Unsure.frame = CGRectMake(290, 300,100,40);

    
    [self.view addSubview:Question];
    [self.view addSubview:Yes];
    [self.view addSubview:No];
    [self.view addSubview:Unsure];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

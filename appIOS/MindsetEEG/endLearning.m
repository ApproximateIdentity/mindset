//
//  endLearning.m
//  MindsetEEG
//
//  Created by Quentin Le Corre on 18/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import "endLearning.h"

@interface endLearning ()

@end

@implementation endLearning
@synthesize thumbUp;
@synthesize CongratsTitle;
@synthesize subtitle;
@synthesize doneButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}


@end

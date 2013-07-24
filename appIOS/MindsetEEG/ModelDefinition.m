//
//  ModelDefinition.m
//  MindsetEEG
//
//  Created by Quentin Le Corre on 26/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import "ModelDefinition.h"

UIButton *previousModel;

@interface ModelDefinition ()

@end

@implementation ModelDefinition
@synthesize model1;
@synthesize model2;
@synthesize model3;
@synthesize model4;
@synthesize NextButton;


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
        previousModel = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ClickedModel:(UIButton *)sender{
    if (![previousModel isEqual:nil]) {
        [previousModel setTitleColor:[UIColor colorWithRed:(50/255.0) green:(79/255.0) blue:(133/255.0) alpha:1] forState:UIControlStateNormal];
        previousModel.titleLabel.font=[UIFont fontWithName:@"Helvetica-Light" size:15];
    }
    previousModel = sender;
    [previousModel setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    previousModel.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:15];
}

@end

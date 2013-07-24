//
//  defineState.m
//  MindsetEEG
//
//  Created by Quentin Le Corre on 18/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import "defineState.h"
#import "XYZAppDelegate.h"

UIButton *previousName;

@interface defineState ()

@end

@implementation defineState
@synthesize titleThink;
@synthesize switchButton;
@synthesize concept1;
@synthesize concept2;
@synthesize concept3;
@synthesize concept4;
@synthesize concept5;
@synthesize concept6;
@synthesize concept7;
@synthesize concept8;

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
    [self.concept1 setTitle:nameCpt1 forState:UIControlStateNormal];
    [self.concept2 setTitle:nameCpt2 forState:UIControlStateNormal];
    [self.concept3 setTitle:nameCpt3 forState:UIControlStateNormal];
    [self.concept4 setTitle:nameCpt4 forState:UIControlStateNormal];
    [self.concept5 setTitle:nameCpt5 forState:UIControlStateNormal];
    [self.concept6 setTitle:nameCpt6 forState:UIControlStateNormal];
    [self.concept7 setTitle:nameCpt7 forState:UIControlStateNormal];
    [self.concept8 setTitle:nameCpt8 forState:UIControlStateNormal];
    previousName = nil;
    self.switchButton.on = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ClickedConcept:(UIButton *)sender{
    if (![previousName isEqual:nil]) {
        //self.switchButton.on = true;
        [previousName setTitleColor:[UIColor colorWithRed:(50/255.0) green:(79/255.0) blue:(133/255.0) alpha:1] forState:UIControlStateNormal];
        previousName.titleLabel.font=[UIFont fontWithName:@"Helvetica-Light" size:15];
    }
    previousName = sender;
    [previousName setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    previousName.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:15];
    
   
    NSString *response  = @"command";
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
    NSString *response1  = [NSString stringWithFormat:@"setLabel=%@", previousName.titleLabel.text];
	NSData *data1 = [[NSData alloc] initWithData:[response1 dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data1 bytes] maxLength:[data1 length]];
}

- (IBAction)ChangeStatus:(UISwitch *)sender{
    NSString *response  = @"command";
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
    
    NSString *response1;
    /*
    if (self.switchButton.on == false) {
        response1  = @"dataGather=off";
        //[previousName setTitleColor:[UIColor colorWithRed:(50/255.0) green:(79/255.0) blue:(133/255.0) alpha:1] forState:UIControlStateNormal];
        //previousName.titleLabel.font=[UIFont fontWithName:@"Helvetica-Light" size:15];
        //previousName = nil;
    }
    else{
        response1  = @"dataGather=on";
    }
    */
    response1 = @"toggleDataGather"; 
	NSData *data1 = [[NSData alloc] initWithData:[response1 dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data1 bytes] maxLength:[data1 length]];
}

@end

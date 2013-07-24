//
//  ConceptDefinition.m
//  MindsetEEG
//
//  Created by Quentin Le Corre on 18/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import "ConceptDefinition.h"
#import "XYZAppDelegate.h"

NSString *nameCpt1;
NSString *nameCpt2;
NSString *nameCpt3;
NSString *nameCpt4;
NSString *nameCpt5;
NSString *nameCpt6;
NSString *nameCpt7;
NSString *nameCpt8;

CGFloat animatedDistance;

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

@interface ConceptDefinition ()

@end

@implementation ConceptDefinition
@synthesize Title;
@synthesize concept1;
@synthesize concept2;
@synthesize concept3;
@synthesize concept4;
@synthesize concept5;
@synthesize concept6;
@synthesize concept7;
@synthesize concept8;
@synthesize RunButton;

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect textFieldRect =
    [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y
    - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
    * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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

- (IBAction)RunClicked:(UIButton *)sender
{
    if ([self.concept1.text length]>0) {
        nameCpt1 = self.concept1.text;
    }
    else{
        nameCpt1 = @"Concept 1";
    }
    
    if ([self.concept2.text length]>0) {
        nameCpt2 = self.concept2.text;
    }
    else{
        nameCpt2 = @"Concept 2";
    }
    
    if ([self.concept3.text length]>0) {
        nameCpt3 = self.concept3.text;
    }
    else{
        nameCpt3 = @"Concept 3";
    }
    
    if ([self.concept4.text length]>0) {
        nameCpt4 = self.concept4.text;
    }
    else{
        nameCpt4 = @"Concept 4";
    }
    
    if ([self.concept5.text length]>0) {
        nameCpt5 = self.concept5.text;
    }
    else{
        nameCpt5 = @"Concept 5";
    }
    
    if ([self.concept6.text length]>0) {
        nameCpt6 = self.concept6.text;
    }
    else{
        nameCpt6 = @"Concept 6";
    }
    
    if ([self.concept7.text length]>0) {
        nameCpt7 = self.concept7.text;
    }
    else{
        nameCpt7 = @"Concept 7";
    }
    
    if ([self.concept8.text length]>0) {
        nameCpt8 = self.concept8.text;
    }
    else{
        nameCpt8 = @"Concept 8";
    }
    
}

@end
//
//  XYZFirstViewController.h
//  MindsetEEG
//
//  Created by Quentin Le Corre on 03/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZFirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLearning;
@property (weak, nonatomic) IBOutlet UITextView *subtitleLearning;

@property (weak, nonatomic) IBOutlet UIButton *buttonLearning;
- (IBAction)changeMode:(id)sender;
@end

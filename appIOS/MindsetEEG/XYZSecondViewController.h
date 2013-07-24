//
//  XYZSecondViewController.h
//  MindsetEEG
//
//  Created by Quentin Le Corre on 03/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZSecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titlePredicting;
@property (weak, nonatomic) IBOutlet UITextView *subtitlePredicting;
@property (weak, nonatomic) IBOutlet UIButton *buttonPredicting;
- (IBAction)changeMode:(id)sender;

@end

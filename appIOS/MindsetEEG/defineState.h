//
//  defineState.h
//  MindsetEEG
//
//  Created by Quentin Le Corre on 18/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConceptDefinition.h"

extern UIButton *previousName;


@interface defineState : UIViewController{
    IBOutlet UILabel *titleThink;
    IBOutlet UISwitch *switchButton;
    IBOutlet UIButton *concept1;
    IBOutlet UIButton *concept2;
    IBOutlet UIButton *concept3;
    IBOutlet UIButton *concept4;
    IBOutlet UIButton *concept5;
    IBOutlet UIButton *concept6;
    IBOutlet UIButton *concept7;
    IBOutlet UIButton *concept8;
}
@property (strong, nonatomic) UILabel *titleThink;
@property (strong, nonatomic) UISwitch *switchButton;
@property (strong, nonatomic) UIButton *concept1;
@property (strong, nonatomic) UIButton *concept2;
@property (strong, nonatomic) UIButton *concept3;
@property (strong, nonatomic) UIButton *concept4;
@property (strong, nonatomic) UIButton *concept5;
@property (strong, nonatomic) UIButton *concept6;
@property (strong, nonatomic) UIButton *concept7;
@property (strong, nonatomic) UIButton *concept8;
- (IBAction)ClickedConcept:(UIButton *)sender;
- (IBAction)ChangeStatus:(UISwitch *)sender;
@end



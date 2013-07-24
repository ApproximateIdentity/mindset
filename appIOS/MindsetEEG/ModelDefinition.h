//
//  ModelDefinition.h
//  MindsetEEG
//
//  Created by Quentin Le Corre on 26/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import <UIKit/UIKit.h>

extern UIButton *previousModel;

@interface ModelDefinition : UIViewController{
    UIButton *model1;
    UIButton *model2;
    UIButton *model3;
    UIButton *model4;
    UIButton *NextButton;
}
@property (strong, nonatomic) IBOutlet UIButton *model1;
@property (strong, nonatomic) IBOutlet UIButton *model2;
@property (strong, nonatomic) IBOutlet UIButton *model3;
@property (strong, nonatomic) IBOutlet UIButton *model4;
@property (strong, nonatomic) IBOutlet UIButton *NextButton;
- (IBAction)ClickedModel:(UIButton *)sender;
@end

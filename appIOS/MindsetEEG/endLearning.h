//
//  endLearning.h
//  MindsetEEG
//
//  Created by Quentin Le Corre on 18/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface endLearning : UIViewController{
    IBOutlet UIImageView *thumbUp;
    IBOutlet UILabel *CongratsTitle;
    IBOutlet UILabel *subtitle;
    IBOutlet UIButton *doneButton;
}
@property (strong, nonatomic) IBOutlet UIImageView *thumbUp;
@property (strong, nonatomic) IBOutlet UILabel *CongratsTitle;
@property (strong, nonatomic) IBOutlet UILabel *subtitle;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@end

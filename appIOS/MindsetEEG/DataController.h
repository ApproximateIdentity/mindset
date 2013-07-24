//
//  DataController.h
//  MindsetEEG
//
//  Created by Quentin Le Corre on 16/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataController : UIViewController{
    NSArray *data;
    IBOutlet UIProgressView *statusCpt1;
    IBOutlet UIProgressView *statusCpt2;
    IBOutlet UIProgressView *statusCpt3;
    IBOutlet UIProgressView *statusCpt4;
    IBOutlet UIProgressView *statusCpt5;
    IBOutlet UIProgressView *statusCpt6;
    IBOutlet UIProgressView *statusCpt7;
    IBOutlet UIProgressView *statusCpt8;
    IBOutlet UILabel *name1;
    IBOutlet UILabel *name2;
    IBOutlet UILabel *name3;
    IBOutlet UILabel *name4;
    IBOutlet UILabel *name5;
    IBOutlet UILabel *name6;
    IBOutlet UILabel *name7;
    IBOutlet UILabel *name8;
    IBOutlet UIButton *doneButton;
}
@property (strong, nonatomic) IBOutlet UILabel *TitleData;
@property (strong, nonatomic) IBOutlet UIProgressView *statusCpt1;
@property (strong, nonatomic) IBOutlet UIProgressView *statusCpt2;
@property (strong, nonatomic) IBOutlet UIProgressView *statusCpt3;
@property (strong, nonatomic) IBOutlet UIProgressView *statusCpt4;
@property (strong, nonatomic) IBOutlet UIProgressView *statusCpt5;
@property (strong, nonatomic) IBOutlet UIProgressView *statusCpt6;
@property (strong, nonatomic) IBOutlet UIProgressView *statusCpt7;
@property (strong, nonatomic) IBOutlet UIProgressView *statusCpt8;
@property (strong, nonatomic) IBOutlet UILabel *name1;
@property (strong, nonatomic) IBOutlet UILabel *name2;
@property (strong, nonatomic) IBOutlet UILabel *name3;
@property (strong, nonatomic) IBOutlet UILabel *name4;
@property (strong, nonatomic) IBOutlet UILabel *name5;
@property (strong, nonatomic) IBOutlet UILabel *name6;
@property (strong, nonatomic) IBOutlet UILabel *name7;
@property (strong, nonatomic) IBOutlet UILabel *name8;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;

@end

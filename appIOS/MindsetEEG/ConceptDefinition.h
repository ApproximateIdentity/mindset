//
//  ConceptDefinition.h
//  MindsetEEG
//
//  Created by Quentin Le Corre on 18/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *nameCpt1;
extern NSString *nameCpt2;
extern NSString *nameCpt3;
extern NSString *nameCpt4;
extern NSString *nameCpt5;
extern NSString *nameCpt6;
extern NSString *nameCpt7;
extern NSString *nameCpt8;

@protocol Delegation;

@interface ConceptDefinition : UIViewController {
    IBOutlet UILabel *Title;
    IBOutlet UITextField *concept1;
    IBOutlet UITextField *concept2;
    IBOutlet UITextField *concept3;
    IBOutlet UITextField *concept4;
    IBOutlet UITextField *concept5;
    IBOutlet UITextField *concept6;
    IBOutlet UITextField *concept7;
    IBOutlet UITextField *concept8;
    IBOutlet UIButton *RunButton;
}
@property (strong, nonatomic) IBOutlet UILabel *Title;
@property (strong, nonatomic) IBOutlet UITextField *concept1;
@property (strong, nonatomic) IBOutlet UITextField *concept2;
@property (strong, nonatomic) IBOutlet UITextField *concept3;
@property (strong, nonatomic) IBOutlet UITextField *concept4;
@property (strong, nonatomic) IBOutlet UITextField *concept5;
@property (strong, nonatomic) IBOutlet UITextField *concept6;
@property (strong, nonatomic) IBOutlet UITextField *concept7;
@property (strong, nonatomic) IBOutlet UITextField *concept8;
@property (strong, nonatomic) IBOutlet UIButton *RunButton;
- (IBAction)RunClicked:(UIButton *)sender;
@end

@protocol Delegation <NSObject>
@end




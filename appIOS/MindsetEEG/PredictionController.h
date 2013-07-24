//
//  PredictionController.h
//  MindsetEEG
//
//  Created by Quentin Le Corre on 26/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customTable.h"

@interface PredictionController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    UILabel *PredictTitle;
    customTable *myPredictionTable;
    UIButton *NextButton;
    UIButton *ModelButton;
    NSArray *prediction;
}
@property (strong, nonatomic) IBOutlet UILabel *PredictTitle;
@property (strong, nonatomic) IBOutlet customTable *myPredictionTable;
@property (strong, nonatomic) IBOutlet UIButton *NextButton;
@property (strong, nonatomic) IBOutlet UIButton *ModelButton;
@property (strong, nonatomic) NSArray *prediction;

@end

//
//  customCell.h
//  MindsetEEG
//
//  Created by Quentin Le Corre on 26/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customCell : UITableViewCell{
    UILabel *myLabel;
}
@property (strong, nonatomic) IBOutlet UILabel *myLabel;

@end

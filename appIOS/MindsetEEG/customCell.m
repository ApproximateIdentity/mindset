//
//  customCell.m
//  MindsetEEG
//
//  Created by Quentin Le Corre on 26/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import "customCell.h"

@implementation customCell
@synthesize myLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

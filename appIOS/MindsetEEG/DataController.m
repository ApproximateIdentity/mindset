//
//  DataController.m
//  MindsetEEG
//
//  Created by Quentin Le Corre on 16/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import "DataController.h"

@interface DataController ()

@end

@implementation DataController
@synthesize statusCpt1;
@synthesize statusCpt2;
@synthesize statusCpt3;
@synthesize statusCpt4;
@synthesize statusCpt5;
@synthesize statusCpt6;
@synthesize statusCpt7;
@synthesize statusCpt8;
@synthesize name1;
@synthesize name2;
@synthesize name3;
@synthesize name4;
@synthesize name5;
@synthesize name6;
@synthesize name7;
@synthesize name8;
@synthesize doneButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}


@end

//
//  PredictionController.m
//  MindsetEEG
//
//  Created by Quentin Le Corre on 26/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import "PredictionController.h"
#import "customTable.h"
#import "customCell.h"

@interface PredictionController ()

@end

@implementation PredictionController
@synthesize PredictTitle;
@synthesize myPredictionTable;
@synthesize NextButton;
@synthesize ModelButton;
@synthesize prediction;

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
	// Do any additional setup after loading the view.
    self.prediction =
    @[@"Dog", @"Cat", @"Car", @"House", @"Dark Vader", @"X-wing", @"Stratovarius", @"DeadMau5", @"Plan B", @"Armin van Buuren", @"Columbia", @"Pasta", @"Linkin Park", @"Furious 6", @"The Town", @"New York", @"Paris"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    myPredictionTable.delegate=self;
    myPredictionTable.dataSource=self;
    [super viewWillAppear:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [prediction count];
}



- (customCell *)tableView:(customTable*)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    customCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    aCell.myLabel.text = self.prediction[indexPath.row];
    return aCell;
}

@end

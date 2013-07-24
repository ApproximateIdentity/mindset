//
//  ViewController.m
//  MindsetEEG
//
//  Created by Quentin Le Corre on 04/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import "ViewController.h"
#import "customCollectionCell.h"

@interface ViewController ()

@end

@implementation ViewController

// Delegate Methods

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger) collectionView:(UICollectionView *) CollectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell*) collectionView: (UICollectionView *) collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    customCollectionCell * aCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    
    aCell.myLabel.text = self.dataArray[indexPath.row];
    
    return aCell;
}


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
    self.dataArray =
    @[@"Jan.", @"Feb.", @"Mar.", @"Apr.", @"May", @"Jun.", @"Jul.", @"Aug.", @"Sept.", @"Oct.", @"Nov.", @"Dec."];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

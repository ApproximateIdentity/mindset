//
//  ViewController.h
//  MindsetEEG
//
//  Created by Quentin Le Corre on 04/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *myCollection;

@property (strong, nonatomic) NSArray* dataArray;
@end

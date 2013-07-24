//
//  XYZAppDelegate.h
//  MindsetEEG
//
//  Created by Quentin Le Corre on 03/05/13.
//  Copyright (c) 2013 Quentin Le Corre. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTTPServer;

NSInputStream *inputStream;
NSOutputStream *outputStream;

@interface XYZAppDelegate : UIResponder <UIApplicationDelegate, NSStreamDelegate>{
}

@property (strong, nonatomic) UIWindow *window;

@end

//
//  NurserySmileTabVC.h
//  NurserySmile
//
//  Created by Adam Dossa on 03/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NurserySmileTabBarVC : UITabBarController
@property (nonatomic, strong) NSSet* children; // of Child
@property (nonatomic, strong) NSDate* queryDate;
@end

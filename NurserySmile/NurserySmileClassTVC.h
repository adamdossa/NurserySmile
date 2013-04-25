//
//  NurserySmileClassTVC.h
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "School.h"
#import "CoreDataTableViewController.h"

@interface NurserySmileClassTVC : CoreDataTableViewController
@property (nonatomic, strong) NSString* school;
@property (nonatomic, strong) NSDate* queryDate;
@end

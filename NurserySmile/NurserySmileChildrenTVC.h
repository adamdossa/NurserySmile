//
//  NurserySmileChildrenTVC.h
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
#import "Classroom.h"

@interface NurserySmileChildrenTVC : CoreDataTableViewController

@property (nonatomic, strong) Classroom* classroom;
@property (nonatomic, strong) NSDate* queryDate;
@property (nonatomic, strong, readonly) NSMutableSet* selectedChildren; //of Strings

@end

//
//  NurserySmileDateTVC.h
//  NurserySmile
//
//  Created by Adam Dossa on 09/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"

@interface NurserySmileDateTVC : UITableViewController
@property (nonatomic, strong) NSString* school;
@property (nonatomic, strong) NSArray* date; //of NSDate
@end

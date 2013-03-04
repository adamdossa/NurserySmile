//
//  NurserySmileChildrenTVC.h
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NurserySmileClass.h"

@interface NurserySmileChildrenTVC : UITableViewController

@property (nonatomic, strong) NurserySmileClass* nurseryClass;
@property (nonatomic, strong, readonly) NSMutableSet* selectedChildren; //of Strings

@end

//
//  NurserySmileDiaperPopover.h
//  NurserySmile
//
//  Created by Adam Dossa on 05/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataEntrySegueVC.h"

@interface NurserySmileDiaperPopover : DataEntrySegueVC
@property (weak, nonatomic) IBOutlet UISegmentedControl *diaperType;
@property (weak, nonatomic) IBOutlet UIButton *diaperCream;
@property (weak, nonatomic) IBOutlet UIDatePicker *diaperTime;

@end

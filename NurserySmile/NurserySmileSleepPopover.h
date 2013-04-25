//
//  NurserySmileSleepPopover.h
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "DataEntrySegueVC.h"

@interface NurserySmileSleepPopover : DataEntrySegueVC
@property (weak, nonatomic) IBOutlet UIDatePicker *startTime;
@property (weak, nonatomic) IBOutlet UIDatePicker *duration;
@end

//
//  NurserySmileMilkPopover.h
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "DataEntrySegueVC.h"

@interface NurserySmileMilkPopover : DataEntrySegueVC
@property (weak, nonatomic) IBOutlet UITextField *milkOunces;
@property (weak, nonatomic) IBOutlet UIDatePicker *milkTime;
@property (weak, nonatomic) IBOutlet UIStepper *milkStepper;

@end

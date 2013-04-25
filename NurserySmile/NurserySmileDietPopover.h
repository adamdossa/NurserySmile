//
//  NurserySmileDietPopover.h
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "DataEntrySegueVC.h"

@interface NurserySmileDietPopover : DataEntrySegueVC
@property (weak, nonatomic) IBOutlet UIPickerView *mealType;
@property (weak, nonatomic) IBOutlet UIPickerView *drinkType;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mealAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *drinkAmount;
@property (weak, nonatomic) IBOutlet UIDatePicker *mealTime;

@end

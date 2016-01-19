//
//  NurserySmileReminderPopover.m
//  NurserySmile
//
//  Created by Adam Dossa on 25/04/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileReminderPopover.h"
#import "Reminder.h"
#import "Child.h"

@interface NurserySmileReminderPopover () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSString *reminderText;
@end

@implementation NurserySmileReminderPopover 

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 7;
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString*) reminderText
{
    if (!_reminderText){
        _reminderText = @"Diapers";
    }
    return _reminderText;
}


- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    NSArray* reminderTypes = @[@"Diapers",@"Ointment/Cream",@"Wipes",@"Jar Food/Cereal",@"Formula/Breastmilk",@"Back-up Clothing",@"Bedding"];

    return reminderTypes[row];
        
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    NSArray* reminderTypes = @[@"Diapers",@"Ointment/Cream",@"Wipes",@"Jar Food/Cereal",@"Formula/Breastmilk",@"Back-up Clothing",@"Bedding"];
    self.reminderText = reminderTypes[row];
}

- (void) processNurseryEvent
{
    for (Child *child in self.children) {
        Reminder *reminder = [NSEntityDescription insertNewObjectForEntityForName:@"Reminder" inManagedObjectContext:self.managedObjectContext];
        reminder.reminderText = self.reminderText;
        reminder.date = [self day];
        [child addRemindersObject:reminder];
    }
}

@end

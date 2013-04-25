//
//  NurserySmileDietPopover.m
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileDietPopover.h"
#import "Diet.h"
#import "Child.h"

@interface NurserySmileDietPopover () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSString* mealTypeText;
@property (nonatomic, strong) NSString* drinkTypeText;
@end

@implementation NurserySmileDietPopover

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.mealType) {
        return 5;
    }
    if (pickerView == self.drinkType) {
        return 3;
    }
    return 1;
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString*) mealTypeText
{
    if (!_mealTypeText){
        _mealTypeText = @"Breakfast";
    }
    return _mealTypeText;
}

- (NSString*) drinkTypeText
{
    if (!_drinkTypeText){
        _drinkTypeText = @"Water";
    }
    return _drinkTypeText;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    NSArray* mealTypes = @[@"Breakfast",@"Early Snack",@"Lunch",@"Late Snack",@"Dinner"];
    NSArray* drinkTypes = @[@"Water",@"Juice",@"Milk"];
                  
    if (pickerView == self.mealType) {
        return mealTypes[row];
    }
    if (pickerView == self.drinkType) {
        return drinkTypes[row];
    }
    return @"";

}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    NSArray* mealTypes = @[@"Breakfast",@"Early Snack",@"Lunch",@"Late Snack",@"Dinner"];
    NSArray* drinkTypes = @[@"Water",@"Juice",@"Milk"];
    if (pickerView == self.mealType) {
        self.mealTypeText = mealTypes[row];
    }
    if (pickerView == self.drinkType) {
        self.drinkTypeText = drinkTypes[row];
    }
}

- (void) processNurseryEvent
{
    for (Child *child in self.children) {
        Diet *diet = [NSEntityDescription insertNewObjectForEntityForName:@"Diet" inManagedObjectContext:self.managedObjectContext];
        diet.mealType = self.mealTypeText;
        diet.drinkType = self.drinkTypeText;
        diet.mealAmount = [self.mealAmount titleForSegmentAtIndex: [self.mealAmount selectedSegmentIndex]];
        diet.drinkAmount = [self.drinkAmount titleForSegmentAtIndex: [self.drinkAmount selectedSegmentIndex]];
        diet.date = [self day];
        diet.mealTime = [self.mealTime date];
        [child addDietsObject:diet];
    }
}

@end

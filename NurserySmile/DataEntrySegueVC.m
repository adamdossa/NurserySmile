//
//  DataEntrySegueVC.m
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "DataEntrySegueVC.h"

@interface DataEntrySegueVC ()

@end

@implementation DataEntrySegueVC 

- (void) processNurseryEvent
{
    //abstract
}

- (IBAction)save:(UIButton *)sender {
    [self processNurseryEvent];
    [self.delegate processNewDataEntry];
}

- (NSDate*)boundaryForCalendarUnit:(NSCalendarUnit)calendarUnit
{
    NSDate *boundary;
    [[NSCalendar currentCalendar] rangeOfUnit:calendarUnit startDate:&boundary interval:NULL forDate:[NSDate date]];
    return boundary;
}

- (NSDate*)day
{
    return [self boundaryForCalendarUnit:NSDayCalendarUnit];
}

@end

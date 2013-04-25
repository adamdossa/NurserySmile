//
//  NurserySmileDateTVC.m
//  NurserySmile
//
//  Created by Adam Dossa on 09/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileDateTVC.h"
#import "Milk.h"
#import "DiaperChange.h"
#import "Sleep.h"
#import "Diet.h"
#import "Comment.h"
#import "Reminder.h"
#import "NSManagedObject+MagicalRequests.h"

@interface NurserySmileDateTVC ()

@end

@implementation NurserySmileDateTVC

- (void) viewDidLoad
{
    [super viewDidLoad];
    //Initialize our model
    NSMutableSet *uniqueDates = [[NSMutableSet alloc] init];
    NSArray *eventObjects = [Milk MR_findAll];
    for (Milk *event in eventObjects) {
        NSDate *eventDate = event.date;
        if (eventDate) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
            [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
            NSString *eventDateString = [dateFormatter stringFromDate:eventDate];
            [uniqueDates addObject:[dateFormatter dateFromString:eventDateString]];
        }
    }
    eventObjects = [DiaperChange MR_findAll];
    for (DiaperChange *event in eventObjects) {
        NSDate *eventDate = event.date;
        if (eventDate) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
            [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
            NSString *eventDateString = [dateFormatter stringFromDate:eventDate];
            [uniqueDates addObject:[dateFormatter dateFromString:eventDateString]];
        }
    }
    eventObjects = [Milk MR_findAll];
    for (Milk *event in eventObjects) {
        NSDate *eventDate = event.date;
        if (eventDate) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
            [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
            NSString *eventDateString = [dateFormatter stringFromDate:eventDate];
            [uniqueDates addObject:[dateFormatter dateFromString:eventDateString]];
        }
    }
    eventObjects = [Diet MR_findAll];
    for (Diet *event in eventObjects) {
        NSDate *eventDate = event.date;
        if (eventDate) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
            [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
            NSString *eventDateString = [dateFormatter stringFromDate:eventDate];
            [uniqueDates addObject:[dateFormatter dateFromString:eventDateString]];
        }
    }
    eventObjects = [Comment MR_findAll];
    for (Comment *event in eventObjects) {
        NSDate *eventDate = event.date;
        if (eventDate) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
            [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
            NSString *eventDateString = [dateFormatter stringFromDate:eventDate];
            [uniqueDates addObject:[dateFormatter dateFromString:eventDateString]];
        }
    }
    eventObjects = [Reminder MR_findAll];
    for (Reminder *event in eventObjects) {
        NSDate *eventDate = event.date;
        if (eventDate) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
            [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
            NSString *eventDateString = [dateFormatter stringFromDate:eventDate];
            [uniqueDates addObject:[dateFormatter dateFromString:eventDateString]];
        }
    }
    
    self.date = [NSArray arrayWithArray:[uniqueDates allObjects]];
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void) setSchool:(NSString *)school
{
    _school = school;
    self.title = school;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.date count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DateCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    NSString *eventDateString = [dateFormatter stringFromDate:self.date[indexPath.item]];
    
    cell.textLabel.text = eventDateString;
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = nil;
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        indexPath = [self.tableView indexPathForCell:sender];
    }
    
    if (indexPath) {
        if ([segue.identifier isEqualToString:@"ClassFromDateSegue"]) {
            NSDate *queryDate = self.date[indexPath.item];
            if ([segue.destinationViewController respondsToSelector:@selector(setSchool:)]) {
                [segue.destinationViewController performSelector:@selector(setSchool:) withObject:self.school];
            }
            if ([segue.destinationViewController respondsToSelector:@selector(setQueryDate:)]) {
                [segue.destinationViewController performSelector:@selector(setQueryDate:) withObject:queryDate];
            }
        }
    }
}


@end

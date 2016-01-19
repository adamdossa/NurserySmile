//
//  NurserySmileReportTVC.m
//  NurserySmile
//
//  Created by Adam Dossa on 26/04/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "NurserySmileReportTVC.h"
#import "Child.h"
#import "DiaperChange.h"
#import "Milk.h"
#import "Comment.h"
#import "Reminder.h"
#import "Diet.h"
#import "Sleep.h"
#import "Base64.h"

@interface NurserySmileReportTVC ()
//Model variables
@property (nonatomic, strong) NSMutableDictionary *eventDict;
//Could move the below to local variables
@property (nonatomic, strong) NSArray *diaperChanges;
@property (nonatomic, strong) NSArray *milks;
@property (nonatomic, strong) NSArray *diets;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) NSArray *reminders;
@property (nonatomic, strong) NSArray *sleeps;
@end

@implementation NurserySmileReportTVC

@synthesize children = _children;

- (void) viewDidLoad
{
    [self.progressView setProgress:0.0f];
}

- (IBAction)sendReports:(UIBarButtonItem *)sender {
    //Iterate over selected children and send reports

    NSArray *origChildren = self.children;
    NSDate *saveDate = [self day];
    if (self.queryDate) {
        saveDate = self.queryDate;
    }
    dispatch_queue_t q = dispatch_queue_create("report saving queue", NULL);

    float childrenNumber = [self.children count];
    [self.progressView setProgress:0.0f];
    for (Child *child in self.children) {
        self.children = [[NSArray alloc] initWithObjects:child, nil];
        UIImage *report = [self generateImage];
        dispatch_async(q, ^{                //Check if there is an existing report card
            PFQuery *reportQuery = [PFQuery queryWithClassName:@"ReportCard"];
            [reportQuery whereKey:@"child" equalTo:child.name];
            [reportQuery whereKey:@"date" equalTo:saveDate];
            NSArray *reportResults = [reportQuery findObjects];
            PFObject *reportCard = nil;
            if ([reportResults count]) {
                reportCard = reportResults[0];
            } else {
                reportCard = [PFObject objectWithClassName:@"ReportCard"];
            }
            [reportCard setObject:child.name forKey:@"child"];
            [reportCard setObject:saveDate forKey:@"date"];
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd-mm-yyyy"];
            NSString *dateString = [dateFormatter stringFromDate:saveDate];
            NSString *fileName = [NSString stringWithFormat:@"%@_%@.png", [child.name stringByReplacingOccurrencesOfString:@" " withString:@""], dateString];
            NSData *photoData = UIImagePNGRepresentation(report);
            [Base64 initialize];
            NSString *photoEncoded = [Base64 encode:photoData];
            PFFile *reportImage = [PFFile fileWithName:fileName data:photoData];
            [reportCard setObject:reportImage forKey:@"report"];
            [reportCard setObject:photoEncoded forKey:@"stringReport"];
            [reportCard save];
            float progress = [self.progressView progress];
            progress = progress + (1/childrenNumber);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.progressView setProgress:progress];
            });
        });
    }
    self.children = origChildren;

}

+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

#pragma mark - Table view data source

- (void) setChildren:(NSArray *)children
{
    _children = children;
    [self refreshModel];
}

- (NSArray *) children
{
    if (!_children) {
        _children = [[NSArray alloc] init];
    }
    return _children;
}

- (NSMutableDictionary*) eventDict
{
    if (!_eventDict) {
        _eventDict = [[NSMutableDictionary alloc] init];
    }
    return _eventDict;
}

- (void) refreshModel
{

    //Setup model here
    NSDate *date = [self day];
    if (self.queryDate) {
        date = self.queryDate;
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"child IN %@ AND date = %@", self.children, date];
    
    self.diaperChanges = [DiaperChange MR_findAllWithPredicate:predicate];
    self.milks = [Milk MR_findAllWithPredicate:predicate];
    self.comments = [Comment MR_findAllWithPredicate:predicate];
    self.diets = [Diet MR_findAllWithPredicate:predicate];
    self.reminders = [Reminder MR_findAllWithPredicate:predicate];
    self.sleeps = [Sleep MR_findAllWithPredicate:predicate];
    
    //Build dictionary
    for (Child *child in self.children) {
        //Create empty mutable array for each child in dictionary
        //Assume names are unique... hmmm...
        [self.eventDict setObject:[[NSMutableArray alloc] init] forKey:child.name];
    }
    //For each event, add it to the relevant key
    for (Reminder *event in self.reminders) {
        Child *child = event.child;
        NSMutableArray *childEvents = self.eventDict[child.name];
        [childEvents addObject:event];
    }
    for (DiaperChange *event in self.diaperChanges) {
        Child *child = event.child;
        NSMutableArray *childEvents = self.eventDict[child.name];
        [childEvents addObject:event];
    }
    for (Diet *event in self.diets) {
        Child *child = event.child;
        NSMutableArray *childEvents = self.eventDict[child.name];
        [childEvents addObject:event];
    }
    for (Milk *event in self.milks) {
        Child *child = event.child;
        NSMutableArray *childEvents = self.eventDict[child.name];
        [childEvents addObject:event];
    }
    for (Sleep *event in self.sleeps) {
        Child *child = event.child;
        NSMutableArray *childEvents = self.eventDict[child.name];
        [childEvents addObject:event];
    }
    for (Comment *event in self.comments) {
        Child *child = event.child;
        NSMutableArray *childEvents = self.eventDict[child.name];
        [childEvents addObject:event];
    }
    [self.tableView reloadData];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self refreshModel];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.children count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    Child *child = self.children[section];
    NSMutableArray *childEvents = self.eventDict[child.name];
    return [childEvents count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Child *child = self.children[section];
    return child.name;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Get the relevant event
    Child *child = self.children[indexPath.section];
    NSMutableArray *childEvents = self.eventDict[child.name];
    NSManagedObject *event = childEvents[indexPath.item];
    //Now do a case statement based on the class of event
    UITableViewCell *cell = nil;

    if ([event isKindOfClass:[DiaperChange class]]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"DiaperChangeReportInfo" forIndexPath:indexPath];
        DiaperChange *eventType = (DiaperChange*) event;
        cell.textLabel.text = [self getTextForIndexPath:indexPath andEvent:event];
        NSDate *startTime = (NSDate*) eventType.startTime;
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"hh:mm a"];
        NSString *timeString = [dateFormatter stringFromDate:startTime];
        cell.detailTextLabel.text = [@"Time: " stringByAppendingString:timeString];
    }
    if ([event isKindOfClass:[Milk class]]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"MilkReportInfo" forIndexPath:indexPath];
        Milk *eventType = (Milk*) event;
        NSDate *startTime = eventType.startTime;
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"hh:mm a"];
        NSString *timeString = [dateFormatter stringFromDate:startTime];
        cell.textLabel.text = [self getTextForIndexPath:indexPath andEvent:event];
        cell.detailTextLabel.text = [@"Time: " stringByAppendingString:timeString];
    }
    if ([event isKindOfClass:[Diet class]]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"DietReportInfo" forIndexPath:indexPath];
        Diet *eventType = (Diet*) event;
        // Configure the cell
        NSDate *mealTime = eventType.mealTime;
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"hh:mm a"];
        NSString *mealTimeString = [dateFormatter stringFromDate:mealTime];
        cell.textLabel.text = [self getTextForIndexPath:indexPath andEvent:event];
        cell.detailTextLabel.text = [@"Time: " stringByAppendingString:mealTimeString];

    }
    if ([event isKindOfClass:[Sleep class]]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"SleepReportInfo" forIndexPath:indexPath];
        Sleep *eventType = (Sleep*) event;
        
        NSDate *startTime = eventType.startTime;
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"hh:mm a"];
        NSString *timeString = [dateFormatter stringFromDate:startTime];
        cell.textLabel.text = [self getTextForIndexPath:indexPath andEvent:event];
        cell.detailTextLabel.text = [@"Start Time: " stringByAppendingString:timeString];
    }
    if ([event isKindOfClass:[Reminder class]]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ReminderReportInfo" forIndexPath:indexPath];
        cell.textLabel.text = [self getTextForIndexPath:indexPath andEvent:event];
        cell.detailTextLabel.text = @"Reminder";
    }
    if ([event isKindOfClass:[Comment class]]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CommentReportInfo" forIndexPath:indexPath];
        Comment *eventType = (Comment*) event;
        // Configure the cell
        cell.textLabel.text = [self getTextForIndexPath:indexPath andEvent:event];        
        NSDate *commentTime = eventType.commentTime;
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"hh:mm a"];
        NSString *timeString = [dateFormatter stringFromDate:commentTime];
        cell.detailTextLabel.text = timeString;
        
        NSData *photoData = eventType.photo;
    
        if (photoData) {
            cell.imageView.image = [[UIImage alloc] initWithData:photoData];
        } else {
            cell.imageView.image = nil;
        }
    }
    // Configure the cell...
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    UIImage *cellImage = cell.imageView.image;
    cell.imageView.image = [NurserySmileReportTVC scale:cellImage toSize:CGSizeMake(70, 70)];
    [cell.imageView setContentMode:UIViewContentModeScaleAspectFill];
    return cell;
}

- (NSString *) getTextForIndexPath: (NSIndexPath*) indexPath andEvent: (NSManagedObject*) event
{
    if ([event isKindOfClass:[DiaperChange class]]) {
        DiaperChange *eventType = (DiaperChange*) event;
        NSString *typeString = eventType.type;
        NSNumber *cream = eventType.cream;
        int creamBool = [cream intValue];
        if (creamBool > 0) {
            typeString = [typeString stringByAppendingString:@": Cream Used"];
        }
        return typeString;
    }
    if ([event isKindOfClass:[Milk class]]) {
        Milk *eventType = (Milk*) event;
        NSNumber *ounces = eventType.ounces;
        NSString *ouncesString = [NSString stringWithFormat:@"Ounces %2.2f",[ounces doubleValue]];
        return ouncesString;
    }
    if ([event isKindOfClass:[Diet class]]) {
        Diet *eventType = (Diet*) event;
        NSString *mealType = eventType.mealType;
        NSString *drinkType = eventType.drinkType;
        NSString *mealAmount = eventType.mealAmount;
        NSString *drinkAmount = eventType.drinkAmount;
        
        return [NSString stringWithFormat:@"%@: %@, %@: %@", mealType, mealAmount, drinkType, drinkAmount];
        
    }
    if ([event isKindOfClass:[Sleep class]]) {
        Sleep *eventType = (Sleep*) event;
        NSNumber *duration = eventType.duration;
        NSString *durationString = [self stringFromTimeInterval:[duration doubleValue]];
        return [@"Duration: " stringByAppendingString:durationString];
    }
    if ([event isKindOfClass:[Reminder class]]) {
        Reminder *eventType = (Reminder*) event;
        NSString *reminderText = eventType.reminderText;
        return [@"Please bring: " stringByAppendingString:reminderText];
    }
    if ([event isKindOfClass:[Comment class]]) {
        Comment *eventType = (Comment*) event;
        NSString *commentString = eventType.comment;
        return commentString;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Get the relevant event
    Child *child = self.children[indexPath.section];
    NSMutableArray *childEvents = self.eventDict[child.name];
    NSManagedObject *event = childEvents[indexPath.item];

    NSString *text = [self getTextForIndexPath:indexPath andEvent:event];
    //Need to set width depending on whether there is a photo indicator
    float width = 500;
    CGSize size = [text sizeWithFont:[UIFont fontWithName:@"Helvetica" size:18] constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    int height = size.height + 30;
    if (height < 80) {
        height = 80;
    }
    return height;
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSInteger ti = (NSInteger)interval;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02i:%02i", hours, minutes];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}
     
     
 - (NSDate*)day
{
    return [self boundaryForCalendarUnit:NSDayCalendarUnit];
}
 
 - (NSDate*)boundaryForCalendarUnit:(NSCalendarUnit)calendarUnit
{
    NSDate *boundary;
    [[NSCalendar currentCalendar] rangeOfUnit:calendarUnit startDate:&boundary interval:NULL forDate:[NSDate date]];
    return boundary;
}

- (UIImage*) generateImage
{
    CGRect frame = self.tableView.frame;
    CGRect origFrame = frame;
    frame.size.height = self.tableView.contentSize.height;
    self.tableView.frame = frame;
    
    UIGraphicsBeginImageContext(self.tableView.bounds.size);
    [self.tableView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *saveImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.tableView.frame = origFrame;
    return saveImage;
}

@end

//
//  ReminderViewController.m
//  NurserySmile
//
//  Created by Adam Dossa on 25/04/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "ReminderViewController.h"
#import "NurserySmileTabBarVC.h"
#import "NurserySmileReminderInfo.h"
#import "NurserySmileInfoHeader.h"
#import "Child.h"
#import "Reminder.h"

@interface ReminderViewController ()

@end

@implementation ReminderViewController

- (NSFetchRequest *) getFetchRequest
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reminder"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"child.name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)], [NSSortDescriptor sortDescriptorWithKey:@"reminderText" ascending:YES ]];
    request.predicate = [NSPredicate predicateWithFormat:@"child IN %@", self.children];
    return request;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileReminderInfo *cell = [self.reportCards dequeueReusableCellWithReuseIdentifier:@"ReminderInfo" forIndexPath:indexPath];
    Reminder *reminder = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.reminderLabel.text = [@"Please bring: " stringByAppendingString:reminder.reminderText];
    if ([self.selectedReports containsObject:reminder]) {
        cell.forDelete = YES;
        [cell setNeedsDisplay];
    } else {
        cell.forDelete = NO;
        [cell setNeedsDisplay];
    }
    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileInfoHeader *header = nil;
    
    if ([kind isEqual:UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                    withReuseIdentifier:@"InfoHeader"
                                                           forIndexPath:indexPath];
        Reminder *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
        header.headerLabel.text = event.child.name;
    }
    return header;
}

@end

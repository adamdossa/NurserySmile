//
//  SleepViewController.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "SleepViewController.h"
#import "NurserySmileSleepInfo.h"
#import "NurserySmileInfoHeader.h"
#import "Child.h"
#import "Sleep.h"


@interface SleepViewController ()
@end

@implementation SleepViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSFetchRequest *) getFetchRequest
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Sleep"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"child.name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)], [NSSortDescriptor sortDescriptorWithKey:@"startTime" ascending:YES ]];
    request.predicate = [NSPredicate predicateWithFormat:@"child IN %@", self.children];
    return request;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileSleepInfo *cell = [self.reportCards dequeueReusableCellWithReuseIdentifier:@"SleepInfo" forIndexPath:indexPath];
    Sleep *sleep = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm a"];
    cell.startTime.text = [formatter stringFromDate:sleep.startTime];
    cell.duration.text = [@"Duration: " stringByAppendingString:[self stringFromTimeInterval:[sleep.duration doubleValue]]];
    cell.startTime.textAlignment = NSTextAlignmentCenter;
    cell.duration.textAlignment = NSTextAlignmentCenter;
    
    if ([self.selectedReports containsObject:sleep]) {
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
        Sleep *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
        header.headerLabel.text = event.child.name;
    }
    return header;
}


@end

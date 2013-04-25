//
//  DiaperViewController.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "DiaperViewController.h"
#import "NurserySmileInfoHeader.h"
#import "NurserySmileDiaperInfo.h"
#import "Child.h"
#import "DiaperChange.h"

@interface DiaperViewController ()
@end

@implementation DiaperViewController

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
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"DiaperChange"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"child.name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)], [NSSortDescriptor sortDescriptorWithKey:@"startTime" ascending:YES ]];
    return request;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NurserySmileDiaperInfo *cell = [self.reportCards dequeueReusableCellWithReuseIdentifier:@"DiaperInfo" forIndexPath:indexPath];
    DiaperChange *diaperChange = [self.fetchedResultsController objectAtIndexPath:indexPath];
    if (diaperChange.creamValue) {
        cell.diaperLabel.text = [@"Cream + " stringByAppendingString:diaperChange.type];
    } else {
        cell.diaperLabel.text = diaperChange.type;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm a"];
    cell.diaperTime.text = [formatter stringFromDate:diaperChange.startTime];
    cell.diaperTime.textAlignment = NSTextAlignmentCenter;
    cell.diaperLabel.textAlignment = NSTextAlignmentCenter;
    if ([self.selectedReports containsObject:diaperChange]) {
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
        DiaperChange *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
        header.headerLabel.text = event.child.name;
    }
    return header;
}

@end

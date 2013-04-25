//
//  MilkViewController.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "MilkViewController.h"
#import "NurserySmileTabBarVC.h"
#import "NurserySmileMilkInfo.h"
#import "NurserySmileInfoHeader.h"
#import "Child.h"
#import "Milk.h"


@interface MilkViewController ()
@end

@implementation MilkViewController

- (NSFetchRequest *) getFetchRequest
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Milk"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"child.name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)], [NSSortDescriptor sortDescriptorWithKey:@"startTime" ascending:YES ]];
    request.predicate = [NSPredicate predicateWithFormat:@"child IN %@", self.children];
    return request;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileMilkInfo *cell = [self.reportCards dequeueReusableCellWithReuseIdentifier:@"MilkInfo" forIndexPath:indexPath];
    Milk *milk = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm a"];
    cell.milkTime.text = [formatter stringFromDate:milk.startTime];
    cell.milkAmount.text = [NSString stringWithFormat:@"Ounces: %@", milk.ounces];
    cell.milkAmount.textAlignment = NSTextAlignmentCenter;
    cell.milkTime.textAlignment = NSTextAlignmentCenter;
    if ([self.selectedReports containsObject:milk]) {
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
        Milk *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
        header.headerLabel.text = event.child.name;
    }
    return header;
}


@end

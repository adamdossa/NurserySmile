//
//  DietViewController.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "DietViewController.h"
#import "NurserySmileTabBarVC.h"
#import "NurserySmileInfoHeader.h"
#import "NurserySmileDietInfo.h"
#import "Diet.h"

@interface DietViewController ()

@end

@implementation DietViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSFetchRequest *) getFetchRequest
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Diet"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"child.name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)], [NSSortDescriptor sortDescriptorWithKey:@"mealTime" ascending:YES ]];
    request.predicate = [NSPredicate predicateWithFormat:@"child IN %@", self.children];
    return request;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileDietInfo *cell = [self.reportCards dequeueReusableCellWithReuseIdentifier:@"DietInfo" forIndexPath:indexPath];
    Diet *diet = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.mealType.text = [NSString stringWithFormat:@"%@: %@",diet.mealType,diet.mealAmount];
    cell.drinkType.text = [NSString stringWithFormat:@"%@: %@",diet.drinkType,diet.drinkAmount];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm a"];
    cell.mealTime.text = [formatter stringFromDate:diet.mealTime];
    cell.mealTime.textAlignment = NSTextAlignmentCenter;
    cell.mealType.textAlignment = NSTextAlignmentCenter;
    cell.drinkType.textAlignment = NSTextAlignmentCenter;
    if ([self.selectedReports containsObject:diet]) {
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
        Diet *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
        header.headerLabel.text = event.child.name;
    }
    return header;
}


@end

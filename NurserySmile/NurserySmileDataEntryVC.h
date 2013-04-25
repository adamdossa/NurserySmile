//
//  NurserySmileDataEntryVC.h
//  NurserySmile
//
//  Created by Adam Dossa on 05/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataEntrySegueVC.h"
#import "Child.h"

@interface NurserySmileDataEntryVC : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, DataEntrySegueDelegate, NSFetchedResultsControllerDelegate>
@property (nonatomic, strong) NSArray* children; //of Child
@property (nonatomic, strong) NSDate* queryDate;
@property (weak, nonatomic) IBOutlet UICollectionView *reportCards;
@property (nonatomic, strong) NSMutableArray* selectedReports;
@property (nonatomic, strong) UIViewController *popoverVC;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *deleteTBButton;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addNewButton;
- (NSFetchRequest *) getFetchRequest;
- (NSString *) stringFromTimeInterval: (NSTimeInterval) interval;
- (NSDate *) day;
@end
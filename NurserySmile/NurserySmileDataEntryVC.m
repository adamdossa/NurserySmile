//
//  NurserySmileDataEntryVC.m
//  NurserySmile
//
//  Created by Adam Dossa on 05/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//
//#import "UICollectionView+NSFetchedResultsController.h"
#import "NurserySmileDataEntryVC.h"
#import "NurserySmileInfoHeader.h"
#import "NurserySmileInfo.h"
#import "Child.h"

@interface NurserySmileDataEntryVC ()
@property (nonatomic, strong) UIPopoverController *popover;
@end

@implementation NurserySmileDataEntryVC{
    NSMutableArray *_objectChanges;
    NSMutableArray *_sectionChanges;
}

@synthesize children = _children;
@synthesize selectedReports = _selectedReports;

- (IBAction)deleteButton:(UIBarButtonItem *)sender {
    for (NSManagedObject* event in self.selectedReports) {
        [event MR_deleteEntity];
    }
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
    [[FTASyncHandler sharedInstance] syncWithCompletionBlock:nil progressBlock:nil];
    self.selectedReports = nil;
}

- (NSArray *) children
{
    if (!_children) {
        _children = [[NSArray alloc] init];
    }
    return _children;
}

- (void)performFetch
{
    if (self.fetchedResultsController) {
        NSError *error;
        [self.fetchedResultsController performFetch:&error];
        if (error) NSLog(@"[%@ %@] %@ (%@)", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error localizedDescription], [error localizedFailureReason]);
    } else {
        NSLog(@"[%@ %@] no NSFetchedResultsController (yet?)", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
    [self.reportCards reloadData];
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


- (void)setFetchedResultsController:(NSFetchedResultsController *)newfrc
{
    NSFetchedResultsController *oldfrc = _fetchedResultsController;
    if (newfrc != oldfrc) {
        _fetchedResultsController = newfrc;
        newfrc.delegate = self;
        if ((!self.title || [self.title isEqualToString:oldfrc.fetchRequest.entity.name]) && (!self.navigationController || !self.navigationItem.title)) {
            self.title = newfrc.fetchRequest.entity.name;
        }
        if (newfrc) {
            [self performFetch];
        } else {
            [self.reportCards reloadData];
        }
    }
}

- (void) setChildren:(NSArray *)children
{
    _children = children;
    self.selectedReports = nil;
    BOOL enableChange = TRUE;
    if (self.queryDate) {
        enableChange = FALSE;
    }
    self.addNewButton.enabled = enableChange;
    self.deleteTBButton.enabled = enableChange;
    [self setupFetchedResultsController];
}

-(NSManagedObjectContext*) managedObjectContext
{
    return [NSManagedObjectContext MR_defaultContext];
}

- (NSFetchRequest *) getFetchRequest
{
    return nil;
}

- (void)setupFetchedResultsController
{
    if (self.managedObjectContext) {
        if (self.fetchedResultsController) {
            NSFetchRequest *request = [self.fetchedResultsController fetchRequest];
            NSDate *date = [self day];
            if (self.queryDate) {
                date = self.queryDate;
            }
            request.predicate = [NSPredicate predicateWithFormat:@"child IN %@ AND date = %@", self.children, date];
            [self performFetch];
            //request = [self getFetchRequest];
            //self.fetchedResultsController.delegate = nil;
        } else {
            NSFetchRequest *request = [self getFetchRequest];
            NSDate *date = [self day];
            if (self.queryDate) {
                date = self.queryDate;
            }
            request.predicate = [NSPredicate predicateWithFormat:@"child IN %@ AND date = %@", self.children, date];
            NSManagedObjectContext *context = self.managedObjectContext;
            self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:@"child.name" cacheName:nil];
        }
    } else {
        self.fetchedResultsController = nil;
    }
}

- (void) processNewDataEntry
{
    [self.popover dismissPopoverAnimated:YES];
//    [[FTASyncHandler sharedInstance] syncWithCompletionBlock:nil progressBlock:nil];
//    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveInBackgroundCompletion:^{
//        [[FTASyncHandler sharedInstance] syncWithCompletionBlock:nil progressBlock:nil];
//    }];
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
    [[FTASyncHandler sharedInstance] syncWithCompletionBlock:nil progressBlock:nil];
//    [[NSManagedObjectContext MR_defaultContext] MR_saveInBackgroundCompletion:^{
//        [[FTASyncHandler sharedInstance] syncWithCompletionBlock:nil progressBlock:nil];
//    }];
//    [[FTASyncHandler sharedInstance] syncWithCompletionBlock:^{
//        [[NSManagedObjectContext MR_defaultContext] MR_save];
//    }progressBlock:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DataEntrySegue"]) {
        if ([segue isKindOfClass:[UIStoryboardPopoverSegue class]]) {
            self.popover = ((UIStoryboardPopoverSegue *) segue).popoverController;
            DataEntrySegueVC *contentVC = (DataEntrySegueVC *) self.popover.contentViewController;
            contentVC.delegate = self;
            contentVC.managedObjectContext = self.managedObjectContext;
            contentVC.children = self.children;
            [self.reportCards reloadData];
        }
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([self.children count] && !self.popover.popoverVisible) {
        return YES;
    } else {
        return NO;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)asker
{
    return  [[self.fetchedResultsController sections] count];
}

- (NSInteger)collectionView:(UICollectionView *)asker
     numberOfItemsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


- (NSMutableArray*) selectedReports
{
    if (!_selectedReports) {
        _selectedReports = [[NSMutableArray alloc] init];
    }
    return _selectedReports;
}

- (void) setSelectedReports:(NSMutableArray *)selectedReports
{
    //Resync cells
    _selectedReports = selectedReports;
    NSArray *cells = [self.reportCards visibleCells];
    for (NurserySmileInfo *cell in cells) {
        NSIndexPath *indexPath = [self.reportCards indexPathForCell:cell];
        NSManagedObject *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
        if ([selectedReports containsObject:event]) {
            cell.forDelete = YES;
            [cell setNeedsDisplay];
        } else {
            cell.forDelete = NO;
            [cell setNeedsDisplay];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.reportCards.allowsMultipleSelection = YES;
    _objectChanges = [NSMutableArray array];
    _sectionChanges = [NSMutableArray array];
    BOOL enableChange = TRUE;
    if (self.queryDate) {
        enableChange = FALSE;
    }
    self.addNewButton.enabled = enableChange;
    self.deleteTBButton.enabled = enableChange;

    
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.selectedReports = nil;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileInfo *cell = (NurserySmileInfo *)[collectionView cellForItemAtIndexPath:indexPath];
    NSManagedObject *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.forDelete = YES;
    [cell setNeedsDisplay];
    [self.selectedReports addObject:event];
}

- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileInfo* cell = (NurserySmileInfo *)[collectionView cellForItemAtIndexPath:indexPath];
    NSManagedObject *event = [self.fetchedResultsController objectAtIndexPath:indexPath];    
    cell.forDelete = NO;
    [cell setNeedsDisplay];
    [self.selectedReports removeObject:event];
    
}
//
//- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
//{
//    // do nothing
//}
//
//- (void)controller:(NSFetchedResultsController *)controller
//  didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
//           atIndex:(NSUInteger)sectionIndex
//     forChangeType:(NSFetchedResultsChangeType)type
//{
//    [self.reportCards addChangeForSection:sectionInfo
//                                     atIndex:sectionIndex
//                               forChangeType:type];
//}
//
//- (void)controller:(NSFetchedResultsController *)controller
//   didChangeObject:(id)anObject
//       atIndexPath:(NSIndexPath *)indexPath
//     forChangeType:(NSFetchedResultsChangeType)type
//      newIndexPath:(NSIndexPath *)newIndexPath
//{
//    [self.reportCards addChangeForObjectAtIndexPath:indexPath
//                                         forChangeType:type
//                                          newIndexPath:newIndexPath];
//}
//
//- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
//{
//    [self.reportCards commitChanges];
//}
//
//
//
//
//
- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    
    NSMutableDictionary *change = [NSMutableDictionary new];
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            change[@(type)] = @(sectionIndex);
            break;
        case NSFetchedResultsChangeDelete:
            change[@(type)] = @(sectionIndex);
            break;
        case NSFetchedResultsChangeUpdate:
            change[@(type)] = @(sectionIndex);
            break;
            
    }
    
    [_sectionChanges addObject:change];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    
    NSMutableDictionary *change = [NSMutableDictionary new];
    switch(type)
    {
        case NSFetchedResultsChangeInsert:
            change[@(type)] = newIndexPath;
            break;
        case NSFetchedResultsChangeDelete:
            change[@(type)] = indexPath;
            break;
        case NSFetchedResultsChangeUpdate:
            change[@(type)] = indexPath;
            break;
        case NSFetchedResultsChangeMove:
            change[@(type)] = @[indexPath, newIndexPath];
            break;
    }
    [_objectChanges addObject:change];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.reportCards reloadData];

//    if (([_sectionChanges count] > 0) || ([_objectChanges count] > 0))
//    {
//        [self.reportCards performBatchUpdates:^{
//            
//            for (NSDictionary *change in _sectionChanges)
//            {
//                [change enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, id obj, BOOL *stop) {
//                    
//                    NSFetchedResultsChangeType type = [key unsignedIntegerValue];
//                    switch (type)
//                    {
//                        case NSFetchedResultsChangeInsert:
//                            [self.reportCards insertSections:[NSIndexSet indexSetWithIndex:[obj unsignedIntegerValue]]];
//                            break;
//                        case NSFetchedResultsChangeDelete:
//                            [self.reportCards deleteSections:[NSIndexSet indexSetWithIndex:[obj unsignedIntegerValue]]];
//                            break;
//                        case NSFetchedResultsChangeUpdate:
//                            [self.reportCards reloadSections:[NSIndexSet indexSetWithIndex:[obj unsignedIntegerValue]]];
//                            break;
//                    }
//                }];
//            }
//            for (NSDictionary *change in _objectChanges)
//            {
//                [change enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, id obj, BOOL *stop) {
//                    
//                    NSFetchedResultsChangeType type = [key unsignedIntegerValue];
//                    switch (type)
//                    {
//                        case NSFetchedResultsChangeInsert:
//                            [self.reportCards insertItemsAtIndexPaths:@[obj]];
//                            break;
//                        case NSFetchedResultsChangeDelete:
//                            [self.reportCards deleteItemsAtIndexPaths:@[obj]];
//                            break;
//                        case NSFetchedResultsChangeUpdate:
//                            [self.reportCards reloadItemsAtIndexPaths:@[obj]];
//                            break;
//                        case NSFetchedResultsChangeMove:
//                            [self.reportCards moveItemAtIndexPath:obj[0] toIndexPath:obj[1]];
//                            break;
//                    }
//                }];
//            }
//        } completion:nil];
//    }
//    
//    if ([_objectChanges count] > 0) && [_sectionChanges count] == 0)
//    {
//        
//        if ([self shouldReloadCollectionViewToPreventKnownIssue]) {
//            // This is to prevent a bug in UICollectionView from occurring.
//            // The bug presents itself when inserting the first object or deleting the last object in a collection view.
//            // http://stackoverflow.com/questions/12611292/uicollectionview-assertion-failure
//            // This code should be removed once the bug has been fixed, it is tracked in OpenRadar
//            // http://openradar.appspot.com/12954582
//            [self.reportCards reloadData];
//            
//        }
//    }
    
    [_sectionChanges removeAllObjects];
    [_objectChanges removeAllObjects];
}

- (BOOL)shouldReloadCollectionViewToPreventKnownIssue {
    __block BOOL shouldReload = NO;
    for (NSDictionary *change in _objectChanges) {
        [change enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSFetchedResultsChangeType type = [key unsignedIntegerValue];
            NSIndexPath *indexPath = obj;
            switch (type) {
                case NSFetchedResultsChangeInsert:
                    if ([self.reportCards numberOfItemsInSection:indexPath.section] == 0) {
                        shouldReload = YES;
                    } else {
                        shouldReload = NO;
                    }
                    break;
                case NSFetchedResultsChangeDelete:
                    if ([self.reportCards numberOfItemsInSection:indexPath.section] == 1) {
                        shouldReload = YES;
                    } else {
                        shouldReload = NO;
                    }
                    break;
                case NSFetchedResultsChangeUpdate:
                    shouldReload = NO;
                    break;
                case NSFetchedResultsChangeMove:
                    shouldReload = NO;
                    break;
            }
        }];
    }
    
    return shouldReload;
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSInteger ti = (NSInteger)interval;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02i:%02i", hours, minutes];
}

@end

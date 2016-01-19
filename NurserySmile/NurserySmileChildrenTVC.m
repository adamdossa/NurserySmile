//
//  NurserySmileChildrenTVC.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileChildrenTVC.h"
#import "NurserySmileTabBarVC.h"
#import "Child.h"

@interface NurserySmileChildrenTVC () <UISplitViewControllerDelegate>
@property (nonatomic, strong, readwrite) NSMutableSet* selectedChildren; //of NurserySmileChild
@end

@implementation NurserySmileChildrenTVC

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.selectedChildren = [[NSMutableSet alloc] init];
    NurserySmileTabBarVC *detailVC = [self.splitViewController.viewControllers lastObject];
    detailVC.queryDate = self.queryDate;
    detailVC.children = self.selectedChildren;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
}

-(void) setClassroom:(Classroom *)classroom
{
    _classroom = classroom;
    self.title = classroom.name;
    [self setupFetchedResultsController];
}
- (IBAction)selectAll:(UIBarButtonItem *)sender {
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:FALSE];
    NSUInteger numberOfSections = [self.tableView numberOfSections];
    for (NSUInteger s = 0; s < numberOfSections; ++s) {
        NSUInteger numberOfRowsInSection = [self.tableView numberOfRowsInSection:s];
        for (NSUInteger r = 0; r < numberOfRowsInSection; ++r) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:r inSection:s];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
            }
        }
    }
    [self.tableView reloadData];
}

- (IBAction)refresh
{
    // show the spinner if it's not already showing
    [self.refreshControl beginRefreshing];

    [[FTASyncHandler sharedInstance] syncWithCompletionBlock:^{
        //[[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        //[[NSManagedObjectContext MR_defaultContext] MR_save];
        [self.refreshControl endRefreshing];
    } progressBlock:nil];
}

- (void)setupFetchedResultsController
{
    if (self.classroom.managedObjectContext) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Child"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"classroom = %@", self.classroom];
        
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.classroom.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        
    } else {
        self.fetchedResultsController = nil;
    }
}

-(NSMutableSet*) selectedChildren{
    if (!_selectedChildren) {
        _selectedChildren = [[NSMutableSet alloc] init];
    }
    return _selectedChildren;
}

- (BOOL)splitViewController:(UISplitViewController *)svc
   shouldHideViewController:(UIViewController *)vc
              inOrientation:(UIInterfaceOrientation)orientation
{
    return UIInterfaceOrientationIsPortrait(orientation);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ChildCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Child *child = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = child.name;
    if ([self.selectedChildren containsObject:child]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Work out if the cell is already selected
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    Child *child = [self.fetchedResultsController objectAtIndexPath:indexPath];
    if (cell.accessoryType==UITableViewCellAccessoryCheckmark) {
        [self.selectedChildren removeObject:child];
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        [self.selectedChildren addObject:child];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    NurserySmileTabBarVC *detailVC = [self.splitViewController.viewControllers lastObject];
    if ([detailVC respondsToSelector:@selector(setQueryDate:)]) {
        detailVC.queryDate = self.queryDate;
    }
    if ([detailVC respondsToSelector:@selector(setChildren:)]) {
        detailVC.children = self.selectedChildren;
    }
}


@end

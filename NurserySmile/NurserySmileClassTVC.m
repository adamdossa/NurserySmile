//
//  NurserySmileClassTVC.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileClassTVC.h"
#import "NurserySmileChildrenTVC.h"
#import "NurserySmileDateTVC.h"
#import "Classroom.h"

@interface NurserySmileClassTVC ()

@end

@implementation NurserySmileClassTVC

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
}

- (IBAction)refresh
{
    // show the spinner if it's not already showing
    [self.refreshControl beginRefreshing];
    
    [[FTASyncHandler sharedInstance] syncWithCompletionBlock:^{
        //[[NSManagedObjectContext MR_defaultContext] MR_save];
        [self.refreshControl endRefreshing];
    } progressBlock:nil];
}

- (void) setSchool:(NSString *)school
{
    _school = school;
    self.title = school;
    [self setupFetchedResultsController];
}

- (void)setupFetchedResultsController
{
    if ([NSManagedObjectContext MR_contextForCurrentThread]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Classroom"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"school.name = %@", self.school];
        
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[NSManagedObjectContext MR_contextForCurrentThread] sectionNameKeyPath:nil cacheName:nil];
        
    } else {
        self.fetchedResultsController = nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ClassCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Classroom *classroom = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = classroom.name;
    
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Resync our data at this point - should be in a pull down
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Classroom *classroom = [self.fetchedResultsController objectAtIndexPath:indexPath];
    if ([segue.identifier isEqualToString:@"ChildrenSegue"]) {
        NurserySmileChildrenTVC *childrenTVC = segue.destinationViewController;
        childrenTVC.classroom = classroom;
        childrenTVC.queryDate = self.queryDate;
    }
}


@end

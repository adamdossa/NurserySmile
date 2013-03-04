//
//  NurserySmileChildrenTVC.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileChildrenTVC.h"
#import "NurserySmileChild.h"
#import "NurserySmileTabBarVC.h"

@interface NurserySmileChildrenTVC () <UISplitViewControllerDelegate>
@property (nonatomic, strong, readwrite) NSMutableSet* selectedChildren; //of NurserySmileChild
@end

@implementation NurserySmileChildrenTVC

- (void) awakeFromNib
{
    self.splitViewController.delegate = self;
}

-(void) setClass:(NurserySmileClass *)nurseryClass
{
    _nurseryClass = nurseryClass;
    [self.tableView reloadData];
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
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.nurseryClass.children count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ChildCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NurserySmileChild *child = self.nurseryClass.children[indexPath.item];
    cell.textLabel.text = child.childName;
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
    if (cell.accessoryType==UITableViewCellAccessoryCheckmark) {
        [self.selectedChildren removeObject:self.nurseryClass.children[indexPath.item]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        [self.selectedChildren addObject:self.nurseryClass.children[indexPath.item]];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    NurserySmileTabBarVC *detailVC = [self.splitViewController.viewControllers lastObject];
    detailVC.children = self.selectedChildren;
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    //Work out if the cell is already selected
//    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    if (cell.accessoryType==UITableViewCellAccessoryCheckmark) {
//        [self.selectedChildren removeObject:self.nurseryClass.children[indexPath.item]];
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    } else {
//        [self.selectedChildren addObject:self.nurseryClass.children[indexPath.item]];
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }
//
//    if ([segue.identifier isEqualToString:@"DataEntrySegue"]) {
//        NurserySmileTabBarVC *dataEntryTVC = segue.destinationViewController;
//        dataEntryTVC.children = [self.selectedChildren copy];
//    }
//}


@end

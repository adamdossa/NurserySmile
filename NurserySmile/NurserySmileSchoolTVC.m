//
//  NurserySmileSchoolTVC.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileSchoolTVC.h"
#import "NurserySmileClassTVC.h"
#import "NurserySmileDateTVC.h"

@interface NurserySmileSchoolTVC ()
@property (nonatomic, strong) UIViewController *tabBarVC;
@end

@implementation NurserySmileSchoolTVC

-(void) viewDidLoad
{
    //[self populateTestData];
    //[[FTASyncHandler sharedInstance] syncWithCompletionBlock:nil progressBlock:nil];
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //Reset original view
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                @"MainStoryboard" bundle:[NSBundle mainBundle]];
    
    UIViewController *logoView = [storyboard instantiateViewControllerWithIdentifier:@"logoView"];
    UIViewController *navigationViewController = [self.splitViewController.viewControllers objectAtIndex:0];
    NSArray *viewControllers = [[NSArray alloc] initWithObjects:navigationViewController, logoView, nil];
    self.splitViewController.viewControllers = viewControllers;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (([segue.identifier isEqualToString:@"ClassSegue"]) && (self.school!=nil)){
        NurserySmileClassTVC *classTVC = segue.destinationViewController;
        classTVC.school = self.school;
    }
    if (([segue.identifier isEqualToString:@"DateSegue"]) && (self.school!=nil)){
        NurserySmileDateTVC *dateTVC = segue.destinationViewController;
        dateTVC.school = self.school;
    }
    if (([segue.identifier isEqualToString:@"ChartSegue"]) && (self.school!=nil)){
        NurserySmileDateTVC *dateTVC = segue.destinationViewController;
        dateTVC.school = self.school;
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 2) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                    @"MainStoryboard" bundle:[NSBundle mainBundle]];
        
        UIViewController *chartView = [storyboard instantiateViewControllerWithIdentifier:@"chartView"];
        UIViewController *navigationViewController = [self.splitViewController.viewControllers objectAtIndex:0];
        NSArray *viewControllers = [[NSArray alloc] initWithObjects:navigationViewController, chartView, nil];
        self.splitViewController.viewControllers = viewControllers;
    } else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                    @"MainStoryboard" bundle:[NSBundle mainBundle]];
        
        UIViewController *dataView = [storyboard instantiateViewControllerWithIdentifier:@"dataView"];
        UIViewController *navigationViewController = [self.splitViewController.viewControllers objectAtIndex:0];
        NSArray *viewControllers = [[NSArray alloc] initWithObjects:navigationViewController, dataView, nil];
        self.splitViewController.viewControllers = viewControllers;            
    }
}

- (NSString *) school
{
    return @"TestSchool";
}

//- (void) setupSchool
//{
//    School *mySchool = nil;
//    NSArray *schoolMatches = [School MR_findAll];
//    if (!schoolMatches || ([schoolMatches count] > 1)) {
//        // handle error
//    } else if (![schoolMatches count]) {
//        [self populateTestData];
//        //[self setupSchool]; //try again
//        return;
//    } else {
//        mySchool = [schoolMatches lastObject];
//    }
//    self.school = mySchool;
//}

- (void) populateTestData
{
    if (![NSManagedObjectContext MR_contextForCurrentThread]) {
        return;
    }
    
    NSSet *purpleChildNames = [[NSSet alloc] initWithArray:@[@"Ben Dossa",@"Vicky Gilbert",@"Emily Hughes",@"Rosanne Graham", @"David Clewin", @"Dan Harris", @"Chloe Dench", @"Elizabeth Dossa", @"Cory Street"]];
    NSSet *redChildNames = [[NSSet alloc] initWithArray:@[@"Ben Dossa1",@"Vicky Gilbert1",@"Emily Hughes1",@"Rosanne Graham1", @"David Clewin1", @"Dan Harris1", @"Chloe Dench1", @"Louis Shaffner1", @"Cory Street1"]];
    NSDictionary *classrooms = @{@"Purple Class": purpleChildNames, @"Red Class": redChildNames};
    [School schoolWithName:@"TestSchool" andClasses:classrooms inManagedObjectContext:[NSManagedObjectContext MR_contextForCurrentThread]];
    [[FTASyncHandler sharedInstance] syncWithCompletionBlock:^{
        //[[NSManagedObjectContext MR_defaultContext] MR_save];
    }progressBlock:nil];
}

@end

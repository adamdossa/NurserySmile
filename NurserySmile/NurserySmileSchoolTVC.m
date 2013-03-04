//
//  NurserySmileSchoolTVC.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileSchoolTVC.h"
#import "NurserySmileClassTVC.h"
#import "NurserySmileClass.h"
#import "NurserySmileChild.h"

@interface NurserySmileSchoolTVC ()

@end

@implementation NurserySmileSchoolTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (NurserySmileSchool *) getTestSchool
{
    NSArray *purpleChildNames = @[@"Ben Dossa",@"Vicky Gilbert",@"Emily Hughes",@"Rosanne Graham", @"David Clewin", @"Dan Harris", @"Chloe Dench", @"Louis Shaffner", @"Cory Street"];
    NSArray *redChildNames = @[@"Ben Dossa1",@"Vicky Gilbert1",@"Emily Hughes1",@"Rosanne Graham1", @"David Clewin1", @"Dan Harris1", @"Chloe Dench1", @"Louis Shaffner1", @"Cory Street1"];
    NSMutableArray* purpleChildren = [[NSMutableArray alloc] init];
    for (NSString* name in purpleChildNames) {
        [purpleChildren addObject:[[NurserySmileChild alloc] initWithName:name andEmails: @[]]];
    }
    NSMutableArray* redChildren = [[NSMutableArray alloc] init];
    for (NSString* name in redChildNames) {
        [redChildren addObject:[[NurserySmileChild alloc] initWithName:name andEmails: @[]]];
    }
    NurserySmileClass *purpleClass = [[NurserySmileClass alloc] initWithClassName:@"Purple Room" ofChildren:purpleChildren];
    NurserySmileClass *redClass = [[NurserySmileClass alloc] initWithClassName:@"Red Room" ofChildren:redChildren];
    NurserySmileSchool *testSchool = [[NurserySmileSchool alloc] initWithClasses:@[purpleClass, redClass]];
    return testSchool;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ClassSegue"]) {
        NurserySmileClassTVC *classTVC = segue.destinationViewController;
        
        classTVC.school = [NurserySmileSchoolTVC getTestSchool];
    }
}

@end

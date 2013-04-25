//
//  NurserySmileDiaperPopover.m
//  NurserySmile
//
//  Created by Adam Dossa on 05/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileDiaperPopover.h"
#import "DiaperChange.h"
#import "Child.h"

@interface NurserySmileDiaperPopover ()

@end

@implementation NurserySmileDiaperPopover

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
- (IBAction)creamSelect:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}

- (void) processNurseryEvent
{
    NSString *type = [self.diaperType titleForSegmentAtIndex:[self.diaperType selectedSegmentIndex]];
    NSDate *time = [self.diaperTime date];
    BOOL cream = self.diaperCream.isSelected;
    for (Child *child in self.children) {
        DiaperChange *diaperChange = [NSEntityDescription insertNewObjectForEntityForName:@"DiaperChange" inManagedObjectContext:self.managedObjectContext];
        diaperChange.startTime = time;
        diaperChange.type = type;
        diaperChange.cream = [NSNumber numberWithBool:cream];
        diaperChange.date = [self day];
        [child addDiaperChangesObject:diaperChange];
    }
}

@end

//
//  NurserySmileSleepPopover.m
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileSleepPopover.h"
#import "Sleep.h"
#import "Child.h"

@interface NurserySmileSleepPopover ()

@end

@implementation NurserySmileSleepPopover

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

- (void) processNurseryEvent
{
    NSDate *startTime = [self.startTime date];
    NSTimeInterval duration = [self.duration countDownDuration];
    for (Child *child in self.children) {
        Sleep *sleep = [NSEntityDescription insertNewObjectForEntityForName:@"Sleep" inManagedObjectContext:self.managedObjectContext];
        sleep.startTime = startTime;
        sleep.duration = [NSNumber numberWithDouble:duration];
        sleep.date = [self day];
        [child addSleepsObject:sleep];
    }
}


@end

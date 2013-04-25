//
//  NurserySmileMilkPopover.m
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileMilkPopover.h"
#import "Milk.h"
#import "Child.h"

@interface NurserySmileMilkPopover ()

@end

@implementation NurserySmileMilkPopover

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
- (IBAction)incrementOunces:(UIStepper *)sender {
    self.milkOunces.text = [NSString stringWithFormat:@"%i", [[NSNumber numberWithDouble: sender.value] integerValue]];
}

- (void) processNurseryEvent
{
    NSDate *startTime = [self.milkTime date];
    NSUInteger milkAmount = self.milkStepper.value;
    for (Child *child in self.children) {
        Milk *milk = [NSEntityDescription insertNewObjectForEntityForName:@"Milk" inManagedObjectContext:self.managedObjectContext];
        milk.startTime = startTime;
        milk.ounces = [NSNumber numberWithUnsignedInteger:milkAmount];
        milk.date = [self day];
        [child addMilksObject:milk];
    }

}

@end

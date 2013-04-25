//
//  NurserySmileTabVC.m
//  NurserySmile
//
//  Created by Adam Dossa on 03/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileTabBarVC.h"
#import "NurserySmileDataEntryVC.h"

@implementation NurserySmileTabBarVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) setChildren:(NSSet *)children
{
    _children = children;
    for (UIViewController *controller in self.viewControllers) {
        if ([controller respondsToSelector:@selector(setQueryDate:)]) {
            [controller performSelector:@selector(setQueryDate:) withObject:self.queryDate];
        }
        if ([controller respondsToSelector:@selector(setChildren:)]) {
            [controller performSelector:@selector(setChildren:) withObject:[children allObjects]];
        }
    }
}



@end

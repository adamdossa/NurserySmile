//
//  NurserySmileChild.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileChild.h"

@implementation NurserySmileChild

static NSUInteger counter = 0;

- (id) initWithName:(NSString *)childName andEmails:(NSArray *)emailAddress
{
    self = [super self];
    if (self) {
        self.childName = childName;
        self.emailAddress = emailAddress;
        self.childId = [NurserySmileChild getUniqueId];
        self.diaperReports = [[NSMutableArray alloc] init];
        self.sleepReports = [[NSMutableArray alloc] init];
        self.commentReports = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (NSUInteger) getUniqueId
{
    counter++;
    return counter;
}
@end
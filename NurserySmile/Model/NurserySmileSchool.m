//
//  NurserySmileSchool.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileSchool.h"

@implementation NurserySmileSchool

- (id) initWithClasses: (NSArray *) classes {
    self = [super self];
    if (self) {
        self.classes = classes;
    }
    return self;
}

@end

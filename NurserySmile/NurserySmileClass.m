//
//  NurserySmileClass.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileClass.h"

@implementation NurserySmileClass

-(id) initWithClassName: (NSString *)className ofChildren: (NSArray *)children
{
    self = [super init];
    if (self) {
        self.className = className;
        self.children = children;
    }
    return self;
}

@end

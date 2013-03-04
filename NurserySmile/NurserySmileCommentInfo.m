//
//  NurserySmileCommentInfo.m
//  NurserySmile
//
//  Created by Adam Dossa on 03/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileCommentInfo.h"

@implementation NurserySmileCommentInfo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
 // Drawing code
 UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:12];
 [[UIColor redColor] setStroke];
 [roundedRect stroke];
}

@end

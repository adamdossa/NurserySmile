//
//  NurserySmileDiaperChange.h
//  NurserySmile
//
//  Created by Adam Dossa on 03/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NurserySmileDiaperChange : NSObject
@property (nonatomic, strong) NSString* type;
@property BOOL cream;
@property (nonatomic, strong) NSDate* time;
@end

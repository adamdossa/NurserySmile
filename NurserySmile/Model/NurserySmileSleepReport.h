//
//  NurserySmileSleepReport.h
//  NurserySmile
//
//  Created by Adam Dossa on 03/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NurserySmileSleepReport : NSObject
@property (nonatomic, strong) NSArray* sleeps; //of NurserySmileSleep
@property (nonatomic, strong) NSDate* reportDate;

@end

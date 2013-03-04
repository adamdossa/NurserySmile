//
//  NurserySmileDiaperReport.h
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NurserySmileDiaperReport : NSObject
@property (nonatomic, strong) NSArray* diaperChanges; //of NurserySmileDiaperChange
@property (nonatomic, strong) NSDate* reportDate;
@end

//
//  NurserySmileCommentReport.h
//  NurserySmile
//
//  Created by Adam Dossa on 03/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NurserySmileCommentReport : NSObject
@property (nonatomic, strong) NSArray* comments; //of NurserySmileComment
@property (nonatomic, strong) NSDate* reportDate;

@end

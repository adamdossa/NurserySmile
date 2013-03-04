//
//  NurserySmileChild.h
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NurserySmileChild : NSObject
@property (nonatomic, strong) NSString* childName;
@property (nonatomic, strong) NSArray* emailAddress; //of NSString
@property (nonatomic) NSUInteger childId; //to uniquely identify child
@property (nonatomic, strong) NSArray* diaperReports; //of NurserySmileDiaperReport
@property (nonatomic, strong) NSArray* sleepReports; //of NurserySmileSleepReport
@property (nonatomic, strong) NSArray* commentReports; //of NurserySmileCommentReport
+ (NSUInteger) getUniqueId;
- (id) initWithName: (NSString*) childName andEmails: (NSArray*) emailAddress;
@end
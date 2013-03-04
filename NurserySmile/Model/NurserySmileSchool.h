//
//  NurserySmileSchool.h
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NurserySmileSchool : NSObject

@property (nonatomic, strong) NSArray* classes; //of NurserySmileClass

- (id) initWithClasses: (NSArray *) classes;

@end

//
//  NurserySmileClass.h
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NurserySmileClass : NSObject

@property (nonatomic, strong) NSString * className;
@property (nonatomic, strong) NSArray *children; //of NurserySmileChild

-(id) initWithClassName: (NSString *)className ofChildren: (NSArray *)children;

@end

//
//  School+Create.h
//  NurserySmile
//
//  Created by Adam Dossa on 09/04/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "School.h"

@interface School (Create)
+ (School*) schoolWithName: (NSString*) schoolName andClasses: (NSDictionary*)classDetails
            inManagedObjectContext:(NSManagedObjectContext *)context;
@end

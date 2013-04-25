//
//  Classroom+Create.h
//  NurserySmile
//
//  Created by Adam Dossa on 09/04/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "Classroom.h"

@interface Classroom (Create)
+ (Classroom*) classroomWithName: (NSString*) classroomName andChildren: (NSSet*) children inManagedObjectContext:(NSManagedObjectContext *)context;
@end

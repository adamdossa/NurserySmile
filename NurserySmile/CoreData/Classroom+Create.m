//
//  Classroom+Create.m
//  NurserySmile
//
//  Created by Adam Dossa on 09/04/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "Classroom+Create.h"
#import "Child+Create.h"

@implementation Classroom (Create)
+ (Classroom*) classroomWithName: (NSString*) classroomName andChildren: (NSSet*) children inManagedObjectContext:(NSManagedObjectContext *)context;
{
    
    Classroom* classroom = nil;
    
    if (classroomName.length) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Classroom"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                  ascending:YES
                                                                   selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", classroomName];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || ([matches count] > 1)) {
            // handle error
        } else if (![matches count]) {
            classroom = [NSEntityDescription insertNewObjectForEntityForName:@"Classroom" inManagedObjectContext:context];
            classroom.name = classroomName;
            NSMutableSet *classroomChildren = [[NSMutableSet alloc] init];
            for (NSString* childName in children) {
                [classroomChildren addObject:[Child childWithName:childName inManagedObjectContext:context]];
            }
            classroom.children = classroomChildren;
        } else {
            classroom = [matches lastObject];
        }
    }
    return classroom;
}

@end

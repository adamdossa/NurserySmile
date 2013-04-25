//
//  School+Create.m
//  NurserySmile
//
//  Created by Adam Dossa on 09/04/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "School+Create.h"
#import "Classroom+Create.h"

@implementation School (Create)
+ (School*) schoolWithName: (NSString*) schoolName andClasses: (NSDictionary*)classDetails
            inManagedObjectContext:(NSManagedObjectContext *)context;
{
    
    School* school = nil;

    if (schoolName.length) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"School"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                  ascending:YES
                                                                   selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", schoolName];
    
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
    
        if (!matches || ([matches count] > 1)) {
            // handle error
        } else if (![matches count]) {
            school = [NSEntityDescription insertNewObjectForEntityForName:@"School" inManagedObjectContext:context];
            school.name = schoolName;
            NSMutableSet* classrooms = [[NSMutableSet alloc] init];
            for (NSString* classroomName in classDetails) {
                Classroom* newClassroom = [Classroom classroomWithName:classroomName andChildren:classDetails[classroomName] inManagedObjectContext:context];
                [classrooms addObject:newClassroom];
            }
            school.classrooms = classrooms;
        } else {
            school = [matches lastObject];
        }
    }
    return school;
}
    
@end

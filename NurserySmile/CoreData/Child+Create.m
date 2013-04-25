//
//  Child+Create.m
//  NurserySmile
//
//  Created by Adam Dossa on 09/04/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "Child+Create.h"

@implementation Child (Create)
+ (Child*) childWithName: (NSString*) childName inManagedObjectContext:(NSManagedObjectContext *)context
{
    Child* child = nil;
    
    if (childName.length) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Child"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                  ascending:YES
                                                                   selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", childName];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || ([matches count] > 1)) {
            // handle error
        } else if (![matches count]) {
            child = [NSEntityDescription insertNewObjectForEntityForName:@"Child" inManagedObjectContext:context];
            child.name = childName;
        } else {
            child = [matches lastObject];
        }
    }
    return child;
}
@end

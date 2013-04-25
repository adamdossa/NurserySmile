//
//  Child+Create.h
//  NurserySmile
//
//  Created by Adam Dossa on 09/04/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "Child.h"

@interface Child (Create)
+ (Child*) childWithName: (NSString*) childName inManagedObjectContext:(NSManagedObjectContext *)context;
@end

// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Classroom.m instead.

#import "_Classroom.h"

const struct ClassroomAttributes ClassroomAttributes = {
	.name = @"name",
};

const struct ClassroomRelationships ClassroomRelationships = {
	.children = @"children",
	.school = @"school",
};

const struct ClassroomFetchedProperties ClassroomFetchedProperties = {
};

@implementation ClassroomID
@end

@implementation _Classroom

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Classroom" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Classroom";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Classroom" inManagedObjectContext:moc_];
}

- (ClassroomID*)objectID {
	return (ClassroomID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic children;

	
- (NSMutableSet*)childrenSet {
	[self willAccessValueForKey:@"children"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"children"];
  
	[self didAccessValueForKey:@"children"];
	return result;
}
	

@dynamic school;

	






@end

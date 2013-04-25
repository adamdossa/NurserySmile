// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Child.m instead.

#import "_Child.h"

const struct ChildAttributes ChildAttributes = {
	.emailAddress = @"emailAddress",
	.name = @"name",
};

const struct ChildRelationships ChildRelationships = {
	.classroom = @"classroom",
	.comments = @"comments",
	.diaperChanges = @"diaperChanges",
	.diets = @"diets",
	.milks = @"milks",
	.reminders = @"reminders",
	.sleeps = @"sleeps",
};

const struct ChildFetchedProperties ChildFetchedProperties = {
};

@implementation ChildID
@end

@implementation _Child

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Child" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Child";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Child" inManagedObjectContext:moc_];
}

- (ChildID*)objectID {
	return (ChildID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic emailAddress;






@dynamic name;






@dynamic classroom;

	

@dynamic comments;

	
- (NSMutableSet*)commentsSet {
	[self willAccessValueForKey:@"comments"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"comments"];
  
	[self didAccessValueForKey:@"comments"];
	return result;
}
	

@dynamic diaperChanges;

	
- (NSMutableSet*)diaperChangesSet {
	[self willAccessValueForKey:@"diaperChanges"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"diaperChanges"];
  
	[self didAccessValueForKey:@"diaperChanges"];
	return result;
}
	

@dynamic diets;

	
- (NSMutableSet*)dietsSet {
	[self willAccessValueForKey:@"diets"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"diets"];
  
	[self didAccessValueForKey:@"diets"];
	return result;
}
	

@dynamic milks;

	
- (NSMutableSet*)milksSet {
	[self willAccessValueForKey:@"milks"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"milks"];
  
	[self didAccessValueForKey:@"milks"];
	return result;
}
	

@dynamic reminders;

	
- (NSMutableSet*)remindersSet {
	[self willAccessValueForKey:@"reminders"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"reminders"];
  
	[self didAccessValueForKey:@"reminders"];
	return result;
}
	

@dynamic sleeps;

	
- (NSMutableSet*)sleepsSet {
	[self willAccessValueForKey:@"sleeps"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"sleeps"];
  
	[self didAccessValueForKey:@"sleeps"];
	return result;
}
	






@end

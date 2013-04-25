// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DiaperChange.m instead.

#import "_DiaperChange.h"

const struct DiaperChangeAttributes DiaperChangeAttributes = {
	.cream = @"cream",
	.date = @"date",
	.startTime = @"startTime",
	.type = @"type",
};

const struct DiaperChangeRelationships DiaperChangeRelationships = {
	.child = @"child",
};

const struct DiaperChangeFetchedProperties DiaperChangeFetchedProperties = {
};

@implementation DiaperChangeID
@end

@implementation _DiaperChange

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DiaperChange" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DiaperChange";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DiaperChange" inManagedObjectContext:moc_];
}

- (DiaperChangeID*)objectID {
	return (DiaperChangeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"creamValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"cream"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic cream;



- (BOOL)creamValue {
	NSNumber *result = [self cream];
	return [result boolValue];
}

- (void)setCreamValue:(BOOL)value_ {
	[self setCream:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveCreamValue {
	NSNumber *result = [self primitiveCream];
	return [result boolValue];
}

- (void)setPrimitiveCreamValue:(BOOL)value_ {
	[self setPrimitiveCream:[NSNumber numberWithBool:value_]];
}





@dynamic date;






@dynamic startTime;






@dynamic type;






@dynamic child;

	






@end

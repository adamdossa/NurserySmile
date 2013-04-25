// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Milk.m instead.

#import "_Milk.h"

const struct MilkAttributes MilkAttributes = {
	.date = @"date",
	.ounces = @"ounces",
	.startTime = @"startTime",
};

const struct MilkRelationships MilkRelationships = {
	.child = @"child",
};

const struct MilkFetchedProperties MilkFetchedProperties = {
};

@implementation MilkID
@end

@implementation _Milk

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Milk" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Milk";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Milk" inManagedObjectContext:moc_];
}

- (MilkID*)objectID {
	return (MilkID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"ouncesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"ounces"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic date;






@dynamic ounces;



- (int16_t)ouncesValue {
	NSNumber *result = [self ounces];
	return [result shortValue];
}

- (void)setOuncesValue:(int16_t)value_ {
	[self setOunces:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveOuncesValue {
	NSNumber *result = [self primitiveOunces];
	return [result shortValue];
}

- (void)setPrimitiveOuncesValue:(int16_t)value_ {
	[self setPrimitiveOunces:[NSNumber numberWithShort:value_]];
}





@dynamic startTime;






@dynamic child;

	






@end

// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sleep.m instead.

#import "_Sleep.h"

const struct SleepAttributes SleepAttributes = {
	.date = @"date",
	.duration = @"duration",
	.startTime = @"startTime",
};

const struct SleepRelationships SleepRelationships = {
	.child = @"child",
};

const struct SleepFetchedProperties SleepFetchedProperties = {
};

@implementation SleepID
@end

@implementation _Sleep

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Sleep" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Sleep";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Sleep" inManagedObjectContext:moc_];
}

- (SleepID*)objectID {
	return (SleepID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"durationValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"duration"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic date;






@dynamic duration;



- (int16_t)durationValue {
	NSNumber *result = [self duration];
	return [result shortValue];
}

- (void)setDurationValue:(int16_t)value_ {
	[self setDuration:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveDurationValue {
	NSNumber *result = [self primitiveDuration];
	return [result shortValue];
}

- (void)setPrimitiveDurationValue:(int16_t)value_ {
	[self setPrimitiveDuration:[NSNumber numberWithShort:value_]];
}





@dynamic startTime;






@dynamic child;

	






@end

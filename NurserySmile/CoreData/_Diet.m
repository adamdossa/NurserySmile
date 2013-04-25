// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Diet.m instead.

#import "_Diet.h"

const struct DietAttributes DietAttributes = {
	.date = @"date",
	.drinkAmount = @"drinkAmount",
	.drinkType = @"drinkType",
	.mealAmount = @"mealAmount",
	.mealTime = @"mealTime",
	.mealType = @"mealType",
};

const struct DietRelationships DietRelationships = {
	.child = @"child",
};

const struct DietFetchedProperties DietFetchedProperties = {
};

@implementation DietID
@end

@implementation _Diet

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Diet" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Diet";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Diet" inManagedObjectContext:moc_];
}

- (DietID*)objectID {
	return (DietID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic date;






@dynamic drinkAmount;






@dynamic drinkType;






@dynamic mealAmount;






@dynamic mealTime;






@dynamic mealType;






@dynamic child;

	






@end

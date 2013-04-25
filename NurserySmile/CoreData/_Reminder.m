// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Reminder.m instead.

#import "_Reminder.h"

const struct ReminderAttributes ReminderAttributes = {
	.date = @"date",
	.reminderText = @"reminderText",
};

const struct ReminderRelationships ReminderRelationships = {
	.child = @"child",
};

const struct ReminderFetchedProperties ReminderFetchedProperties = {
};

@implementation ReminderID
@end

@implementation _Reminder

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Reminder" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Reminder";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Reminder" inManagedObjectContext:moc_];
}

- (ReminderID*)objectID {
	return (ReminderID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic date;






@dynamic reminderText;






@dynamic child;

	






@end

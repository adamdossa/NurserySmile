// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Reminder.h instead.

#import <CoreData/CoreData.h>
#import "FTASyncParent.h"

extern const struct ReminderAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *reminderText;
} ReminderAttributes;

extern const struct ReminderRelationships {
	__unsafe_unretained NSString *child;
} ReminderRelationships;

extern const struct ReminderFetchedProperties {
} ReminderFetchedProperties;

@class Child;




@interface ReminderID : NSManagedObjectID {}
@end

@interface _Reminder : FTASyncParent {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ReminderID*)objectID;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* reminderText;



//- (BOOL)validateReminderText:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Child *child;

//- (BOOL)validateChild:(id*)value_ error:(NSError**)error_;





@end

@interface _Reminder (CoreDataGeneratedAccessors)

@end

@interface _Reminder (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveReminderText;
- (void)setPrimitiveReminderText:(NSString*)value;





- (Child*)primitiveChild;
- (void)setPrimitiveChild:(Child*)value;


@end

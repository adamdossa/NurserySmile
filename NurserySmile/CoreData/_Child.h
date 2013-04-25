// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Child.h instead.

#import <CoreData/CoreData.h>
#import "FTASyncParent.h"

extern const struct ChildAttributes {
	__unsafe_unretained NSString *emailAddress;
	__unsafe_unretained NSString *name;
} ChildAttributes;

extern const struct ChildRelationships {
	__unsafe_unretained NSString *classroom;
	__unsafe_unretained NSString *comments;
	__unsafe_unretained NSString *diaperChanges;
	__unsafe_unretained NSString *diets;
	__unsafe_unretained NSString *milks;
	__unsafe_unretained NSString *reminders;
	__unsafe_unretained NSString *sleeps;
} ChildRelationships;

extern const struct ChildFetchedProperties {
} ChildFetchedProperties;

@class Classroom;
@class Comment;
@class DiaperChange;
@class Diet;
@class Milk;
@class Reminder;
@class Sleep;




@interface ChildID : NSManagedObjectID {}
@end

@interface _Child : FTASyncParent {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ChildID*)objectID;





@property (nonatomic, strong) NSString* emailAddress;



//- (BOOL)validateEmailAddress:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Classroom *classroom;

//- (BOOL)validateClassroom:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *comments;

- (NSMutableSet*)commentsSet;




@property (nonatomic, strong) NSSet *diaperChanges;

- (NSMutableSet*)diaperChangesSet;




@property (nonatomic, strong) NSSet *diets;

- (NSMutableSet*)dietsSet;




@property (nonatomic, strong) NSSet *milks;

- (NSMutableSet*)milksSet;




@property (nonatomic, strong) NSSet *reminders;

- (NSMutableSet*)remindersSet;




@property (nonatomic, strong) NSSet *sleeps;

- (NSMutableSet*)sleepsSet;





@end

@interface _Child (CoreDataGeneratedAccessors)

- (void)addComments:(NSSet*)value_;
- (void)removeComments:(NSSet*)value_;
- (void)addCommentsObject:(Comment*)value_;
- (void)removeCommentsObject:(Comment*)value_;

- (void)addDiaperChanges:(NSSet*)value_;
- (void)removeDiaperChanges:(NSSet*)value_;
- (void)addDiaperChangesObject:(DiaperChange*)value_;
- (void)removeDiaperChangesObject:(DiaperChange*)value_;

- (void)addDiets:(NSSet*)value_;
- (void)removeDiets:(NSSet*)value_;
- (void)addDietsObject:(Diet*)value_;
- (void)removeDietsObject:(Diet*)value_;

- (void)addMilks:(NSSet*)value_;
- (void)removeMilks:(NSSet*)value_;
- (void)addMilksObject:(Milk*)value_;
- (void)removeMilksObject:(Milk*)value_;

- (void)addReminders:(NSSet*)value_;
- (void)removeReminders:(NSSet*)value_;
- (void)addRemindersObject:(Reminder*)value_;
- (void)removeRemindersObject:(Reminder*)value_;

- (void)addSleeps:(NSSet*)value_;
- (void)removeSleeps:(NSSet*)value_;
- (void)addSleepsObject:(Sleep*)value_;
- (void)removeSleepsObject:(Sleep*)value_;

@end

@interface _Child (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveEmailAddress;
- (void)setPrimitiveEmailAddress:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (Classroom*)primitiveClassroom;
- (void)setPrimitiveClassroom:(Classroom*)value;



- (NSMutableSet*)primitiveComments;
- (void)setPrimitiveComments:(NSMutableSet*)value;



- (NSMutableSet*)primitiveDiaperChanges;
- (void)setPrimitiveDiaperChanges:(NSMutableSet*)value;



- (NSMutableSet*)primitiveDiets;
- (void)setPrimitiveDiets:(NSMutableSet*)value;



- (NSMutableSet*)primitiveMilks;
- (void)setPrimitiveMilks:(NSMutableSet*)value;



- (NSMutableSet*)primitiveReminders;
- (void)setPrimitiveReminders:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSleeps;
- (void)setPrimitiveSleeps:(NSMutableSet*)value;


@end

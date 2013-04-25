// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sleep.h instead.

#import <CoreData/CoreData.h>
#import "FTASyncParent.h"

extern const struct SleepAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *duration;
	__unsafe_unretained NSString *startTime;
} SleepAttributes;

extern const struct SleepRelationships {
	__unsafe_unretained NSString *child;
} SleepRelationships;

extern const struct SleepFetchedProperties {
} SleepFetchedProperties;

@class Child;





@interface SleepID : NSManagedObjectID {}
@end

@interface _Sleep : FTASyncParent {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SleepID*)objectID;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* duration;



@property int16_t durationValue;
- (int16_t)durationValue;
- (void)setDurationValue:(int16_t)value_;

//- (BOOL)validateDuration:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startTime;



//- (BOOL)validateStartTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Child *child;

//- (BOOL)validateChild:(id*)value_ error:(NSError**)error_;





@end

@interface _Sleep (CoreDataGeneratedAccessors)

@end

@interface _Sleep (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSNumber*)primitiveDuration;
- (void)setPrimitiveDuration:(NSNumber*)value;

- (int16_t)primitiveDurationValue;
- (void)setPrimitiveDurationValue:(int16_t)value_;




- (NSDate*)primitiveStartTime;
- (void)setPrimitiveStartTime:(NSDate*)value;





- (Child*)primitiveChild;
- (void)setPrimitiveChild:(Child*)value;


@end

// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Milk.h instead.

#import <CoreData/CoreData.h>
#import "FTASyncParent.h"

extern const struct MilkAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *ounces;
	__unsafe_unretained NSString *startTime;
} MilkAttributes;

extern const struct MilkRelationships {
	__unsafe_unretained NSString *child;
} MilkRelationships;

extern const struct MilkFetchedProperties {
} MilkFetchedProperties;

@class Child;





@interface MilkID : NSManagedObjectID {}
@end

@interface _Milk : FTASyncParent {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MilkID*)objectID;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* ounces;



@property int16_t ouncesValue;
- (int16_t)ouncesValue;
- (void)setOuncesValue:(int16_t)value_;

//- (BOOL)validateOunces:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startTime;



//- (BOOL)validateStartTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Child *child;

//- (BOOL)validateChild:(id*)value_ error:(NSError**)error_;





@end

@interface _Milk (CoreDataGeneratedAccessors)

@end

@interface _Milk (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSNumber*)primitiveOunces;
- (void)setPrimitiveOunces:(NSNumber*)value;

- (int16_t)primitiveOuncesValue;
- (void)setPrimitiveOuncesValue:(int16_t)value_;




- (NSDate*)primitiveStartTime;
- (void)setPrimitiveStartTime:(NSDate*)value;





- (Child*)primitiveChild;
- (void)setPrimitiveChild:(Child*)value;


@end

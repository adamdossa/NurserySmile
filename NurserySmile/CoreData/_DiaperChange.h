// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DiaperChange.h instead.

#import <CoreData/CoreData.h>
#import "FTASyncParent.h"

extern const struct DiaperChangeAttributes {
	__unsafe_unretained NSString *cream;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *startTime;
	__unsafe_unretained NSString *type;
} DiaperChangeAttributes;

extern const struct DiaperChangeRelationships {
	__unsafe_unretained NSString *child;
} DiaperChangeRelationships;

extern const struct DiaperChangeFetchedProperties {
} DiaperChangeFetchedProperties;

@class Child;






@interface DiaperChangeID : NSManagedObjectID {}
@end

@interface _DiaperChange : FTASyncParent {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DiaperChangeID*)objectID;





@property (nonatomic, strong) NSNumber* cream;



@property BOOL creamValue;
- (BOOL)creamValue;
- (void)setCreamValue:(BOOL)value_;

//- (BOOL)validateCream:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startTime;



//- (BOOL)validateStartTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Child *child;

//- (BOOL)validateChild:(id*)value_ error:(NSError**)error_;





@end

@interface _DiaperChange (CoreDataGeneratedAccessors)

@end

@interface _DiaperChange (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveCream;
- (void)setPrimitiveCream:(NSNumber*)value;

- (BOOL)primitiveCreamValue;
- (void)setPrimitiveCreamValue:(BOOL)value_;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSDate*)primitiveStartTime;
- (void)setPrimitiveStartTime:(NSDate*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (Child*)primitiveChild;
- (void)setPrimitiveChild:(Child*)value;


@end

// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Diet.h instead.

#import <CoreData/CoreData.h>
#import "FTASyncParent.h"

extern const struct DietAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *drinkAmount;
	__unsafe_unretained NSString *drinkType;
	__unsafe_unretained NSString *mealAmount;
	__unsafe_unretained NSString *mealTime;
	__unsafe_unretained NSString *mealType;
} DietAttributes;

extern const struct DietRelationships {
	__unsafe_unretained NSString *child;
} DietRelationships;

extern const struct DietFetchedProperties {
} DietFetchedProperties;

@class Child;








@interface DietID : NSManagedObjectID {}
@end

@interface _Diet : FTASyncParent {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DietID*)objectID;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* drinkAmount;



//- (BOOL)validateDrinkAmount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* drinkType;



//- (BOOL)validateDrinkType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* mealAmount;



//- (BOOL)validateMealAmount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* mealTime;



//- (BOOL)validateMealTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* mealType;



//- (BOOL)validateMealType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Child *child;

//- (BOOL)validateChild:(id*)value_ error:(NSError**)error_;





@end

@interface _Diet (CoreDataGeneratedAccessors)

@end

@interface _Diet (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveDrinkAmount;
- (void)setPrimitiveDrinkAmount:(NSString*)value;




- (NSString*)primitiveDrinkType;
- (void)setPrimitiveDrinkType:(NSString*)value;




- (NSString*)primitiveMealAmount;
- (void)setPrimitiveMealAmount:(NSString*)value;




- (NSDate*)primitiveMealTime;
- (void)setPrimitiveMealTime:(NSDate*)value;




- (NSString*)primitiveMealType;
- (void)setPrimitiveMealType:(NSString*)value;





- (Child*)primitiveChild;
- (void)setPrimitiveChild:(Child*)value;


@end

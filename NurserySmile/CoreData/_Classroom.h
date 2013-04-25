// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Classroom.h instead.

#import <CoreData/CoreData.h>
#import "FTASyncParent.h"

extern const struct ClassroomAttributes {
	__unsafe_unretained NSString *name;
} ClassroomAttributes;

extern const struct ClassroomRelationships {
	__unsafe_unretained NSString *children;
	__unsafe_unretained NSString *school;
} ClassroomRelationships;

extern const struct ClassroomFetchedProperties {
} ClassroomFetchedProperties;

@class Child;
@class School;



@interface ClassroomID : NSManagedObjectID {}
@end

@interface _Classroom : FTASyncParent {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ClassroomID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *children;

- (NSMutableSet*)childrenSet;




@property (nonatomic, strong) School *school;

//- (BOOL)validateSchool:(id*)value_ error:(NSError**)error_;





@end

@interface _Classroom (CoreDataGeneratedAccessors)

- (void)addChildren:(NSSet*)value_;
- (void)removeChildren:(NSSet*)value_;
- (void)addChildrenObject:(Child*)value_;
- (void)removeChildrenObject:(Child*)value_;

@end

@interface _Classroom (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveChildren;
- (void)setPrimitiveChildren:(NSMutableSet*)value;



- (School*)primitiveSchool;
- (void)setPrimitiveSchool:(School*)value;


@end

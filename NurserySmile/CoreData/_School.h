// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to School.h instead.

#import <CoreData/CoreData.h>
#import "FTASyncParent.h"

extern const struct SchoolAttributes {
	__unsafe_unretained NSString *name;
} SchoolAttributes;

extern const struct SchoolRelationships {
	__unsafe_unretained NSString *classrooms;
} SchoolRelationships;

extern const struct SchoolFetchedProperties {
} SchoolFetchedProperties;

@class Classroom;



@interface SchoolID : NSManagedObjectID {}
@end

@interface _School : FTASyncParent {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SchoolID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *classrooms;

- (NSMutableSet*)classroomsSet;





@end

@interface _School (CoreDataGeneratedAccessors)

- (void)addClassrooms:(NSSet*)value_;
- (void)removeClassrooms:(NSSet*)value_;
- (void)addClassroomsObject:(Classroom*)value_;
- (void)removeClassroomsObject:(Classroom*)value_;

@end

@interface _School (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveClassrooms;
- (void)setPrimitiveClassrooms:(NSMutableSet*)value;


@end

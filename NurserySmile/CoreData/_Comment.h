// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Comment.h instead.

#import <CoreData/CoreData.h>
#import "FTASyncParent.h"

extern const struct CommentAttributes {
	__unsafe_unretained NSString *comment;
	__unsafe_unretained NSString *commentTime;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *photo;
} CommentAttributes;

extern const struct CommentRelationships {
	__unsafe_unretained NSString *child;
} CommentRelationships;

extern const struct CommentFetchedProperties {
} CommentFetchedProperties;

@class Child;






@interface CommentID : NSManagedObjectID {}
@end

@interface _Comment : FTASyncParent {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (CommentID*)objectID;





@property (nonatomic, strong) NSString* comment;



//- (BOOL)validateComment:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* commentTime;



//- (BOOL)validateCommentTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* photo;



//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Child *child;

//- (BOOL)validateChild:(id*)value_ error:(NSError**)error_;





@end

@interface _Comment (CoreDataGeneratedAccessors)

@end

@interface _Comment (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveComment;
- (void)setPrimitiveComment:(NSString*)value;




- (NSDate*)primitiveCommentTime;
- (void)setPrimitiveCommentTime:(NSDate*)value;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSData*)primitivePhoto;
- (void)setPrimitivePhoto:(NSData*)value;





- (Child*)primitiveChild;
- (void)setPrimitiveChild:(Child*)value;


@end

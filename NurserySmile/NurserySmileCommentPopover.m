//
//  NurserySmileCommentPopover.m
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileCommentPopover.h"
#import "NurserySmileCommentPopoverPhoto.h"
#import "Comment.h"
#import "Child.h"

@interface NurserySmileCommentPopover ()

@end

@implementation NurserySmileCommentPopover

//-(UIImage*) photo
//{
//    if (!_photo) {
//        _photo = [[UIImage alloc] init];
//    }
//    return _photo;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.takeController = [[FDTakeController alloc] init];
    self.takeController.delegate = self;
    self.takeController.imagePicker.allowsEditing = YES;
    self.takeController.viewControllerForPresentingImagePickerController = self;

}
- (IBAction)addPhoto:(UIButton *)sender {
    [self.takeController takePhotoOrChooseFromLibrary];
}

- (CGRect) actionSheetLocation
{
    return self.addPhotoButton.frame;
}

- (void)takeController:(FDTakeController *)controller gotPhoto:(UIImage *)photo withInfo:(NSDictionary *)info
{
    self.photo = photo;
    [self.photoCollection reloadData];
}

- (void) processNurseryEvent
{
    
    NSString *commentText = self.commentText.text;
    for (Child *child in self.children) {
        Comment *comment = [NSEntityDescription insertNewObjectForEntityForName:@"Comment" inManagedObjectContext:self.managedObjectContext];
        comment.date = [self day];
        comment.commentTime = [NSDate date];
        comment.comment = commentText;
        if (self.photo) {
            //NSData *photoData = UIImagePNGRepresentation(self.photo);
            comment.photo = UIImagePNGRepresentation(self.photo);
        }
        [child addCommentsObject:comment];
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileCommentPopoverPhoto *cell = [self.photoCollection dequeueReusableCellWithReuseIdentifier:@"Photo" forIndexPath:indexPath];
    cell.photo.image = self.photo;
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)asker
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)asker
     numberOfItemsInSection:(NSInteger)section
{
    return 1;
}


@end

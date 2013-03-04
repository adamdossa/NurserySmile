//
//  CommentViewController.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "CommentViewController.h"
#import "NurserySmileChild.h"
#import "NurserySmileCommentInfo.h"
#import "NurserySmileComment.h"
#import "NurserySmileCommentInfoHeader.h"

@interface CommentViewController () <FDTakeDelegate>
@property (weak, nonatomic) IBOutlet UIButton *addPhotoButton;
@property (weak, nonatomic) IBOutlet UITextView *comment;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UICollectionView *commentReports;

@end

@implementation CommentViewController
@synthesize children = _children;

- (CGRect) actionSheetLocation
{
    return self.addPhotoButton.frame;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)takeController:(FDTakeController *)controller gotPhoto:(UIImage *)photo withInfo:(NSDictionary *)info
{
    [self.photo setImage:photo];
}


- (NSArray *) children
{
    if (!_children) {
        _children = [[NSArray alloc] init];
    }
    return _children;
}

- (void) setChildren:(NSArray *)children
{
    _children = children;
    [self.commentReports reloadData];
}

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addNewComment:(UIButton *)sender {
    NSString *commentText = self.comment.text;
    NurserySmileComment *comment = [[NurserySmileComment alloc] init];
    comment.comment = commentText;
    comment.photo = UIImagePNGRepresentation([self.photo image]);
    for (NurserySmileChild *child in self.children) {
        child.commentReports = [child.commentReports arrayByAddingObject:comment];
    }
    [self.commentReports reloadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)asker
{
    return [self.children count];
}

- (NSInteger)collectionView:(UICollectionView *)asker
     numberOfItemsInSection:(NSInteger)section
{
    NurserySmileChild *child = self.children[section];
    return [child.commentReports count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileCommentInfo *cell = [self.commentReports dequeueReusableCellWithReuseIdentifier:@"CommentInfo" forIndexPath:indexPath];
    NurserySmileChild *child = self.children[indexPath.section];
    NurserySmileComment *comment = child.commentReports[indexPath.item];
    cell.comment.text = comment.comment;
    cell.photo.image = [UIImage imageWithData:comment.photo];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileCommentInfoHeader *header = nil;
    
    if ([kind isEqual:UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                    withReuseIdentifier:@"CommentHeader"
                                                           forIndexPath:indexPath];
        NurserySmileChild *child = self.children[indexPath.section];
        header.header.text = child.childName;
    }
    return header;
}


@end

//
//  NurserySmileCommentPopover.h
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "DataEntrySegueVC.h"
#import "FDTakeController.h"

@interface NurserySmileCommentPopover : DataEntrySegueVC <FDTakeDelegate>
@property (weak, nonatomic) IBOutlet UITextView *commentText;
@property (weak, nonatomic) IBOutlet UICollectionView *photoCollection;
@property (weak, nonatomic) IBOutlet UIButton *addPhotoButton;
@property (nonatomic, strong) UIImage* photo;
@property FDTakeController *takeController;
@end

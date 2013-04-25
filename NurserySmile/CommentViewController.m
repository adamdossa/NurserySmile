//
//  CommentViewController.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "CommentViewController.h"
#import "NurserySmileCommentInfo.h"
#import "NurserySmileInfoHeader.h"
#import "Comment.h"

@interface CommentViewController ()
@end

@implementation CommentViewController

- (NSFetchRequest *) getFetchRequest
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Comment"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"child.name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)], [NSSortDescriptor sortDescriptorWithKey:@"commentTime" ascending:YES ]];
    request.predicate = [NSPredicate predicateWithFormat:@"child IN %@", self.children];
    return request;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileCommentInfo *cell = [self.reportCards dequeueReusableCellWithReuseIdentifier:@"CommentInfo" forIndexPath:indexPath];
    Comment *comment = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.comment.text = comment.comment;
    if (comment.photo) {
        cell.photo.image = [UIImage imageWithData:comment.photo];
    } else {
        cell.photo.image = nil;
    }
    if ([self.selectedReports containsObject:comment]) {
        cell.forDelete = YES;
        [cell setNeedsDisplay];
    } else {
        cell.forDelete = NO;
        [cell setNeedsDisplay];
    }

    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileInfoHeader *header = nil;
    
    if ([kind isEqual:UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                    withReuseIdentifier:@"InfoHeader"
                                                           forIndexPath:indexPath];
        Comment *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
        header.headerLabel.text = event.child.name;
    }
    return header;
}


@end

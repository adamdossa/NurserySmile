//
//  DiaperViewController.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "DiaperViewController.h"
#import "NurserySmileTabBarVC.h"
#import "NurserySmileDiaperInfo.h"
#import "NurserySmileDiaperInfoHeader.h"
#import "NurserySmileChild.h"
#import "NurserySmileDiaperChange.h"

@interface DiaperViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *diaperType;
@property (weak, nonatomic) IBOutlet UIDatePicker *diaperTime;
@property (weak, nonatomic) IBOutlet UIButton *cream;
@property (weak, nonatomic) IBOutlet UICollectionView *diaperReports;

@end

@implementation DiaperViewController
@synthesize children = _children;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    [self.diaperReports reloadData];
}

- (IBAction)addDiaperChange:(UIButton *)sender {
    NSString *type = [self.diaperType titleForSegmentAtIndex:[self.diaperType selectedSegmentIndex]];
    NSDate *time = [self.diaperTime date];
    BOOL cream = self.cream.isSelected;
    NurserySmileDiaperChange *diaperChange = [[NurserySmileDiaperChange alloc] init];
    diaperChange.time = time;
    diaperChange.type = type;
    diaperChange.cream = cream;
    for (NurserySmileChild *child in self.children) {
        child.diaperReports = [child.diaperReports arrayByAddingObject:diaperChange];
    }
    [self.diaperReports reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)asker
{
    return [self.children count];
}

- (NSInteger)collectionView:(UICollectionView *)asker
     numberOfItemsInSection:(NSInteger)section
{
    NurserySmileChild *child = self.children[section];
    return [child.diaperReports count];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileDiaperInfo *cell = [self.diaperReports dequeueReusableCellWithReuseIdentifier:@"DiaperInfo" forIndexPath:indexPath];
    NurserySmileChild *child = self.children[indexPath.section];
    NurserySmileDiaperChange *diaperChange = child.diaperReports[indexPath.item];
    cell.diaperLabel.text = diaperChange.type;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm"];
    cell.diaperTime.text = [formatter stringFromDate:diaperChange.time];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileDiaperInfoHeader *header = nil;
    
    if ([kind isEqual:UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                    withReuseIdentifier:@"DiaperHeader"
                                                           forIndexPath:indexPath];
        NurserySmileChild *child = self.children[indexPath.section];
        header.headerLabel.text = child.childName;
    }
    return header;
}

@end

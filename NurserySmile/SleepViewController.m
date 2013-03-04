//
//  SleepViewController.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "SleepViewController.h"
#import "NurserySmileTabBarVC.h"
#import "NurserySmileSleepInfo.h"
#import "NurserySmileSleepInfoHeader.h"
#import "NurserySmileChild.h"
#import "NurserySmileSleep.h"


@interface SleepViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *sleepReports;
@property (weak, nonatomic) IBOutlet UIDatePicker *startTime;
@property (weak, nonatomic) IBOutlet UIDatePicker *duration;

@end

@implementation SleepViewController
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
    [self.sleepReports reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NurserySmileTabBarVC *tbVC = (NurserySmileTabBarVC *) self.tabBarController;
//    self.children = [tbVC.children allObjects];
}

- (IBAction)addNewSleep:(UIButton *)sender {
    NSDate *startTime = [self.startTime date];
    NSDate *duration = [self.duration date];
    NurserySmileSleep *sleep = [[NurserySmileSleep alloc] init];
    sleep.startTime = startTime;
    sleep.duration = duration;
    for (NurserySmileChild *child in self.children) {
        child.sleepReports = [child.sleepReports arrayByAddingObject:sleep];
    }
    [self.sleepReports reloadData];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)asker
{
    return [self.children count];
}

- (NSInteger)collectionView:(UICollectionView *)asker
     numberOfItemsInSection:(NSInteger)section
{
    NurserySmileChild *child = self.children[section];
    return [child.sleepReports count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileSleepInfo *cell = [self.sleepReports dequeueReusableCellWithReuseIdentifier:@"SleepInfo" forIndexPath:indexPath];
    NurserySmileChild *child = self.children[indexPath.section];
    NurserySmileSleep *sleep = child.sleepReports[indexPath.item];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm"];
    cell.startTime.text = [formatter stringFromDate:sleep.startTime];
    cell.duration.text = [formatter stringFromDate:sleep.duration];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NurserySmileSleepInfoHeader *header = nil;
    
    if ([kind isEqual:UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                    withReuseIdentifier:@"SleepHeader"
                                                           forIndexPath:indexPath];
        NurserySmileChild *child = self.children[indexPath.section];
        header.childName.text = child.childName;
    }
    return header;
}


@end

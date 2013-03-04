//
//  DiaperViewController.h
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiaperViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray* children; //of NuserySmileChild
@end

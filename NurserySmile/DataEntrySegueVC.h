//
//  DataEntrySegueVC.h
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DataEntrySegueDelegate

-(void)processNewDataEntry;

@end

@interface DataEntrySegueVC : UIViewController
@property (nonatomic, strong) id <DataEntrySegueDelegate> delegate;
@property (nonatomic, strong) NSArray *children; // of Child objects
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
-(NSDate *)day;
-(void) processNurseryEvent;
@end

//
//  NurserySmileAppDelegate.m
//  NurserySmile
//
//  Created by Adam Dossa on 02/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import "NurserySmileAppDelegate.h"
#import "ParseKeys.h"
#import <Parse/Parse.h>

@implementation NurserySmileAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"NurserySmiles.sqlite"];
    //Setup Parse keys
    [Parse setApplicationId:kParseAppId
                  clientKey:kParseClientKey];
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    [self logIn];
    //Need to make sure FTASyncHandler gets initialized immediately so it's registered for notifications - also sync out at this point
//    [[FTASyncHandler sharedInstance] syncWithCompletionBlock:^{
//        [[NSManagedObjectContext MR_contextForCurrentThread] MR_save];
//    } progressBlock:nil];
    return YES;
}

- (void)logIn {
    [PFUser logInWithUsernameInBackground:@"TestSchool" password:@"TestSchool" block:^(PFUser *user, NSError *error) {
        if (!error) {
            //Sync up data!
            [[FTASyncHandler sharedInstance] syncWithCompletionBlock:^{
                //[[NSManagedObjectContext MR_defaultContext] MR_saveNestedContexts];
            } progressBlock:nil];
        } else {
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            // Show the errorString somewhere and let the user try again.
            NSLog(@"Error logging in: %@",errorString);
        }        
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [MagicalRecord cleanUp];
}

@end

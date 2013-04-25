//
//  NurserySmileDietInfo.h
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NurserySmileInfo.h"

@interface NurserySmileDietInfo : NurserySmileInfo
@property (weak, nonatomic) IBOutlet UILabel *mealType;
@property (weak, nonatomic) IBOutlet UILabel *drinkType;
@property (weak, nonatomic) IBOutlet UILabel *mealTime;


@end

//
//  NurserySmileMilkInfo.h
//  NurserySmile
//
//  Created by Adam Dossa on 06/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NurserySmileInfo.h"

@interface NurserySmileMilkInfo : NurserySmileInfo
@property (weak, nonatomic) IBOutlet UILabel *milkAmount;
@property (weak, nonatomic) IBOutlet UILabel *milkTime;
@end

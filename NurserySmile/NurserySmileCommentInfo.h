//
//  NurserySmileCommentInfo.h
//  NurserySmile
//
//  Created by Adam Dossa on 03/03/2013.
//  Copyright (c) 2013 Adam Dossa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NurserySmileInfo.h"

@interface NurserySmileCommentInfo : NurserySmileInfo
@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (weak, nonatomic) IBOutlet UIImageView *photo;

@end

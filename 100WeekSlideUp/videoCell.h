//
//  videoCell.h
//  100WeekSlideUp
//
//  Created by Mitesh Maheta on 16/04/15.
//  Copyright (c) 2015 tipsy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define keychannelName @"channelName"
#define keyduration @"duration"
#define keytitle @"title"
#define keydescription @"description"
#define keyimage @"image"
#define keyVideo @"video"

@interface videoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgVideoBackground;
@property (strong, nonatomic) IBOutlet UILabel *lblChannelName;
@property (strong, nonatomic) IBOutlet UILabel *lblVideoDuration;
@property (strong, nonatomic) IBOutlet UILabel *lblHeading;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet UIButton *btnPlay;
@property (strong, nonatomic) NSString *strVideoURL;

-(void)setCellData:(NSMutableDictionary *)videoData isInDisplay:(BOOL)status;
@end

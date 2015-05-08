//
//  homeView.h
//  100WeekSlideUp
//
//  Created by Mitesh Maheta on 17/04/15.
//  Copyright (c) 2015 tipsy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "videoCell.h"

@interface homeView : UIView
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UITableView *tableVideo;

@end

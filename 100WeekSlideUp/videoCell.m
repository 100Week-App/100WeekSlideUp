//
//  videoCell.m
//  100WeekSlideUp
//
//  Created by Mitesh Maheta on 16/04/15.
//  Copyright (c) 2015 tipsy. All rights reserved.
//

#import "videoCell.h"

@implementation videoCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setCellData:(NSMutableDictionary *)videoData isInDisplay:(BOOL)status{
    
    self.lblChannelName.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    self.lblVideoDuration.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    self.lblHeading.layer.shadowColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] CGColor];
    self.lblHeading.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    self.lblHeading.layer.shadowRadius = 2.0;
    self.lblHeading.layer.shadowOpacity = 1.0;
    
    self.lblDescription.layer.shadowColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] CGColor];
    self.lblDescription.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    self.lblDescription.layer.shadowRadius = 2.0;
    self.lblDescription.layer.shadowOpacity = 1.0;
    
    if (status) {
        self.lblDescription.text = [videoData objectForKey:keydescription];
        self.imgVideoBackground.alpha = 1.0;
        
        self.btnPlay.hidden = FALSE;
        self.btnPlay.enabled = TRUE;
        
    }else{
        self.lblDescription.text = Nil;
        self.imgVideoBackground.alpha = 0.2;
        self.btnPlay.hidden = TRUE;
        self.btnPlay.enabled = FALSE;
    }
    
    self.lblChannelName.text = [videoData objectForKey:keychannelName];
    self.lblVideoDuration.text = [videoData objectForKey:keyduration];
    self.lblHeading.text = [videoData objectForKey:keytitle];
    self.strVideoURL = [videoData objectForKey:keyVideo];
    [self.imgVideoBackground setImage:[UIImage imageNamed:[videoData objectForKey:keyimage]]];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

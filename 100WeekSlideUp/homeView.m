//
//  homeView.m
//  100WeekSlideUp
//
//  Created by Mitesh Maheta on 17/04/15.
//  Copyright (c) 2015 tipsy. All rights reserved.
//

#import "homeView.h"

@interface homeView(){
    
}
@property (strong, nonatomic) IBOutlet UIView *view;

@end
@implementation homeView

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"homeView" owner:self options:nil];
        
        CGRect rect = frame;
        rect.origin = CGPointZero;
        
        [self.view setFrame:rect];
        [self addSubview:self.view];
    
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

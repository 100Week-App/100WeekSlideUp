//
//  ViewController.m
//  100WeekSlideUp
//
//  Created by Mitesh Maheta on 16/04/15.
//  Copyright (c) 2015 tipsy. All rights reserved.
//

#import "ViewController.h"
#import "homeView.h"
#import <QuartzCore/QuartzCore.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController (){
    
    NSIndexPath *currentSelectedIndexPath, *lastSelectedIndexPath;
    
    MPMoviePlayerController *moviePlayer;
}

@property(strong,nonatomic)homeView *homeScreenView;
@property(strong,nonatomic)NSMutableArray *videoData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _homeScreenView = [[homeView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:_homeScreenView];
    _homeScreenView.tableVideo.delegate = self;
    _homeScreenView.tableVideo.dataSource = self;
    [GlobalMethods addConstarintsToView:_homeScreenView superView:self.view top:0 bottom:0 left:0 right:0];
    
    NSError *error;
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"videoData" ofType:@"json"]];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    self.videoData = json[@"videos"];
    
}

-(void)btnPlayTapped:(id)sender{
    
    MPMoviePlayerViewController *movieViewController = [[MPMoviePlayerViewController alloc]initWithContentURL:moviePlayer.contentURL];
    [self presentMoviePlayerViewControllerAnimated:movieViewController];
    
}

-(void)loadMoviePlayer:(videoCell *)cell{

    if (moviePlayer) {
        [moviePlayer stop];
        [moviePlayer.view removeFromSuperview];
        moviePlayer = Nil;
    }
    
    moviePlayer = [[MPMoviePlayerController alloc] init];
    [moviePlayer.view setFrame:cell.contentView.bounds];
    moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
    moviePlayer.view.backgroundColor = [UIColor clearColor];
    moviePlayer.controlStyle = MPMovieControlStyleNone;
    [cell.contentView addSubview:moviePlayer.view];
    
    [cell.contentView bringSubviewToFront:cell.lblChannelName];
    [cell.contentView bringSubviewToFront:cell.lblVideoDuration];
    [cell.contentView bringSubviewToFront:cell.lblHeading];
    [cell.contentView bringSubviewToFront:cell.lblDescription];
    [cell.contentView bringSubviewToFront:cell.btnPlay];
    
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:[cell.strVideoURL stringByDeletingPathExtension] ofType:@"mp4"];
    NSURL *videoURL = [NSURL fileURLWithPath:videoPath];
    [moviePlayer setContentURL:videoURL];
    [moviePlayer prepareToPlay];
    [moviePlayer play];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == currentSelectedIndexPath.row) {
        return 375;
    }else{
        return 105;
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.videoData count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"videoCellIdentifier";
    
    videoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"videoCell" bundle:Nil] forCellReuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == currentSelectedIndexPath.row) {
        
        [self loadMoviePlayer:(videoCell *)cell];
        
        [(videoCell *)cell setCellData:[self.videoData objectAtIndex:indexPath.row] isInDisplay:YES];
        
    }else{
        
        [(videoCell *)cell setCellData:[self.videoData objectAtIndex:indexPath.row] isInDisplay:NO];
    }
    
    [((videoCell *)cell).btnPlay addTarget:self action:@selector(btnPlayTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (moviePlayer) {
        [moviePlayer stop];
        [moviePlayer.view removeFromSuperview];
        moviePlayer = Nil;
    }

    if (currentSelectedIndexPath == Nil) {
        lastSelectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    }else{
        lastSelectedIndexPath = currentSelectedIndexPath;
    }
    
    if (![currentSelectedIndexPath isEqual:indexPath]) {
        
        currentSelectedIndexPath = indexPath;
        
        videoCell *cellLastSelected = (videoCell *)[tableView cellForRowAtIndexPath:lastSelectedIndexPath];
        videoCell *cell = (videoCell *)[tableView cellForRowAtIndexPath:currentSelectedIndexPath];
        
        [UIView beginAnimations:@"myAnimationId" context:nil];
        
        [UIView setAnimationDuration:0.2]; // Set duration here
        
        [CATransaction begin];
        
        [CATransaction setCompletionBlock:^{
            
            [tableView scrollToRowAtIndexPath:indexPath
                             atScrollPosition:UITableViewScrollPositionTop
                                     animated:YES];
            
            [self performSelector:@selector(loadMoviePlayer:) withObject:cell afterDelay:0.5];
//            [self loadMoviePlayer:cell];
            
        }];
        
        [tableView beginUpdates];
        
        [cell setCellData:[self.videoData objectAtIndex:currentSelectedIndexPath.row] isInDisplay:YES];
        
        [cellLastSelected setCellData:[self.videoData objectAtIndex:lastSelectedIndexPath.row] isInDisplay:NO];
        
        [tableView endUpdates];
        
        [CATransaction commit];
        [UIView commitAnimations];
    }
    
    

    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

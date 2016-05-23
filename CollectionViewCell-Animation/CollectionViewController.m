//
//  CollectionViewController.m
//  CollectionViewCell-Animation
//
//  Created by Mac on 16/5/20.
//  Copyright © 2016年 YinTokey. All rights reserved.
//

#import "CollectionViewController.h"
#import "Cell.h"
#import "YTAnimation.h"
@interface CollectionViewController ()
{
    BOOL deleteBtnFlag;
    BOOL vibrateAniFlag;
    
    NSMutableArray *sourceArr;
}


@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self setFlagAndGsr];
    
    //Data source and background
    self.collectionView.backgroundColor = [UIColor whiteColor];
    sourceArr = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
}


#pragma mark <UICollectionViewDataSource>

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10,8,10,8);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return sourceArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //configure your cell
    NSString *imgString = sourceArr[indexPath.row];
    cell.imgView.image = [UIImage imageNamed:imgString];

   

    //add this method implementation in your  "cellForItemAtIndexPath"
    [self setCellVibrate:cell IndexPath:indexPath];
    
    

    return cell;
}


-(void)deleteCellAtIndexpath:(NSIndexPath *)indexPath cellView:(Cell *)cell
{
   
    [self.collectionView performBatchUpdates:^{
        
            //delete the cell you selected
            [sourceArr removeObjectAtIndex:indexPath.row];
            [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];

    } completion:^(BOOL finished) {
            [self.collectionView reloadData];
    }];
}

//the following methods you just need copy ~ paste
- (void)setFlagAndGsr{
    deleteBtnFlag = YES;
    vibrateAniFlag = YES;
    [self addDoubleTapGesture];
}
- (void)setCellVibrate:(Cell *)cell IndexPath:(NSIndexPath *)indexPath{
    cell.indexPath = indexPath;
    cell.deleteBtn.hidden = deleteBtnFlag?YES:NO;
    if (!vibrateAniFlag) {
        [YTAnimation vibrateAnimation:cell];
    }else{
        [cell.layer removeAnimationForKey:@"shake"];
    }
    cell.delegate = self;
}
- (void) handleDoubleTap:(UITapGestureRecognizer *) gestureRecognizer{
    [self hideAllDeleteBtn];
}
- (void)addDoubleTapGesture{
    UITapGestureRecognizer *doubletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubletap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubletap];
}
- (void)hideAllDeleteBtn{
    if (!deleteBtnFlag) {
        deleteBtnFlag = YES;
        vibrateAniFlag = YES;
        [self.collectionView reloadData];
    }
}
- (void)showAllDeleteBtn{
    deleteBtnFlag = NO;
    vibrateAniFlag = NO;
    [self.collectionView reloadData];
}


@end

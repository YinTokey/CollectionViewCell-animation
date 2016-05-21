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
    BOOL rotateAniFlag;
    NSMutableArray *sourceArr;
}


@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    deleteBtnFlag = YES;
    rotateAniFlag = YES;
    [self addDoubleTapGesture];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //Data source
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
    
    cell.indexPath = indexPath;
    cell.deleteBtn.hidden = deleteBtnFlag?YES:NO;
    if (!rotateAniFlag) {
        [YTAnimation vibrateAnimation:cell];
    }else{
        [cell.layer removeAnimationForKey:@"shake"];
    }
    cell.delegate = self;
    
    
    //configure your cell
    NSString *imgString = sourceArr[indexPath.row];
    cell.imgView.image = [UIImage imageNamed:imgString];
    return cell;
}


-(void)deleteCellAtIndexpath:(NSIndexPath *)indexPath cellView:(Cell *)cell
{
    if (sourceArr.count == 0) {
        return;
    }
    
    [self.collectionView performBatchUpdates:^{

        cell.imgView.image = nil;
        cell.deleteBtn.hidden = YES;
        
        [YTAnimation fadeAnimation:cell];

        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1ULL * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            //延时1s执行。下面这两行执行删除cell的操作，包括移除数据源和删除item，如果你用到数据库或Core Data,
            //要先删掉数据库里内容，在执行移除数据源和删除item
            [sourceArr removeObjectAtIndex:indexPath.row];
            [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
            
            
        });

    } completion:^(BOOL finished) {
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1ULL * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            [self.collectionView reloadData];
        });

    }];
    
    
}

- (void) handleDoubleTap:(UITapGestureRecognizer *) gestureRecognizer
{
    [self hideAllDeleteBtn];
}

-(void)addDoubleTapGesture{
    UITapGestureRecognizer *doubletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubletap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubletap];
}


-(void)hideAllDeleteBtn{
    if (!deleteBtnFlag) {
        deleteBtnFlag = YES;
        rotateAniFlag = YES;
        [self.collectionView reloadData];
    }
}

-(void)showAllDeleteBtn{
    deleteBtnFlag = NO;
    rotateAniFlag = NO;
    [self.collectionView reloadData];
}


@end

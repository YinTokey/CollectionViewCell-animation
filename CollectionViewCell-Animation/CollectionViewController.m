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
@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    BOOL deleteBtnFlag;
    BOOL rotateAniFlag;

    UIImageView *trashView;
    NSMutableArray *sourceArr;
}
@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    deleteBtnFlag = YES;
    rotateAniFlag = YES;
    sourceArr = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
    
    //add trash icon
    trashView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width -60, self.view.frame.size.height -60, 50, 50)];
    trashView.image = [UIImage imageNamed:@"trash"];
    [self.view addSubview:trashView];
    trashView.hidden = YES;
    
    [self addDoubleTapGesture];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}



#pragma mark <UICollectionViewDataSource>

#pragma mark collection view cell paddings
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10,8,10,8);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return sourceArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.indexPath = indexPath;
    cell.deleteBtn.hidden = deleteBtnFlag?YES:NO;
    
    
    NSString *imgString = sourceArr[indexPath.row];
    cell.imgView.image = [UIImage imageNamed:imgString];
    if (!rotateAniFlag) {
        [YTAnimation rotateAnimation:cell];
    }else{
        //remove animation
        [cell.layer removeAnimationForKey:@"shake"];
    }
    cell.delegate = self;
    return cell;
}

#pragma mark <UICollectionViewDelegate>




// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void)hideAllDeleteBtn{
    if (!deleteBtnFlag) {
        deleteBtnFlag = YES;
        rotateAniFlag = YES;
        trashView.hidden = YES;
        
        [self.collectionView reloadData];
    }
    
}

-(void)showAllDeleteBtn{
    deleteBtnFlag = NO;
    rotateAniFlag = NO;
    
    trashView.hidden = NO;
    [self.collectionView reloadData];

    
    
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

-(void)deleteCellAtIndexpath:(NSIndexPath *)indexPath cellView:(Cell *)cell
{
    if (sourceArr.count == 0) {
        return;
    }
    
    [self.collectionView performBatchUpdates:^{

       // [YTAnimation toTrashAnimation:cell trashView:trashView];
        //这两句成立，使用转场动画删除
    //    cell.imgView.image = nil;
    //    cell.deleteBtn.hidden = YES;
        
        
      //  [ YTAnimation fadeAnimation:cell];
        [YTAnimation toMiniAnimation:cell];
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1ULL * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            // 任务会在1秒后执行
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





@end

//
//  Cell.h
//  CollectionViewCell-Animation
//
//  Created by Mac on 16/5/20.
//  Copyright © 2016年 YinTokey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Cell;
@protocol CellDelegate <NSObject>

-(void)deleteCellAtIndexpath:(NSIndexPath *)indexPath cellView:(Cell *)cell;
-(void)showAllDeleteBtn;
-(void)hideAllDeleteBtn;
@end

@interface Cell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;


@property (nonatomic,strong) UIButton *deleteBtn;
@property (nonatomic,strong)NSIndexPath *indexPath;
@property (nonatomic,weak) id<CellDelegate>delegate;

@end

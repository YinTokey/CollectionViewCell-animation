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



@property (nonatomic,weak) id<CellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic,strong) UIButton *deleteBtn;
@property (nonatomic,strong)NSIndexPath *indexPath;

- (void)toTrashAnimation:(UIView *)itemView trashView:(UIView *)TrashView;

@end

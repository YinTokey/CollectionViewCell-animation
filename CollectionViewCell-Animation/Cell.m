//
//  Cell.m
//  CollectionViewCell-Animation
//
//  Created by Mac on 16/5/20.
//  Copyright © 2016年 YinTokey. All rights reserved.
//

#import "Cell.h"
#import "YTAnimation.h"
@implementation Cell{
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self setCell];
        
    }
    return self;
}


#pragma mark - setAnimationType
- (void)setAnimationType
{
    
    [YTAnimation toMiniAnimation:self];
    
}
//the following methods ,you just need copy ~ paste
- (void)setCell{
    [self addDeleteButton];
    [self addLongPressGesture];
}
- (void)addLongPressGesture{
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longClick:)];
    [self addGestureRecognizer:lpgr];
}
- (void)longClick:(UILongPressGestureRecognizer *)lpgr
{

    [self.delegate showAllDeleteBtn];
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if ([anim valueForKey:@"animType"] ){
         [self.delegate deleteCellAtIndexpath:_indexPath cellView:self];
    }
   
}
#warning there is a picture in Assets.xcassets
- (void)addDeleteButton{
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteBtn.frame = CGRectMake(0, 0, 20, 20);
    [_deleteBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    _deleteBtn.hidden = YES;
    [_deleteBtn addTarget:self action:@selector(setAnimationType) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_deleteBtn];
  
}

@end

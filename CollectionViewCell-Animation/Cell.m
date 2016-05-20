//
//  Cell.m
//  CollectionViewCell-Animation
//
//  Created by Mac on 16/5/20.
//  Copyright © 2016年 YinTokey. All rights reserved.
//

#import "Cell.h"

@implementation Cell
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // change to our custom selected background view

        
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBtn.frame = CGRectMake(0, 0, 20, 20);
        [_deleteBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        _deleteBtn.hidden = YES;
        [_deleteBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_deleteBtn];
   
        UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longClick:)];
        [self addGestureRecognizer:lpgr];
        [_deleteBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)longClick:(UILongPressGestureRecognizer *)lpgr
{

    [self.delegate showAllDeleteBtn];
    
}

-(void)btnClick
{
    
    [self.delegate deleteCellAtIndexpath:_indexPath cellView:self];
}



@end

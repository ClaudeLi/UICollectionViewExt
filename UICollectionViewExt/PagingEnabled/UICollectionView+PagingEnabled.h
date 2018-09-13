//
//  UICollectionView+PagingEnabled.h
//  Tiaooo
//
//  Created by ClaudeLi on 2018/9/6.
//  Copyright © 2018年 ClaudeLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (PagingEnabled)

/**
 横向滚动一页的宽度 或 纵向滚动一页的高度,
 注: 横向滚动时height=0, 纵向滚动时width=0
 */
@property (nonatomic, assign) CGSize    pagingSize; // default self.scrollEnabled = NO

/**
 分页个数
 */
@property (nonatomic, assign) NSInteger pagingCount;

/**
 重置paging, CGPointZero
 */
- (void)resetPaging;

@end

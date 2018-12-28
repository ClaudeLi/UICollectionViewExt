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
 The width of a page to scroll horizontally or the height of a page to scroll vertically, eg:CGSizeMake(self.view.width, 0)
 ps: When using default self.scrollEnabled = NO
 */
@property (nonatomic, assign) CGSize    pagingSize;

/**
 The number of pages
 */
@property (nonatomic, assign) NSInteger pagingCount;

/**
 Reset the contentOffset, CGPointZero
 */
- (void)resetPaging;

@end

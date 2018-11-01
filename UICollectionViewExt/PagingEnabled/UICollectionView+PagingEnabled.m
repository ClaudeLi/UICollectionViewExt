
//
//  UICollectionView+PagingEnabled.m
//  Tiaooo
//
//  Created by ClaudeLi on 2018/9/6.
//  Copyright © 2018年 ClaudeLi. All rights reserved.
//

#import "UICollectionView+PagingEnabled.h"
#import <objc/runtime.h>

@interface UICollectionView ()<UIScrollViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIScrollView *pagingScrollView;

@end

@implementation UICollectionView (PagingEnabled)

- (void)setPagingSize:(CGSize)pagingSize{
    //id  不让放struct 类型
    NSArray *size = @[@(pagingSize.width),@(pagingSize.height)];
    objc_setAssociatedObject(self, @selector(pagingSize), size, OBJC_ASSOCIATION_RETAIN);
    if (CGSizeEqualToSize(pagingSize, CGSizeZero)) {
        [self removePagingScrollView];
    }else{
        self.scrollEnabled = NO;
        [self registPagingScrollView];
    }
}

- (CGSize)pagingSize{
    NSArray *size = objc_getAssociatedObject(self, @selector(pagingSize));
    if (size.count == 2) {
        return CGSizeMake([size[0] floatValue], [size[1] floatValue]);
    }
    return CGSizeZero;
}

- (void)setPagingCount:(NSInteger)pagingCount{
    objc_setAssociatedObject(self, @selector(pagingCount), @(pagingCount), OBJC_ASSOCIATION_ASSIGN);
    [self resetPagingScrollViewContentSize:pagingCount];
}

- (NSInteger)pagingCount{
    return [objc_getAssociatedObject(self, @selector(pagingCount)) integerValue];
}

- (void)setPagingScrollView:(UIScrollView *)pagingScrollView{
    objc_setAssociatedObject(self, @selector(pagingScrollView), pagingScrollView, OBJC_ASSOCIATION_RETAIN);
}

- (UIScrollView *)pagingScrollView{
    return objc_getAssociatedObject(self, @selector(pagingScrollView));
}

- (void)resetPaging{
    self.contentOffset = CGPointZero;
    if (self.pagingScrollView) {
        self.pagingScrollView.contentOffset = CGPointZero;
    }
}

- (void)removePagingScrollView{
    if (self.pagingScrollView.superview) {
        [self removeGestureRecognizer:self.pagingScrollView.panGestureRecognizer];
        [self.pagingScrollView removeFromSuperview];
    }
}

- (void)registPagingScrollView{
    if (!self.pagingScrollView) {
        self.pagingScrollView = [UIScrollView new];
        self.pagingScrollView.pagingEnabled = YES;
        self.pagingScrollView.delegate = self;
        self.pagingScrollView.hidden = YES;
        [self resetPagingScrollViewContentSize:2];
    }
    if (!self.pagingScrollView.superview) {
        [self addGestureRecognizer:self.pagingScrollView.panGestureRecognizer];
        // 上句 = 下句+tapPagingScrollView+hitTest
//        [self.pagingScrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPagingScrollView:)]];
        [self addSubview:self.pagingScrollView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.pagingScrollView &&
        scrollView == self.pagingScrollView) {
        [self resetPagingScrollViewContentSize:self.pagingCount];
        CGFloat hPage = self.pagingSize.width?self.pagingScrollView.contentOffset.x/self.pagingScrollView.frame.size.width:0;
        CGFloat vPage = self.pagingSize.height?self.pagingScrollView.contentOffset.y/self.pagingScrollView.frame.size.height:0;
        self.contentOffset = CGPointMake(hPage*self.pagingSize.width, vPage*self.pagingSize.height);
    }
}

- (void)resetPagingScrollViewContentSize:(NSInteger)pagingCount{
    if (self.pagingSize.width) {
        if (pagingCount != (self.pagingScrollView.contentSize.width/self.pagingSize.width)) {
            self.pagingScrollView.frame = CGRectMake(0, 0, self.pagingSize.width, 1);
            self.pagingScrollView.contentSize = CGSizeMake(self.pagingSize.width*pagingCount, 0);
        }
    }else{
        if (pagingCount != (self.pagingScrollView.contentSize.width/self.pagingSize.height)) {
            self.pagingScrollView.frame = CGRectMake(0, 0, 1, self.pagingSize.height);
            self.pagingScrollView.contentSize = CGSizeMake(0, self.pagingSize.height*pagingCount);
        }
    }
}

//- (void)tapPagingScrollView:(UITapGestureRecognizer *)tapGR {
//    CGPoint point = [tapGR locationInView:self];
//    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
//    if (indexPath) {
//        if ([self.delegate respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:)]) {
//            [self collectionView:self didSelectItemAtIndexPath:indexPath];
//        }
//    }
//}
//
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    if (self.pagingScrollView) {
//        if ([self.layer containsPoint:point]) {
//            return self.pagingScrollView;
//        }
//    }
//    return [super hitTest:point withEvent:event];
//}

@end

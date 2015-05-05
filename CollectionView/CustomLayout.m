//
//  CustomLayout.m
//  SBDemo
//
//  Created by Will ; on 15/3/30.
//  Copyright (c) 2015年 xogrp. All rights reserved.
//

#import "CustomLayout.h"
@interface CustomLayout()
@property(nonatomic,assign)CGFloat currentOffsetY;
@end
@implementation CustomLayout
-(void)prepareLayout
{
    self.itemSize = self.collectionView.bounds.size;
    NSLog(@"%@",NSStringFromCGRect(self.collectionView.bounds));
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    
    [array enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes* attributes, NSUInteger idx, BOOL *stop) {
        attributes.zIndex=-idx;
        if (idx!=0) {
            CGRect frame=self.collectionView.bounds;
//            frame.origin.y-=idx*10;
            attributes.frame=frame;
        }
    }];
    return array;
}

@end

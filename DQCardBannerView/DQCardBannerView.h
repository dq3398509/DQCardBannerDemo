//
//  DQCardBannerView.h
//  DQCardBannerView
//
//  Created by edz on 2018/5/28.
//  Copyright © 2018年 DQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DQCardBannerViewDelegate <NSObject>

@optional


@end

@interface DQCardBannerView : UIView

@property (nonatomic, strong) UICollectionView *collectionView;

+ (instancetype)DQCardBannerViewWithFrame:(CGRect)frame delegate:(id<DQCardBannerViewDelegate>)delegate;

@property (nonatomic, weak) id<DQCardBannerViewDelegate> delegate;

// 传入图片数组和 title 数组
@property (nonatomic, strong) NSMutableArray *imageUrlArray;
@property (nonatomic, strong) NSArray *titleArray;

@end

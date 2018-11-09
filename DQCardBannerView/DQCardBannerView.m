//
//  DQCardBannerView.m
//  DQCardBannerView
//
//  Created by edz on 2018/5/28.
//  Copyright © 2018年 DQ. All rights reserved.
//

#import "DQCardBannerView.h"
#import "DQCardBannerViewCell.h"
#import "CollectionFlowLayout.h"

@interface DQCardBannerView() <UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *tapScrollView;

@end

@implementation DQCardBannerView 

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCollectionView];
//        [self createScrollView];
    }
    return self;
}

+ (instancetype)DQCardBannerViewWithFrame:(CGRect)frame delegate:(id<DQCardBannerViewDelegate>)delegate
{
    DQCardBannerView *cardBannerView = [[self alloc] initWithFrame:frame];
    cardBannerView.delegate = delegate;
    return cardBannerView;
}

- (void)createCollectionView {
    
    UICollectionViewFlowLayout *flow = [[CollectionFlowLayout alloc] init];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];

    flow.minimumLineSpacing = 20;
    flow.minimumInteritemSpacing = 20;
    flow.itemSize = CGSizeMake(self.bounds.size.width - 20,self.bounds.size.height);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) collectionViewLayout:flow];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
//    self.collectionView.scrollEnabled = YES;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.alwaysBounceHorizontal = YES;
//    self.collectionView.clipsToBounds = NO;
    [self.collectionView registerClass:[DQCardBannerViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:self.collectionView];
    
}

- (void)setImageUrlArray:(NSMutableArray *)imageUrlArray
{
    _imageUrlArray = imageUrlArray;
    NSString *tempStr = [_imageUrlArray lastObject];
    [_imageUrlArray insertObject:tempStr atIndex:0];
    [_imageUrlArray addObject:_imageUrlArray[1]];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

#pragma mark  设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageUrlArray.count;
}

#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DQCardBannerViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.backgroundColor = [UIColor redColor];
    } else if (indexPath.row == 1) {
        cell.backgroundColor = [UIColor yellowColor];
    } else {
        cell.backgroundColor = [UIColor blackColor];
    } 
    return cell;
}


#pragma mark  点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"---------------------");
}

#pragma mark  设置CollectionViewCell是否可以被点击
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 获取当前显示的cell的下标
    NSIndexPath *firstIndexPath = [[self.collectionView indexPathsForVisibleItems] firstObject];
    
    if (firstIndexPath.row == 0) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.imageUrlArray.count - 2 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    } else if (firstIndexPath.row == self.imageUrlArray.count - 1) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
}

@end

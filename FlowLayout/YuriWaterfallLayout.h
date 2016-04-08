//
//  YuriWaterfallLayout.h
//  FlowLayout
//
//  Created by 张晓飞 on 16/4/8.
//  Copyright © 2016年 张晓飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YuriWaterfallLayout;

@protocol YuriWaterFallLayoutDelegate <NSObject>

//计算item高度的代理方法，将item的高度与indexPath传递给外界
- (CGFloat)waterfallLayout:(YuriWaterfallLayout *)waterfallLayout itemHeightWithItemWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath;

@end

@interface YuriWaterfallLayout : UICollectionViewLayout
/**
 *  列数，默认值为3;
 */
@property (nonatomic, assign) NSInteger columnNumber;
/**
 *  列间距
 */
@property (nonatomic, assign) CGFloat columnSpacing;
/**
 *  行间距
 */
@property (nonatomic, assign) CGFloat rowSpacing;
/**
 *  每个section 与 collectionview的间距
 */
@property (nonatomic, assign) UIEdgeInsets sectionEdgeInsets;

@property (nonatomic, weak) id<YuriWaterFallLayoutDelegate> delegate;

@property (nonatomic, strong) CGFloat(^itemHeightBlock)(CGFloat itemWight, NSIndexPath *indexPath);

+ (instancetype)waterFallLayoutWithColumnCount:(NSInteger)columnCount;
- (instancetype)initWithColumnCount:(NSInteger)columnCount;
- (void)setColumnSpacing:(NSInteger)columnSpacing rowSpacing:(NSInteger)rowSepacing sectionInset:(UIEdgeInsets)sectionInset;
@end

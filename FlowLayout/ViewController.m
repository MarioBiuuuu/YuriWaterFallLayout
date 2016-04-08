//
//  ViewController.m
//  FlowLayout
//
//  Created by 张晓飞 on 16/4/8.
//  Copyright © 2016年 张晓飞. All rights reserved.
//

#import "ViewController.h"
#import "Image.h"
#import "YuriWaterfallLayout.h"
#import "FlowCollectionViewCell.h"
@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, YuriWaterFallLayoutDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionView];
    
}

- (NSMutableArray *)images {
    if (_images == nil) {
        
        _images = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"image.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in arr) {
            Image *image = [Image imageWithImageDic:dict];
            [_images addObject:image];
        }
        
    }
    return _images;
}

- (void)setupCollectionView {
    
    YuriWaterfallLayout *layout = [YuriWaterfallLayout waterFallLayoutWithColumnCount:3];
    
    [layout setColumnSpacing:5 rowSpacing:5 sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    layout.delegate = self;
//    [layout setItemHeightBlock:^CGFloat(CGFloat itemWidth, NSIndexPath *indexPath) {
//        Image *image = self.images[indexPath.item];
//        return image.imageH / image.imageW * itemWidth;
//    }];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FlowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
}

//根据item的宽度与indexPath计算每一个item的高度
- (CGFloat)waterfallLayout:(YuriWaterfallLayout *)waterfallLayout itemHeightWithItemWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
    Image *image = self.images[indexPath.item];
    return image.imageH / image.imageW * itemWidth;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%ld",self.images.count);
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FlowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    Image *image = self.images[indexPath.item];
    cell.imageURL = image.imageURL;
    return cell;
}
@end

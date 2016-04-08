//
//  Image.m
//  FlowLayout
//
//  Created by 张晓飞 on 16/4/8.
//  Copyright © 2016年 张晓飞. All rights reserved.
//

#import "Image.h"

@implementation Image
+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic {
    Image *image = [[Image alloc] init];
    image.imageURL = [NSURL URLWithString:imageDic[@"img"]];
    image.imageW = [imageDic[@"w"] floatValue];
    image.imageH = [imageDic[@"h"] floatValue];
    return image;
}

@end

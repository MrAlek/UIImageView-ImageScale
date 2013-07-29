//
//  UIImageView+ImageScale.h
//  SATSYou
//
//  Created by Alek Åström apegroup on 2013-07-29.
//  Copyright (c) 2013 Apegroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ImageScale)

- (CGSize)imageScaleForSize:(CGSize)size;
- (CGSize)imageScale;

- (CGSize)sizeWithScaledImageThatFits:(CGSize)size;
- (void)sizeToFitScaledImageWithMaxSize:(CGSize)maxSize;
- (void)sizeToFitScaledImage;

@end

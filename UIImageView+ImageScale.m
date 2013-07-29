//
//  UIImageView+ImageScale.m
//  SATSYou
//
//  Created by Alek Åström apegroup on 2013-07-29.
//  Copyright (c) 2013 Apegroup. All rights reserved.
//

#import "UIImageView+ImageScale.h"

@implementation UIImageView (ImageScale)

- (CGSize)imageScaleForSize:(CGSize)size {
    // This method is copied from Cyrille's answer at
    // http://stackoverflow.com/questions/6856879/iphone-getting-the-size-of-an-image-after-aspectft
    
    if (!self.image) {
        return CGSizeZero;
    }
    
    CGFloat sx = size.width / self.image.size.width;
    CGFloat sy = size.height / self.image.size.height;
    CGFloat s = 1.0;
    switch (self.contentMode) {
        case UIViewContentModeScaleAspectFit:
            s = fminf(sx, sy);
            return CGSizeMake(s, s);
            break;
            
        case UIViewContentModeScaleAspectFill:
            s = fmaxf(sx, sy);
            return CGSizeMake(s, s);
            break;
            
        case UIViewContentModeScaleToFill:
            return CGSizeMake(sx, sy);
            
        default:
            return CGSizeMake(s, s);
    }
}

- (CGSize)imageScale {
    return [self imageScaleForSize:self.bounds.size];
}

- (CGSize)sizeWithScaledImageThatFits:(CGSize)size {
    CGSize imageScale = [self imageScaleForSize:size];
    return CGSizeMake(imageScale.width*self.image.size.width, imageScale.height*self.image.size.height);
}

- (void)sizeToFitScaledImageWithMaxSize:(CGSize)maxSize {
    
    CGSize sizeThatFits = [self sizeWithScaledImageThatFits:maxSize];
    
    CGRect bounds = self.bounds;
    bounds.size = sizeThatFits;
    self.bounds = bounds;
}

- (void)sizeToFitScaledImage {
    CGSize sizeThatFits = [self sizeWithScaledImageThatFits:self.bounds.size];
    
    CGRect bounds = self.bounds;
    bounds.size = sizeThatFits;
    self.bounds = bounds;
}


@end

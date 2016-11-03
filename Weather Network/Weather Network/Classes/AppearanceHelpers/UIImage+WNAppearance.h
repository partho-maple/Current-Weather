//
//  UIImage+WNAppearance.h
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WNAppearance)

- (UIImage *)fixOrientation;
+ (UIImage*)imageWithImage: (UIImage*) sourceImage scaledToHeight: (float) i_height;
+ (UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width;
+ (UIImage *)croppingImage:(UIImage *)imageToCrop toRect:(CGRect)rect;
+ (UIImage *)imageWithColor:(UIColor *)color ;

@end

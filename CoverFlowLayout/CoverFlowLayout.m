//
//  CoverFlowLayout.m
//  CoverFlowLayout
//
//  Created by Steve on 2015-09-10.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "CoverFlowLayout.h"

@implementation CoverFlowLayout

-(void)prepareLayout {
//    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.itemSize = CGSizeMake(250, 300);
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray* attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRegion;
    visibleRegion.origin = self.collectionView.contentOffset;
    visibleRegion.size   = self.collectionView.bounds.size;
    
    // Modify the layout attributes as needed here
    
    CGFloat visibleRegionCenter = (visibleRegion.size.width / 2) + visibleRegion.origin.x;
    
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        
        attribute.alpha = 1.0 - ((fabs(attribute.center.x - visibleRegionCenter))/(visibleRegion.size.width / 2));
        
        if (attribute.alpha <= 0.2) {
            attribute.alpha = 0.2;
        }

        CGFloat x = 1 - ((fabs(attribute.center.x - visibleRegionCenter))/(visibleRegion.size.width / 2));
        CGFloat y = 1 - ((fabs(attribute.center.x - visibleRegionCenter))/(visibleRegion.size.width / 2));
        
//        if (x <= 0.5) {
//            x = 0.5;
//        }
//        
//        if (y <= 0.5) {
//            y = 0.5;
//        }
        
        
        attribute.transform3D = CATransform3DScale(CATransform3DIdentity,x, 1, 1);
        attribute.transform3D = CATransform3DRotate(attribute.transform3D, 0.0, attribute.center.x, attribute.center.y * y, 1);
        
    }
    
    return attributes;
    
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end

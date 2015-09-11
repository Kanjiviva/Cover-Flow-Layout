//
//  ImageCollectionViewCell.m
//  InstaKilo
//
//  Created by Steve on 2015-09-09.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@interface ImageCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;

@end

@implementation ImageCollectionViewCell

- (void)setPhoto:(Photo *)photo {
    _photo = photo;
    
    [self setup];
}

- (void)setup {
    self.displayImage.image = self.photo.image;
}

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self.displayImage.image = _photo.image;
//    }
//    return self;
//}

@end

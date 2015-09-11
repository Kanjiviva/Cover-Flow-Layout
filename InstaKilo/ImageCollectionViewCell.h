//
//  ImageCollectionViewCell.h
//  InstaKilo
//
//  Created by Steve on 2015-09-09.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface ImageCollectionViewCell : UICollectionViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *displayImageView;
//@property (strong, nonatomic) UIImage *image;

@property (strong, nonatomic) Photo *photo;


@end

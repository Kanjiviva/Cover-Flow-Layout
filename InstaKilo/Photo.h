//
//  Photo.h
//  InstaKilo
//
//  Created by Steve on 2015-09-09.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *subject;

- (instancetype)initWithImage:(UIImage *)image location:(NSString *)location subject:(NSString *)subject;

@end

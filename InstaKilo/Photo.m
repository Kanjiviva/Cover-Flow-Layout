//
//  Photo.m
//  InstaKilo
//
//  Created by Steve on 2015-09-09.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithImage:(UIImage *)image location:(NSString *)location subject:(NSString *)subject
{
    self = [super init];
    if (self) {
        _image = image;
        _location = location;
        _subject = subject;
    }
    return self;
}

@end

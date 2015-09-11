//
//  HeaderCollectionReusableView.m
//  InstaKilo
//
//  Created by Steve on 2015-09-09.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "HeaderCollectionReusableView.h"

@interface HeaderCollectionReusableView ()

@property (weak, nonatomic) IBOutlet UILabel *headerLabel;

@end

@implementation HeaderCollectionReusableView

- (void)setSectionHeaderName:(NSString *)sectionHeaderName {
    
    // override the setter
    _sectionHeaderName = sectionHeaderName;
    
    [self setup];
}

- (void)setup {
    
    self.headerLabel.text = self.sectionHeaderName;
    self.headerLabel.textColor = [UIColor blackColor];
}

@end

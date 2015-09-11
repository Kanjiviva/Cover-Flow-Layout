//
//  ViewController.m
//  InstaKilo
//
//  Created by Steve on 2015-09-09.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "ViewController.h"
#import "ImageCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "Photo.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) NSArray *photos;
@property (nonatomic) NSMutableDictionary *sortedPhotosByLocation;
@property (nonatomic) NSMutableDictionary *sortedPhotosBySubject;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *chooseGroupBySegment;
- (IBAction)groupBySegment:(UISegmentedControl *)sender;

@property (nonatomic) UICollectionViewFlowLayout *flowLayout;

@end

@implementation ViewController

#pragma mark - UIViewController Life Cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(110, 110);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 10;
    self.flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50);
    
    self.photos = @[[[Photo alloc]initWithImage:[UIImage imageNamed:@"IMG_1312.jpg"] location:@"Surrey" subject:@"Out"],
                   [[Photo alloc]initWithImage:[UIImage imageNamed:@"IMG_1288.jpg"] location:@"Vancouver" subject:@"Home"],
                   [[Photo alloc]initWithImage:[UIImage imageNamed:@"IMG_1280.jpg"] location:@"Richmond" subject:@"Out"],
                   [[Photo alloc]initWithImage:[UIImage imageNamed:@"IMG_1273.jpg"] location:@"Vancouver" subject:@"Out"],
                   [[Photo alloc]initWithImage:[UIImage imageNamed:@"IMG_1286.jpg"] location:@"Vancouver" subject:@"Home"],
                   [[Photo alloc]initWithImage:[UIImage imageNamed:@"IMG_1090.jpg"] location:@"Vancouver" subject:@"Home"],
                   [[Photo alloc]initWithImage:[UIImage imageNamed:@"IMG_1287.jpg"] location:@"Vancouver" subject:@"Home"],
                   [[Photo alloc]initWithImage:[UIImage imageNamed:@"IMG_1289.jpg"] location:@"Vancouver" subject:@"Home"],
                   [[Photo alloc]initWithImage:[UIImage imageNamed:@"IMG_1091.jpg"] location:@"Vancouver" subject:@"Home"],
                   [[Photo alloc]initWithImage:[UIImage imageNamed:@"IMG_1202.jpg"] location:@"Vancouver" subject:@"Home"]
                   ];
    
    [self sortPhotosByLocation];
    [self sortPhotosBySubject];
    
    self.collectionView.collectionViewLayout = self.flowLayout;

}

#pragma mark - UICollectionViewDataSource -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    if (self.chooseGroupBySegment.selectedSegmentIndex == 0) {
        return [self.sortedPhotosByLocation count];
    } else {
        return [self.sortedPhotosBySubject count];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.chooseGroupBySegment.selectedSegmentIndex == 0) {
        NSArray *listOfKeys = [self.sortedPhotosByLocation allKeys];
        NSString *key = listOfKeys[section];
        
        return [self.sortedPhotosByLocation[key] count];
    } else {
        NSArray *listOfKeys = [self.sortedPhotosBySubject allKeys];
        NSString *key = listOfKeys[section];
        
        return [self.sortedPhotosBySubject[key] count];
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld", (long)indexPath.row);
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    
    if (self.chooseGroupBySegment.selectedSegmentIndex == 0) {
        NSString *key = self.sortedPhotosByLocation.allKeys[indexPath.section];
        
        NSArray *groupPhoto = self.sortedPhotosByLocation[key];
        Photo *photo = groupPhoto[indexPath.row];
        cell.photo = photo;
    } else {
        NSString *key = self.sortedPhotosBySubject.allKeys[indexPath.section];
        
        NSArray *groupPhoto = self.sortedPhotosBySubject[key];
        Photo *photo = groupPhoto[indexPath.row];
        cell.photo = photo;
        
    }
    
    
        return cell;
}

#pragma mark - UICollectionViewDelegate -

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:
                                                UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    
    headerView.backgroundColor = [UIColor whiteColor];
    
    if (self.chooseGroupBySegment.selectedSegmentIndex == 0) {
        headerView.sectionHeaderName = self.sortedPhotosByLocation.allKeys[indexPath.section];
    } else {
        headerView.sectionHeaderName = self.sortedPhotosBySubject.allKeys[indexPath.section];
    }

    return headerView;
    
}

#pragma mark - General Methods -

- (void)sortPhotosByLocation {
    self.sortedPhotosByLocation = [NSMutableDictionary dictionary];
    
    for (Photo *photo in self.photos) {
        NSMutableArray *photosAtLocation = [self.sortedPhotosByLocation[photo.location] mutableCopy];
        if (!photosAtLocation) photosAtLocation = [NSMutableArray array];
        [photosAtLocation addObject:photo];
        self.sortedPhotosByLocation[photo.location] = photosAtLocation;
    }
}

- (void)sortPhotosBySubject {
    self.sortedPhotosBySubject = [NSMutableDictionary dictionary];
    
    for (Photo *photo in self.photos) {
        NSMutableArray *photosAtLocation = [self.sortedPhotosBySubject[photo.subject] mutableCopy];
        if (!photosAtLocation) photosAtLocation = [NSMutableArray array];
        [photosAtLocation addObject:photo];
        self.sortedPhotosBySubject[photo.subject] = photosAtLocation;
    }
}

#pragma mark - IBActions -

- (IBAction)groupBySegment:(UISegmentedControl *)sender {
    [UIView animateWithDuration:1.0 animations:^{
        [self.collectionView reloadData];
    }];
    
}
@end

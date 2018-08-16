//
//  PhotoViewController.m
//  InstKilo
//
//  Created by Kit Clark-O'Neil on 2018-08-15.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "PhotoViewController.h"
#import "Photo.h"
#import "PhotoViewCell.h"
#import "headerCollectionReusableView.h"
@interface PhotoViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UISegmentedControl *SubjectLocationControl;
@property NSMutableArray *myPhotoCollection;
@property NSMutableArray *myPhotoCollectionA;
@property NSMutableArray *myPhotoCollectionB;
@property NSString *firstHeader;
@property NSString *secondHeader;

@property (weak, nonatomic) IBOutlet UICollectionView *CollectionViewController;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.myPhotoCollection = [[NSMutableArray alloc] init];
    self.myPhotoCollectionA = [[NSMutableArray alloc] init];
    self.firstHeader = @"Asia";
    self.secondHeader = @"Europe";
    
    self.myPhotoCollectionB = [[NSMutableArray alloc] init];
    Photo *image1 = [[Photo alloc] initWith:@"Image1" Location:@"Asia" andSubject:@"The Humanity Of Nature"];
    [self.myPhotoCollection addObject:image1];
    [self.myPhotoCollectionA addObject:image1];
    
    Photo *image2 = [[Photo alloc] initWith:@"Image2" Location:@"Asia" andSubject:@"The Humanity Of Nature"];
    [self.myPhotoCollection addObject:image2];
    [self.myPhotoCollectionA addObject:image2];
    
    Photo *image3 = [[Photo alloc] initWith:@"Image3" Location:@"Asia" andSubject:@"The Humanity Of Nature"];
    [self.myPhotoCollection addObject:image3];
    [self.myPhotoCollectionA addObject:image3];
    
    Photo *image4 = [[Photo alloc] initWith:@"Image4" Location:@"Asia" andSubject:@"The Humanity Of Nature"];
    [self.myPhotoCollection addObject:image4];
    [self.myPhotoCollectionA addObject:image4];
    
    Photo *image5 = [[Photo alloc] initWith:@"Image5" Location:@"Asia" andSubject:@"The Humanity Of Nature"];
    [self.myPhotoCollection addObject:image5];
    [self.myPhotoCollectionA addObject:image5];
    
    Photo *image6 = [[Photo alloc] initWith:@"Image6" Location:@"Europe" andSubject:@"The Nature Of Humanity"];
    [self.myPhotoCollection addObject:image6];
    [self.myPhotoCollectionB addObject:image6];
    
    Photo *image7 = [[Photo alloc] initWith:@"Image7" Location:@"Europe" andSubject:@"The Nature Of Humanity"];
    [self.myPhotoCollection addObject:image7];
    [self.myPhotoCollectionB addObject:image7];
    
    Photo *image8 = [[Photo alloc] initWith:@"Image8" Location:@"Europe" andSubject:@"The Nature Of Humanity"];
    [self.myPhotoCollection addObject:image8];
    [self.myPhotoCollectionB addObject:image8];
    
    Photo *image9 = [[Photo alloc] initWith:@"Image9" Location:@"Europe" andSubject:@"The Nature Of Humanity"];
    [self.myPhotoCollection addObject:image9];
    [self.myPhotoCollectionB addObject:image9];
    
    Photo *image10 = [[Photo alloc] initWith:@"Image10" Location:@"Europe" andSubject:@"The Nature Of Humanity"];
    [self.myPhotoCollection addObject:image10];
    [self.myPhotoCollectionB addObject:image10];
    

    
    
    
    
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return (self.myPhotoCollection.count / 5);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"standardImageCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
    Photo *photo = self.myPhotoCollectionA[indexPath.item];
    cell.photoImageView.image = photo.image;
    cell.photoNameLabel.text = photo.imageName;
    return cell;
    }
    else  {
        Photo *photo = self.myPhotoCollectionB[indexPath.item];
        cell.photoImageView.image = photo.image;
        cell.photoNameLabel.text = photo.imageName;
        return cell;
    }
}
-(void)sortPhotosByLocation:(NSString*)AttributeA and: (NSString*) AttributeB {
    
    for (Photo *photo in self.myPhotoCollection)
        if ([photo.location isEqualToString:AttributeA] ==YES) {
            [self.myPhotoCollectionA addObject:photo];
        }
        else {
            [self.myPhotoCollectionB addObject:photo];
        }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    headerCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"sectionHeader" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        headerView.headerLabel.text = self.firstHeader;
    }
    else {
        headerView.headerLabel.text = self.secondHeader;
    }
    return headerView;
}
-(void)sortPhotosBySubject:(NSString*)AttributeA and: (NSString*) AttributeB {
    
    for (Photo *photo in self.myPhotoCollection) {
        if ([photo.subject isEqualToString:AttributeA] ==YES) {
            [self.myPhotoCollectionA addObject:photo];
        }
        else {
            [self.myPhotoCollectionB addObject:photo];
        }
//        NSLog(@"%@", photo.subject);
//        NSLog(@"%@", AttributeA);
    }
}
- (IBAction)SubjectLocationControl:(UISegmentedControl *)sender {
    [self.myPhotoCollectionB removeAllObjects];
    [self.myPhotoCollectionA removeAllObjects];
    if (sender.selectedSegmentIndex == 0) {
        [self sortPhotosByLocation:@"Asia" and:@"Europe"];
        self.firstHeader = @"Asia";
        self.secondHeader = @"Europe";
    }
    if (sender.selectedSegmentIndex == 1) {
        [self sortPhotosBySubject:@"The Nature Of Humanity" and:@"The Humanity Of Nature"];
        self.firstHeader = @"The Nature Of Humanity";
        self.secondHeader = @"The Humanity Of Nature";
    }
    [self.CollectionViewController reloadData];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return (self.myPhotoCollection.count / 2);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ZoomViewController.m
//  ScrollViewImageGalleries
//
//  Created by Kit Clark-O'Neil on 2018-08-13.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "ZoomViewController.h"

@interface ZoomViewController () <UIScrollViewDelegate>

@end

@implementation ZoomViewController

- (instancetype)initWithImageNamed:(NSString*) imageName
{
    self = [super init];
    if (self) {
        _imageName = imageName;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.myImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.imageName]]];
    self.myImageView.translatesAutoresizingMaskIntoConstraints = NO;
//    self.zoomScrollView = [[UIScrollView alloc] init];
//    self.zoomScrollView.frame = self.view.frame;
//    [self.view addSubview: self.zoomScrollView];
     [self.zoomScrollView addSubview:self.myImageView];
    self.zoomScrollView.delegate = self;
    
[NSLayoutConstraint constraintWithItem:self.zoomScrollView
                    attribute:NSLayoutAttributeWidth
                    relatedBy:NSLayoutRelationEqual
                    toItem:self.myImageView
                    attribute:NSLayoutAttributeWidth
                    multiplier:1.0 constant:0].active = YES;

[NSLayoutConstraint constraintWithItem:self.zoomScrollView
                    attribute:NSLayoutAttributeHeight
                    relatedBy:NSLayoutRelationEqual
                    toItem:self.myImageView
                    attribute:NSLayoutAttributeHeight
                    multiplier:1.0 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.zoomScrollView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.myImageView
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.zoomScrollView
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.myImageView
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.zoomScrollView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.myImageView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.zoomScrollView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.myImageView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0 constant:0].active = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}
 -(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{
     
     return  self.myImageView;
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

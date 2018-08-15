//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Kit Clark-O'Neil on 2018-08-13.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *ImageScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView1 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-in-Field"]];
    self.imageView2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-night"]];
    self.imageView3 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-zoomed"]];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToZoom:)];
    [self.view addGestureRecognizer:gesture];
    gesture.numberOfTapsRequired = 2;
    
    self.imageView1.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView2.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView3.translatesAutoresizingMaskIntoConstraints = NO;
    

    [self.ImageScrollView addSubview:self.imageView1];
    [self.ImageScrollView addSubview:self.imageView2];
    [self.ImageScrollView addSubview:self.imageView3];
    
    [NSLayoutConstraint constraintWithItem:self.imageView1
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0 constant:0].active = YES;

    [NSLayoutConstraint constraintWithItem:self.imageView2
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0 constant:0].active = YES;

    [NSLayoutConstraint constraintWithItem:self.imageView3
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.imageView3
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.0
                                  constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.imageView1
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.ImageScrollView
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant: 0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.imageView1
                                attribute:NSLayoutAttributeRight
                                relatedBy:NSLayoutRelationEqual
                                    toItem:self.imageView2
                                    attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                    constant: 0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.imageView2
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.imageView3
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.0
                                  constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.imageView1
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.imageView2
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.0
                                  constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.imageView2
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.imageView3
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant: 0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.ImageScrollView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.imageView3
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:0].active = YES;
    
    

    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)imageZoom:(NSString*)imageNamed {
    
//    ZoomViewController *myZoomController = [[ZoomViewController alloc] initWithImageNamed:imageNamed];
    ZoomViewController *myZoomController = [self.storyboard instantiateViewControllerWithIdentifier:@"ZoomViewController"];
    myZoomController.imageName = imageNamed;
    [self.navigationController pushViewController:myZoomController animated:YES];
}
-(void)tapToZoom: (UITapGestureRecognizer*) doubleTap{
    
    
    
    CGPoint triggerPoint = [doubleTap locationInView:self.ImageScrollView];
    NSString *myImageName;
    
    if (triggerPoint.x <= self.imageView1.frame.size.width)
        myImageName = @"Lighthouse-in-Field";
    
    else if (triggerPoint.x <= self.imageView1.frame.size.width + self.imageView2.frame.size.width)
        myImageName = @"Lighthouse-night";
    
    else if (triggerPoint.x <= self.imageView1.frame.size.width + self.imageView2.frame.size.width + self.imageView3.frame.size.width)
        myImageName = @"Lighthouse-zoomed";

    [self imageZoom:myImageName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

//
//  ZoomViewController.h
//  ScrollViewImageGalleries
//
//  Created by Kit Clark-O'Neil on 2018-08-13.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "ViewController.h"

@interface ZoomViewController : UIViewController

@property (nonatomic) IBOutlet UIScrollView *zoomScrollView;
@property UIImageView *myImageView;
@property NSString *imageName;
- (instancetype)initWithImageNamed:(NSString*) imageName;


@end

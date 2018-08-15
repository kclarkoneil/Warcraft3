//
//  ViewController.h
//  ScrollViewImageGalleries
//
//  Created by Kit Clark-O'Neil on 2018-08-13.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZoomViewController.h"
@interface ViewController : UIViewController
@property UIImageView *imageView1;
@property UIImageView *imageView2;
@property UIImageView *imageView3;

-(void)imageZoom: (NSString*) imageNamed;
@end


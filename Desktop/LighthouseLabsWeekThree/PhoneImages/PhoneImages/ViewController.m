//
//  ViewController.m
//  PhoneImages
//
//  Created by Kit Clark-O'Neil on 2018-08-16.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iPhoneImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *iphoneURL = [NSURL URLWithString:@"http://imgur.com/zdwdenZ.png"];
    
    NSURLSessionConfiguration *iphoneConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *iphoneSession = [NSURLSession sessionWithConfiguration:iphoneConfiguration];
    
    
    NSURLSessionDownloadTask *downloadIphoneTask = [iphoneSession downloadTaskWithURL:iphoneURL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error){
        if (error) {//1
            //handle the error
            NSLog(@"error:%@", error.localizedDescription);
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL: location];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // This will run on the main queue
            
            self.iPhoneImageView.image = image;
        }];
        
    }];
    [downloadIphoneTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

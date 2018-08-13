//
//  ViewController.m
//  MyScrollView
//
//  Created by Kit Clark-O'Neil on 2018-08-13.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.mySubView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    MyScrollView *myScrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(self.mySubView.frame.origin.x, self.mySubView.frame.origin.y, self.mySubView.frame.size.width, self.mySubView.frame.size.height) andContentSize:CGSizeMake(self.view.frame.size.width, 750)];
    self.myScrollView = myScrollView;
    [self.view addSubview:self.mySubView];
    [self.view addSubview:self.myScrollView];
    
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.myScrollView addSubview:redView];
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150, 200)];
    greenView.backgroundColor = [UIColor greenColor];
    [self.myScrollView addSubview:greenView];
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.myScrollView addSubview:blueView];
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.myScrollView addSubview:yellowView];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //self.mySubView.bounds = CGRectMake(self.mySubView.bounds.origin.x, self.mySubView.bounds.origin.y + 100, self.view.frame.size.width, self.view.frame.size.height);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

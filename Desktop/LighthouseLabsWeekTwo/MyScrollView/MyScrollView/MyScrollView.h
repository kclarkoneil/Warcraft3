//
//  MyScrollView.h
//  MyScrollView
//
//  Created by Kit Clark-O'Neil on 2018-08-13.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyScrollView : UIView

@property (nonatomic, assign) CGSize contentSize;
@property UIPanGestureRecognizer *myPan;
-(void) myScrollViewPanner: (UIPanGestureRecognizer*) myPan;
- (instancetype)initWithFrame:(CGRect)frame andContentSize:(CGSize)size;

@end

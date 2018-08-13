//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Kit Clark-O'Neil on 2018-08-13.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

- (instancetype)initWithFrame:(CGRect)frame andContentSize:(CGSize)size
{
    self = [super initWithFrame:frame];
    if (self) {
        _myPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector (myScrollViewPanner:)];
        [self addGestureRecognizer:self.myPan];
      
        self.userInteractionEnabled = YES;
       _contentSize = size;
        
    }
    return self;
}

-(void) myScrollViewPanner: (UIPanGestureRecognizer*) myPan {
    
  

        CGPoint translation = [myPan translationInView:self];
        CGFloat newX = self.bounds.origin.x + (translation.x);
        CGFloat newY = self.bounds.origin.y + (translation.y);

    if (newX < 0)
        newX = 0;
    else if (newX + self.superview.frame.size.width > self.contentSize.width)
        newX = self.contentSize.width - self.superview.frame.size.width;

    if (newY < 0)
        newY = 0;
    else if (newY + self.superview.frame.size.height > self.contentSize.height)
        newY = self.contentSize.height - self.superview.frame.size.height;

   [self setBounds:CGRectMake(newX, newY, self.bounds.size.width, self.bounds.size.height)];
    
//    CGFloat minimumXPosition = MIN(newX, 0);
//    CGFloat maximumXPosition = MAX(newX, self.contentSize.width);
//    CGFloat minimumYPosition = MIN(newY, 0);
//    CGFloat maximumYPosition = MAX(newY, self.contentSize.height);
//
//
//    if (newX <= 0) {
//        newX = minimumXPosition;
//    }
//    else {
//            newX = maximumXPosition;
//    }
//
//    if (newY <=0) {
//        newY = minimumYPosition;
//    }
//    else {
//        newY = maximumYPosition;
//    }
//
//        self.center = CGPointMake(newX, newY);
    
    
        [myPan setTranslation:CGPointZero inView:self];
    
}

@end

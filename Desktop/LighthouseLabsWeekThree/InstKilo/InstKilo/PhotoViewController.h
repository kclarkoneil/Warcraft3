//
//  PhotoViewController.h
//  InstKilo
//
//  Created by Kit Clark-O'Neil on 2018-08-15.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController


-(void)sortPhotosByLocation:(NSString*)AttributeA and: (NSString*) AttributeB;
-(void)sortPhotosBySubject:(NSString*)AttributeA and: (NSString*) AttributeB;
@end

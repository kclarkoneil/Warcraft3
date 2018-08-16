//
//  Photo.h
//  InstKilo
//
//  Created by Kit Clark-O'Neil on 2018-08-15.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@interface Photo : NSObject

@property NSString *imageName;
@property UIImage *image;
@property NSString *location;
@property NSString *subject;

-(instancetype) initWith: (NSString*) imageName Location: (NSString*) location andSubject: (NSString*) subject;
@end

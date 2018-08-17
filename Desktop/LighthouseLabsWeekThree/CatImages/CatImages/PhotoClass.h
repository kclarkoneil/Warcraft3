//
//  PhotoClass.h
//  CatImages
//
//  Created by Kit Clark-O'Neil on 2018-08-16.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@interface PhotoClass : NSObject

@property NSString *title;
@property NSString *flickrURL;
@property UIImage *catImage;

-(void)createUrlWithFarmID:(NSString*) farmID serverID: (NSString*) serverid withID: (NSString*) withID andsecretID: (NSString*) secretid;



@end

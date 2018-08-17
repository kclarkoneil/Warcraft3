//
//  PhotoClass.m
//  CatImages
//
//  Created by Kit Clark-O'Neil on 2018-08-16.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "PhotoClass.h"

@implementation PhotoClass


-(void)createUrlWithFarmID:(NSString*) farmID serverID: (NSString*) serverid withID: (NSString*) withID andsecretID: (NSString*) secretid{
    NSString *myURL = [NSString stringWithFormat:@"http://farm%@.staticflickr.com/%@/%@_%@.jpg", farmID, serverid, withID, secretid];
    NSLog(@"%@", myURL);
    self.flickrURL = myURL;
    
    
}

@end

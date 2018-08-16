//
//  Photo.m
//  InstKilo
//
//  Created by Kit Clark-O'Neil on 2018-08-15.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "Photo.h"

@implementation Photo


-(instancetype) initWith: (NSString*) imageName Location: (NSString*) location andSubject: (NSString*) subject;

{
    self = [super init];
    if (self) {
        _imageName = imageName;
        _image = [UIImage imageNamed:imageName];
        _location = location;
        _subject = subject;
    }
    return self;
}
@end

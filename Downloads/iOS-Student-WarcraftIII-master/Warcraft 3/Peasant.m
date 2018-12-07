//
//  Peasant.m
//  Warcraft 3
//
//  Created by Kit Clark-O'Neil on 2018-08-01.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Peasant.h"

@implementation Peasant

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.healthpoints = 35;
        self.attackPower = 0;
    }
    return self;
}
@end

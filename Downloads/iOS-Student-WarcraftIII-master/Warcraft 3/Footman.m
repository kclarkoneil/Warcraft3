//
//  Footman.m
//  Warcraft 3
//
//  Created by Kit Clark-O'Neil on 2018-08-01.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Footman.h"

@implementation Footman

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.healthpoints = 60;
        self.attackPower = 10;
    }
    return self;
}
- (void)damage:(int)hp {
    self.healthpoints -= hp;
}
-(void)attack:(Unit*)unit withDamage:(int) damage {
    unit.healthpoints -= damage;
}
@end

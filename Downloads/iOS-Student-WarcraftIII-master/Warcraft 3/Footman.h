//
//  Footman.h
//  Warcraft 3
//
//  Created by Kit Clark-O'Neil on 2018-08-01.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Unit.h"

@interface Footman : Unit

-(void)damage:(int)hp;
-(void)attack:(Unit*)unit withDamage:(int) damage;
@end

//
//  Unit.h
//  WarCarftIII
//
//  Created by Aaron Dufall on 5/05/2014.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Unit : NSObject

@property (assign, nonatomic) int healthpoints;
@property (assign) int attackPower;

-(void)setHealthPoints:(int)healthpoints;
@end

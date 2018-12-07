//
//  Barracks.m
//  
//
//  Created by Daniel Mathews on 2015-07-31.
//
//

#import "Barracks.h"
#import "Footman.h"
#import "Peasant.h"
@implementation Barracks

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self canTrainFootman];
        self.gold = 1000;
        self.food = 80;
        
    }
    return self;
}
-(Footman*)trainFootman {
    if ([self canTrainFootman] == YES) {
        self.gold -= 135;
        self.food -= 2;
    Footman *footsoldier= [[Footman alloc] init];
        return footsoldier;
    }
    else {
        return nil;
        }
    }
-(Peasant*)trainPeasant {
    if ([self canTrainPeasant] == YES) {
        self.gold -= 90;
        self.food -= 5;
        Peasant *peasant = [[Peasant alloc] init];
        return peasant;
    }
    else {
        return nil;
    }
}
-(BOOL) canTrainFootman {
    if (self.gold >= 135 && self.food >= 2) {
        return YES;
    }
    else return NO;
}
-(BOOL) canTrainPeasant {
    if (self.gold >= 90 && self.food >= 5) {
        return YES;
    }
    else return NO;
}
@end

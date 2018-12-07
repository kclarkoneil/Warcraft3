//
//  Barracks.h
//  
//
//  Created by Daniel Mathews on 2015-07-31.
//
//

#import <Foundation/Foundation.h>

@interface Barracks : NSObject

@property (assign) int gold;
@property (assign) int food;

-(BOOL)canTrainFootman;
-(BOOL)canTrainPeasant;

@end

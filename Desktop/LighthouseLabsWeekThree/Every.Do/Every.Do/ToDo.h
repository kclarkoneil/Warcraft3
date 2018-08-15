//
//  ToDo.h
//  Every.Do
//
//  Created by Kit Clark-O'Neil on 2018-08-14.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property NSString *name;
@property NSString *details;
@property int priority;
@property BOOL isCompleted;

- (instancetype)initWithName: (NSString*)nameInput details:(NSString*) detailsInput priority:(int)priorityInput andCompletionStatus: (BOOL) isComplete;



@end

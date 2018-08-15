//
//  ToDo.m
//  Every.Do
//
//  Created by Kit Clark-O'Neil on 2018-08-14.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithName: (NSString*)nameInput details:(NSString*) detailsInput priority:(int)priorityInput andCompletionStatus: (BOOL) isComplete
{
    self = [super init];
    if (self) {
        _name = nameInput;
        _details = detailsInput;
        _priority = priorityInput;
        _isCompleted = isComplete;
    }
    return self;
}
@end

//
//  addTaskViewController.h
//  Every.Do
//
//  Created by Kit Clark-O'Neil on 2018-08-14.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"
@class addTaskViewController;
@protocol AddTaskProtocol

-(void)addToDoToList:(ToDo*) addedItem;



@end

@interface addTaskViewController : UIViewController
@property (nonatomic) id <AddTaskProtocol> delegate;
@property (weak, nonatomic) IBOutlet UITextField *TaskNameInputField;
@property (weak, nonatomic) IBOutlet UITextField *taskPriorityInputField;
@property (weak, nonatomic) IBOutlet UITextField *taskDescriptionInputField;
@property (weak, nonatomic) IBOutlet UIButton *AddButton;
@property ToDo *myTask;

-(ToDo*)createNewTask;

@end

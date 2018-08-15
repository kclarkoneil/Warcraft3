//
//  ViewController.h
//  Every.Do
//
//  Created by Kit Clark-O'Neil on 2018-08-14.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"
#import "myDetailViewController.h"
#import "myTableViewCell.h"
#import "addTaskViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *toDoTable;

@property NSMutableArray *toDoArray;


@end


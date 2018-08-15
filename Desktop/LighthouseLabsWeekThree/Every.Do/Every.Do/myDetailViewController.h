//
//  myDetailViewController.h
//  Every.Do
//
//  Created by Kit Clark-O'Neil on 2018-08-14.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"
@interface myDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *completionLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property ToDo *detailToDo;



@end

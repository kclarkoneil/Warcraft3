//
//  myDetailViewController.m
//  Every.Do
//
//  Created by Kit Clark-O'Neil on 2018-08-14.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "myDetailViewController.h"

@interface myDetailViewController ()

@end

@implementation myDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.priorityLabel.text = [NSString stringWithFormat:@"Priority: %i", self.detailToDo.priority];
        self.nameLabel.text = self.detailToDo.name;
        self.descriptionLabel.text = self.detailToDo.details;
        
        if (self.detailToDo.isCompleted == YES){
            self.completionLabel.text = @"Done";
        }
        else {
            self.completionLabel.text = @"To Do";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

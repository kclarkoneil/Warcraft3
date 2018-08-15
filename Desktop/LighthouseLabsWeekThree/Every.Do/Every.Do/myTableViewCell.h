//
//  myTableViewCell.h
//  Every.Do
//
//  Created by Kit Clark-O'Neil on 2018-08-14.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *completionLabel;

@end

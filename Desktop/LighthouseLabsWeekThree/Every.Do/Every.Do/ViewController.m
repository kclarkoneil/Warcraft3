//
//  ViewController.m
//  Every.Do
//
//  Created by Kit Clark-O'Neil on 2018-08-14.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, AddTaskProtocol, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoTable.delegate = self;
    self.toDoTable.dataSource = self;
    
    self.toDoArray = [[NSMutableArray alloc] init];
    
    ToDo *dishes = [[ToDo alloc] initWithName:@"Dishes" details:@"Clean thedishes from the party" priority:3 andCompletionStatus:NO];
    [self.toDoArray addObject:dishes];
    
    ToDo *laundry = [[ToDo alloc] initWithName:@"Laundry" details:@"Wash dirty jeans" priority:2 andCompletionStatus:NO];
     [self.toDoArray addObject:laundry];
    
    ToDo *findTheCure = [[ToDo alloc] initWithName:@"FindTheCure" details:@"Millions die every year from this mysterious ailment" priority:5 andCompletionStatus:NO];
    [self.toDoArray addObject:findTheCure];
    
    ToDo *taxes = [[ToDo alloc] initWithName:@"Taxes" details:@"Complete 2013 return" priority:4 andCompletionStatus:NO];
     [self.toDoArray addObject:taxes];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)addToDoToList:(ToDo *)addedItem {
    [self.toDoArray addObject:addedItem];
    [self.toDoTable reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (IBAction)taskCompleteSwipe:(UISwipeGestureRecognizer*)sender {
    NSIndexPath *swipePoint = [self.toDoTable indexPathForRowAtPoint:[sender locationInView: self.toDoTable]];
    ToDo *myToDo = [self.toDoArray objectAtIndex:swipePoint.row];
    myToDo.isCompleted = !myToDo.isCompleted;
    [self.toDoArray sortUsingComparator:^NSComparisonResult(ToDo* _Nonnull obj1, ToDo*  _Nonnull obj2) {
        return obj1.isCompleted && !obj2.isCompleted;
    }];
    [self.toDoTable reloadData];
    

}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
   myTableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"toDoItemCell" forIndexPath:indexPath];
    ToDo *newItem = [self.toDoArray objectAtIndex:indexPath.row];
    newCell.nameLabel.text = newItem.name;
    newCell.detailsLabel.text = newItem.details;
    newCell.priorityLabel.text = [NSString stringWithFormat:@"Priority: %i", newItem.priority];
    if (newItem.isCompleted == YES) {
        newCell.completionLabel.text = @"Done";
    }
    else {
        newCell.completionLabel.text = @"To Do";
        }
    return newCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"User tapped on cell %@", indexPath);
    
    
    
//    [self performSegueWithIdentifier:@"de" sender:self];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDoArray.count;
}
- (IBAction)addTaskButton:(id)sender {
    
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"detailSegue"] == YES)
    {
        
        NSIndexPath *indexPath = [self.toDoTable indexPathForSelectedRow];
        ToDo *myItem = [self.toDoArray objectAtIndex:indexPath.row];
        myDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.detailToDo = myItem;
    
     
    }
    else if ([segue.identifier isEqualToString:@"addTaskSegue"] == YES) {
        addTaskViewController *myTaskAdd = segue.destinationViewController;
        myTaskAdd.delegate = self;
    }
}

@end

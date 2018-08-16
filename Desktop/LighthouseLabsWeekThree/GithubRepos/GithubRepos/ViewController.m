//
//  ViewController.m
//  GithubRepos
//
//  Created by Kit Clark-O'Neil on 2018-08-16.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "ViewController.h"
#import "Repo.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *RepoTableView;
//@property (weak, nonatomic) IBOutlet UITableViewCell *ProtoTypeCell;
@property NSMutableArray *repoNames;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        // Do any additional setup after loading the view, typically from a nib.
    
    self.repoNames = [[NSMutableArray alloc] init];
    
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/kclarkoneil/repos"]; //1
   
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];//2
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];// 3
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration]; // 4
        
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if (error) { // 1
                // Handle the error
                NSLog(@"error: %@", error.localizedDescription);
                return;
            }
            
            NSError *jsonError = nil;
            NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError]; // 2
            
            if (jsonError) { // 3
                // Handle the error
                NSLog(@"jsonError: %@", jsonError.localizedDescription);
                return;
            }
            
            // If we reach this point, we have successfully retrieved the JSON from the API
            for (NSDictionary *repo in repos) { // 4
                
                NSString *repoName = repo[@"name"];
                NSLog(@"repo: %@", repoName);
                Repo *myRepo = [[Repo alloc] init];
                myRepo.name = repoName;
                [self.repoNames addObject:myRepo];
                
            }
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self.RepoTableView reloadData];
             });
            
        }]; // 5
                        
        [dataTask resume]; // 6
    
    }
    // Do any additional setup after loading the view, typically from a nib.



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell* myCell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell" forIndexPath:indexPath];
   Repo *myRepoName = [self.repoNames objectAtIndex:indexPath.item];
    myCell.textLabel.text = myRepoName.name;
    return myCell;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repoNames.count;
}

@end

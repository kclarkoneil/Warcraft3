//
//  ViewController.m
//  CatImages
//
//  Created by Kit Clark-O'Neil on 2018-08-16.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *CatCollectionView;
@property NSMutableArray *catPics;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.catPics = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
    [self catFind];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fetchImageForImageView:(UIImageView*) cellImage forCat: (PhotoClass*) catPic {

    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", catPic.flickrURL]];

// setting the URL request using the url and the http method
NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
urlRequest.HTTPMethod = @"GET"; // this is the default one any way
// CRUD -> GET, POST, PUT, DELETE

// A url session so we can make a request
NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:configuration];


// Data task, and the download task
NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:urlRequest
                                               completionHandler:^(NSData * _Nullable data,
                                                                   NSURLResponse * _Nullable response,
                                                                   NSError * _Nullable error)
                                  
                                         {
                                                 
                                                 if (error) { // 1
                                                     // Handle the error
                                                     NSLog(@"error: %@", error.localizedDescription);
                                                     return;
                                                 }
                                                 
                                                 NSError *jsonError = nil;
                                                 // 2
                                                 
                                                 if (jsonError) { // 3
                                                     // Handle the error
                                                     NSLog(@"jsonError: %@", jsonError.localizedDescription);
                                                     return;
                                                 }
                                                 else  {
                                                     dispatch_async(dispatch_get_main_queue(), ^{
                                                         UIImage *readStuffDict = [UIImage imageWithData: data];
                                                         cellImage.image = readStuffDict;
                                                         catPic.catImage = readStuffDict;
                                                        
                                                     });
                                                     
                                                 }
                                         }
                                                 
                                  ];
    [dataTask resume];
    
                                  }
-(void)catFind
{
    // Setting up the url
    NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=9be448415e83472a6255307a9f32aa8d&tags=cat"];
    
    // setting the URL request using the url and the http method
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    urlRequest.HTTPMethod = @"GET"; // this is the default one any way
    // CRUD -> GET, POST, PUT, DELETE
    
    // A url session so we can make a request
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:configuration];
    
    
    // Data task, and the download task
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:urlRequest
                                                   completionHandler:^(NSData * _Nullable data,
                                                                       NSURLResponse * _Nullable response,
                                                                       NSError * _Nullable error)
                                      {
                                          // Here we access HTTP data , Status codes, and JSON
                                          // If we don't get a 200 status code, error will not be nil
                                          if (error)
                                          {
                                              NSLog(@"Error getting data");
                                          }
                                          else
                                          {
                                              NSError *jsonError = nil;
                                              NSDictionary *readStuffDict = [NSJSONSerialization JSONObjectWithData:data
                                                                                                            options:0
                                                                                                              error:&jsonError];
                                              
                                              NSLog(@"data that is converted into Dict is: %@", readStuffDict);
                                              
                                              if (jsonError)
                                              {
                                                  
                                                  NSLog(@"jsonError: %@", jsonError.localizedDescription);
                                              }
                                              else
                                              {
                                                  NSLog(@"They are: %lu items in this database", (unsigned long)readStuffDict.count);
                                                  
                                                  // let's fetch the games Array
                                                  NSDictionary* photoDictionary = readStuffDict[@"photos"];
                                                  NSArray *photoArray = photoDictionary[@"photo"];
                                                  // We now have our data as Objective-C data
                                                  for (NSDictionary *photo in photoArray)
                                                  {
                                                      PhotoClass *catPhoto =[[PhotoClass alloc] init];
                                                      catPhoto.title = [photo valueForKey:@"title"];
                                                      NSString *FarmID = [photo valueForKey:@"farm"];
                                                      NSString *serverID = [photo valueForKey:@"server"];
                                                      NSString *ID = [photo valueForKey:@"id"];
                                                      NSString *secretID = [photo valueForKey:@"secret"];
                                                      
                                                    
                                                      [catPhoto createUrlWithFarmID:FarmID serverID: serverID withID:ID andsecretID: secretID];
                                                      NSLog(@"%@", catPhoto.flickrURL);
                                                      
                                                      [self.catPics addObject:catPhoto];
                                                  }
                                                  
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      [self.CatCollectionView reloadData];
                                                  });
                                                  
                                                  // update somethign in the interface based on the data
                                                  // you will CRASH
                                                  
                                                  
                                                  // dont update the cat picture here
                                                  
                                                  // Tell the main queue, to do somthing with the data// updates the interfac
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      
                                                     
                                                      
                                                      
                                                      
                                                  });
                                              }
                                          }
                                      }];
    
    [dataTask resume]; // Start my request
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    myPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"standardImageCell" forIndexPath:indexPath];
   PhotoClass *cat = self.catPics[indexPath.row];
    if (!cat.catImage) {
        
        [self fetchImageForImageView:cell.cellImageView forCat:cat];
        cell.cellLabel.text = cat.title;
        return cell;
    }
    else {
        cell.cellImageView.image = cat.catImage;
         cell.cellLabel.text = cat.title;
        return cell;
            }
    
    }

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return (self.catPics.count);
    
}

@end

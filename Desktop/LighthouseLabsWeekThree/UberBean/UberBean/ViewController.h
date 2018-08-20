//
//  ViewController.h
//  UberBean
//
//  Created by Kit Clark-O'Neil on 2018-08-17.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *uberBeanMapView;

@property CLLocationManager *locationManager;
@end


//
//  MapVC.m
//  bikebike
//
//  Created by 千chin on 2016/10/15.
//  Copyright © 2016年 michin. All rights reserved.
//

#import "MapVC.h"
#import "McXMLParser.h"
#import "McParameters.h"
#import "CityBikeStation.h"
#import "McAnnotation.h"

@interface MapVC ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocationManager *locationManager;
@end

@implementation MapVC
{
    BOOL firstLaunch;
    MKCoordinateRegion currentRegion;
    McParameters * mcParameters;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //init
    _locationManager = [[CLLocationManager alloc] init];
    McXMLParser * mcParser = [[McXMLParser alloc] init];
    mcParameters = [McParameters shareInstance];
    
    //default
    _mapView.delegate = self;
    _locationManager.delegate = self;
    
    [_locationManager requestWhenInUseAuthorization];
    
    firstLaunch = YES;
    
    [mcParser startParsing];
    
    
    //annotation
    
    for (CityBikeStation * aStation in mcParameters.allStations) {

        CLLocationCoordinate2D stationPosition;
        stationPosition.latitude = aStation.stationLat;
        stationPosition.longitude = aStation.stationLon;

        McAnnotation * mcAnnotation = [[McAnnotation alloc] initWithCoordinate:stationPosition];
        mcAnnotation.title = aStation.stationName;
        mcAnnotation.subtitle = [NSString stringWithFormat:@"%i",aStation.stationID];
        
        [_mapView addAnnotation:mcAnnotation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MKMapViewDelegate
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    currentRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    
    if(firstLaunch){
        [self.mapView setRegion:[self.mapView regionThatFits:currentRegion] animated:YES];
        firstLaunch = NO;
    }
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    NSLog(@"點到你了：%@",view);
    

} 
/*
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    NSArray * allStations = [NSArray arrayWithArray:mcParameters.allStations];
    MKAnnotationView * mapPin;
    
    for (CityBikeStation * aStation in allStations) {
        
        CLLocationCoordinate2D stationPosition;
        stationPosition.latitude = aStation.stationLat;
        stationPosition.longitude = aStation.stationLon;
        
        [annotation setCoordinate:stationPosition];
        
        mapPin = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@""];
        
    }
    
    return mapPin;
    
}
 */

#pragma mark - MKAnnotation


#pragma mark - Button Actions
- (IBAction)positionBtnPressed:(id)sender {
    [self.mapView setRegion:[self.mapView regionThatFits:currentRegion] animated:YES];
}


@end

//
//  McAnnotation.h
//  bikebike
//
//  Created by 千chin on 2016/10/16.
//  Copyright © 2016年 michin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface McAnnotation : NSObject <MKAnnotation>
@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)theCoordinate;

@end

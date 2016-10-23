//
//  CityBike.h
//  bikebike
//
//  Created by 千chin on 2016/10/15.
//  Copyright © 2016年 michin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityBikeStation : NSObject
@property (nonatomic,strong) NSString * stationName;
@property (nonatomic) int stationID;
@property (nonatomic) int remainBike;
@property (nonatomic) int remainSpace;
@property (nonatomic) int totalSpace;
@property (nonatomic) float stationLat;
@property (nonatomic) float stationLon;
@end

//
//  McXMLParser.h
//  bikebike
//
//  Created by 千chin on 2016/10/15.
//  Copyright © 2016年 michin. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CITY_BIKE_URL @"http://www.c-bike.com.tw/xml/stationlistopendata.aspx"
@interface McXMLParser : NSObject <NSXMLParserDelegate>
typedef enum {
    StationID = 0,
    StationName = 1,
    StationLat = 2,
    StationLon = 3,
    StationRemainBike = 4, //StationNums1
    StationRemainSpace = 5  //StationNums2
} Station;

-(void)startParsing;
-(void)stopParsing;
@end

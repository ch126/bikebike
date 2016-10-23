//
//  McXMLParser.m
//  bikebike
//
//  Created by 千chin on 2016/10/15.
//  Copyright © 2016年 michin. All rights reserved.
//

#import "McXMLParser.h"
#import "McParameters.h"
#import "CityBikeStation.h"

@implementation McXMLParser
{
    NSXMLParser * mcXmlParser;
    BOOL isUseful;
    McParameters * mcParameters;
    NSArray * usefulElementNames;
    NSMutableString * currentElementValue;
    CityBikeStation * aBikeStation;
}

-(instancetype)init{

    
    //
    mcParameters = [McParameters shareInstance];
    
    //須確認和enum type 的順序是否相同
    usefulElementNames = @[@"StationID",
                           @"StationName",
                           @"StationLat",
                           @"StationLon",
                           @"StationNums1",
                           @"StationNums2"];
    
    //set parser
    NSURL* cityBikeUrl = [NSURL URLWithString:CITY_BIKE_URL];
    mcXmlParser = [[NSXMLParser alloc] initWithContentsOfURL:cityBikeUrl];
    mcXmlParser.delegate = self;
    
    return self;
}

-(void)startParsing{
    if([mcXmlParser parse]){
        NSLog(@"parse seccess");
    }else{
        NSLog(@"parse fail");
    }
}

-(void)stopParsing{
    [mcXmlParser abortParsing];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    
    isUseful = [usefulElementNames containsObject:elementName];
    
    if([elementName isEqualToString:@"Station"]){
        aBikeStation = [[CityBikeStation alloc] init];
    }
   // NSLog(@"\n---Start---\nelementName:%@\nnamespaceURI:%@\nqName:%@\nattributeDict:%@",elementName,namespaceURI,qName,attributeDict);

}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if(isUseful){
        if(!currentElementValue){
            currentElementValue = [[NSMutableString alloc] initWithString:string];
        }else{
            [currentElementValue appendString:string];
        }
    }
    //NSLog(@"\n---foundCharacters---\nstring:%@",string);
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if(isUseful){
        
        int index = (int)[usefulElementNames indexOfObject:elementName];
        
        NSString * elementValueStr = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [currentElementValue setString:@""];
        
        switch (index) {
            case StationID:
                aBikeStation.stationID = [elementValueStr intValue];
                break;
            case StationName:
                aBikeStation.stationName = elementValueStr;
                break;
            case StationLat:
                aBikeStation.stationLat = [elementValueStr floatValue];
                break;
            case StationLon:
                aBikeStation.stationLon = [elementValueStr floatValue];
                break;
            case StationRemainBike:
                aBikeStation.remainBike = [elementValueStr intValue];
                break;
            case StationRemainSpace:
                aBikeStation.remainSpace = [elementValueStr intValue];
                break;
            default:
                break;
        }
    }
    if([elementName isEqualToString:@"Station"]){
        aBikeStation.totalSpace = aBikeStation.remainBike + aBikeStation.remainSpace;
        [mcParameters.allStations addObject:aBikeStation];
    }
    //NSLog(@"\n---End---\nelementName:%@\nnamespaceURI:%@\nqName:%@",elementName,namespaceURI,qName);

}




@end

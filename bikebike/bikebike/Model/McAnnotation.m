//
//  McAnnotation.m
//  bikebike
//
//  Created by 千chin on 2016/10/16.
//  Copyright © 2016年 michin. All rights reserved.
//

#import "McAnnotation.h"

@implementation McAnnotation 

-(id)initWithCoordinate:(CLLocationCoordinate2D)theCoordinate{
    if([super init]){
        _coordinate = theCoordinate;
    }
    
    return self;
}
@end

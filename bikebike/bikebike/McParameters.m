//
//  McParameters.m
//  bikebike
//
//  Created by 千chin on 2016/10/15.
//  Copyright © 2016年 michin. All rights reserved.
//

#import "McParameters.h"

@implementation McParameters


+(instancetype)shareInstance
{
    static McParameters * McPara = nil;
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        McPara = [[self alloc] init];
    });
    return McPara;
}

-(instancetype)init{

    _allStations = [[NSMutableArray alloc] init];

    return self;
}
@end

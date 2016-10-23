//
//  McParameters.h
//  bikebike
//
//  Created by 千chin on 2016/10/15.
//  Copyright © 2016年 michin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface McParameters : NSObject
+(instancetype)shareInstance;

@property (nonatomic,strong) NSMutableArray * allStations;
@end

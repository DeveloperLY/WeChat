//
//  LYFoundation+Log.m
//  Gank.io
//
//  Created by LiuY on 2017/3/23.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation NSDictionary (Log)
    
- (NSString *)descriptionWithLocale:(id)locale {
    // 控制字典的输出内容
    
    NSMutableString *string = [NSMutableString string];
    
    [string appendString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [string appendFormat:@"\t%@:", key];
        [string appendFormat:@"%@, \n", obj];
    }];
    [string appendString:@"}"];
    
    NSRange range = [string rangeOfString:@", " options:NSBackwardsSearch];
    if (range.location !=NSNotFound) {
        [string deleteCharactersInRange:range];
    }
    return string;
}
    @end


@implementation NSArray (Log)
    
- (NSString *)descriptionWithLocale:(id)locale {
    // 控制字典的输出内容
    NSMutableString *string = [NSMutableString string];
    
    [string appendString:@"["];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [string appendFormat:@"%@, ", obj];
    }];
    [string appendString:@"]\n"];
    
    
    NSRange range = [string rangeOfString:@", " options:NSBackwardsSearch];
    if (range.location !=NSNotFound) {
        [string deleteCharactersInRange:range];
    }
    
    return string;
}
    
    //    [LYDataEngine getRandomDataWithType:@"拓展资源" number:5 success:^(NSArray *dataArray) {
    //
    //    } failure:^(NSString *msg) {
    //
    //    }];
    
    //    [LYDataEngine getEverydayDataWithDate:@"2017/03/22" success:^(NSDictionary *dataDict, NSMutableArray *categoryArray) {
    //        NSLog(@"%@ --- %@", dataDict, categoryArray);
    //    } failure:^(NSString *msg) {
    //
    //    }];
    
    //    [LYDataEngine getCategoryDataWithType:@"iOS" number:3 page:1 success:^(NSMutableArray<LYGank *> *dataArray) {
    //        NSLog(@"%@", dataArray);
    //    } failure:^(NSString *msg) {
    //
    //    }];
    
    //    [LYDataEngine add2gankWithGankObject:nil success:^(NSString *successMsg) {
    //
    //    } failure:^(NSString *failureMsg) {
    //
    //    }];
    
    //    [LYDataEngine getHistoryDateSuccess:^(NSMutableArray *dateArray) {
    //        NSLog(@"%@", dateArray);
    //    } failure:^(NSString *failureMsg) {
    //        
    //    }];
    
@end

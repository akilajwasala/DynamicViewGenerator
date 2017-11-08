//
//  BaseUtil.m
//  DynamicViewGenerator
//
//  Created by Akila J Wasala on 11/1/17.
//  Copyright © 2017 SALPO. All rights reserved.
//

#import "BaseUtil.h"

@implementation BaseUtil

+ (NSDictionary *)JSONFromFile:(NSString *)fileName {
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end

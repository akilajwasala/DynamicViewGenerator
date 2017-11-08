//
//  NSString+Category.m
//  DynamicViewGenerator
//
//  Created by Akila J Wasala on 11/1/17.
//  Copyright © 2017 SALPO. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

- (BOOL)isEmpty {
    if (self.length > 0) {
        return NO;
    } else {
        return YES;
    }
}

@end

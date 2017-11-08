//
//  MenuItem.m
//  DynamicViewGenerator
//
//  Created by Akila J Wasala on 11/8/17.
//  Copyright © 2017 SALPO. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

- (id)initWithName:(NSString *)name image:(UIImage *)img {
    self = [super init];
    if (self != nil) {
        self.title = name;
        self.image = img;
    }
    return self;
}

@end

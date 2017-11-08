//
//  MenuItem.h
//  DynamicViewGenerator
//
//  Created by Akila J Wasala on 11/8/17.
//  Copyright © 2017 SALPO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MenuItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;

- (id)initWithName:(NSString *)name image:(UIImage *)img;

@end

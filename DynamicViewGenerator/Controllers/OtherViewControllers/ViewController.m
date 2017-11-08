//
//  ViewController.m
//  DynamicViewGenerator
//
//  Created by Akila J Wasala on 11/1/17.
//  Copyright © 2017 SALPO. All rights reserved.
//

#import "ViewController.h"
#import "BaseUtil.h"
#import "NSString+Category.h"
#import "MenuItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewFromJson];
}

- (void)setViewFromJson {
    NSDictionary *dict = [BaseUtil JSONFromFile:@"sample1"];
    NSMutableArray *leftMenuArray = [[NSMutableArray alloc] init];
    NSMutableArray *rightMenuArray = [[NSMutableArray alloc] init];

    for (NSString *key in [dict allKeys]) {
        if (![key isEmpty] && (![[dict objectForKey:key] isEqual:[NSNull null]])) {
            if ([key isEqualToString:@"menu"]) {
                for (NSDictionary *menuDict in dict[key]) {
                    if ([menuDict[@"type"] isEqualToString:@"Left"]) {
                        for (NSDictionary *itemDict in menuDict[@"items"]) {
                            MenuItem *menuObject = [[MenuItem alloc] initWithName:itemDict[@"title"] image:nil];
                            [leftMenuArray addObject:menuObject];
                        }
                    } else if ([menuDict[@"type"] isEqualToString:@"Right"]) {
                        for (NSDictionary *itemDict in menuDict[@"items"]) {
                            MenuItem *menuObject = [[MenuItem alloc] initWithName:itemDict[@"title"] image:nil];
                            [rightMenuArray addObject:menuObject];
                        }
                    }
                }
                
                if (leftMenuArray.count > 0) {
                    [self setLeftMenuButtonWithArray:leftMenuArray];
                }
                if (rightMenuArray.count > 0) {
                    [self setRightMenuButtonWithArray:rightMenuArray];
                }
                
            } else if ([key isEqualToString:@"ViewType"]) {
                
            } else if ([key isEqualToString:@"VCTitle"]) {
                [self setNavigationTitle:dict[key]];
                
            } else if ([key isEqualToString:@"Content"]) {
                
            }
        }
    }
}

@end

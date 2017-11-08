//
//  BaseViewController.h
//  DynamicViewGenerator
//
//  Created by Akila J Wasala on 11/8/17.
//  Copyright © 2017 SALPO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftSideMenuViewController.h"
#import "RightSideMenuViewController.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) LeftSideMenuViewController *leftSlideMenu;
@property (nonatomic, strong) RightSideMenuViewController *rightSlideMenu;

- (void)setLeftMenuButtonWithArray:(NSArray *)itemArray;
- (void)setRightMenuButtonWithArray:(NSArray *)itemArray;

- (void)setNavigationTitle:(NSString *)title;

@end

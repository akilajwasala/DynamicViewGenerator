//
//  BaseViewController.m
//  DynamicViewGenerator
//
//  Created by Akila J Wasala on 11/8/17.
//  Copyright © 2017 SALPO. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController () <LeftSlideMenuDelegate, RightSlideMenuDelegate> {
    NSArray *leftMenuItemArray,*rightMenuItemArray;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationBarAppearence];
}

- (void)setNavigationTitle:(NSString *)title {
    self.navigationItem.title = title;
}

- (void)navigationBarAppearence {
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.21 green:0.40 blue:0.37 alpha:1.0];;
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark - Left side menu settings

- (void)setLeftMenuButtonWithArray:(NSArray *)itemArray {
    leftMenuItemArray = [[NSArray alloc] initWithArray:itemArray];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(tapOnLeftButton)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)tapOnLeftButton {
    self.leftSlideMenu = [[LeftSideMenuViewController alloc] initWithNibName:@"LeftSideMenuViewController" bundle:nil];
    self.leftSlideMenu.delegate = self;
    
    [self.navigationController addChildViewController:self.leftSlideMenu];
    [self.navigationController.view addSubview:self.leftSlideMenu.view];
    
    [self.leftSlideMenu openSlideMenuWithItemArray:leftMenuItemArray];
}

#pragma mark - Right side menu settings

- (void)setRightMenuButtonWithArray:(NSArray *)itemArray {
    rightMenuItemArray = [[NSArray alloc] initWithArray:itemArray];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(tapOnRightButton)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)tapOnRightButton {
    self.rightSlideMenu = [[RightSideMenuViewController alloc] initWithNibName:@"RightSideMenuViewController" bundle:nil];
    self.rightSlideMenu.delegate = self;
    
    [self.navigationController addChildViewController:self.rightSlideMenu];
    [self.navigationController.view addSubview:self.rightSlideMenu.view];
    
    [self.rightSlideMenu openSlideMenuWithItemArray:rightMenuItemArray];
}

#pragma mark - Other methods

- (void)setBackButton {
    UIButton *barBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [barBackButton setImage:[UIImage imageNamed:@"menuBackButton.png"] forState:UIControlStateNormal];
    [barBackButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [barBackButton setFrame:CGRectMake(0, 0, 30,30)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barBackButton];
}

- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Delegate methods from side menues

- (void)leftMenuItemSelectedAtIndex:(NSInteger)index {
    NSLog(@"Selected by left : %ld",index);
}

- (void)rightMenuItemSelectedAtIndex:(NSInteger)index {
    NSLog(@"Selected by right : %ld",index);
}

@end

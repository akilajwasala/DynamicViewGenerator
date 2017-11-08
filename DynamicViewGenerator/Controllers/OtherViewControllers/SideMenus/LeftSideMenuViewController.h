//
//  LeftSideMenuViewController.h
//  DynamicViewGenerator
//
//  Created by Akila J Wasala on 11/7/17.
//  Copyright © 2017 SALPO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftSlideMenuDelegate <NSObject>

@required

- (void)leftMenuItemSelectedAtIndex:(NSInteger)index;

@end

@interface LeftSideMenuViewController : UIViewController

@property (nonatomic, assign) id <LeftSlideMenuDelegate> delegate;

- (void)openSlideMenuWithItemArray:(NSArray *)itemArray;

@end

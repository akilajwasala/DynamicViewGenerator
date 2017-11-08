//
//  RightSideMenuViewController.h
//  DynamicViewGenerator
//
//  Created by Akila J Wasala on 11/8/17.
//  Copyright © 2017 SALPO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RightSlideMenuDelegate <NSObject>

@required

- (void)rightMenuItemSelectedAtIndex:(NSInteger)index;

@end

@interface RightSideMenuViewController : UIViewController

@property (nonatomic, assign) id <RightSlideMenuDelegate> delegate;

- (void)openSlideMenuWithItemArray:(NSArray *)itemArray;

@end

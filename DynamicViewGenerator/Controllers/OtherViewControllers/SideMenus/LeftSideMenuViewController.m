//
//  LeftSideMenuViewController.m
//  DynamicViewGenerator
//
//  Created by Akila J Wasala on 11/7/17.
//  Copyright © 2017 SALPO. All rights reserved.
//

#import "LeftSideMenuViewController.h"
#import "MenuTableViewCell.h"
#import "MenuItem.h"

#define SHAWDOW_ALPHA 0.8
#define MENU_DURATION 0.5
#define MENU_TRIGGER_VELOCITY 350

@interface LeftSideMenuViewController () <UITableViewDelegate, UITableViewDataSource> {
    
    IBOutlet UIButton *btnOutside;
    IBOutlet UIButton *btnClose;
    IBOutlet UIView *viewShadow;
    IBOutlet UIView *viewContainer;
    
    IBOutlet UITableView *tblMenuItems;
    CGFloat menuWidth;
    CGRect inFrame, outFrame;
    BOOL isOpen;
    
    NSArray *menuItemArray;
}

@end

@implementation LeftSideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuWidth = viewContainer.frame.size.width;
    inFrame = CGRectMake (0,0,menuWidth,[UIScreen mainScreen].bounds.size.height);
    outFrame = CGRectMake(-menuWidth, 0, menuWidth,[UIScreen mainScreen].bounds.size.height);
    
    viewContainer.transform = CGAffineTransformMakeTranslation(-menuWidth, 0);
    
    [tblMenuItems registerNib:[UINib nibWithNibName:@"MenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

- (IBAction)btnCloseClick:(id)sender {
    [self closeMenu];
}

- (void)openSlideMenuWithItemArray:(NSArray *)itemArray {
    menuItemArray = [[NSArray alloc] initWithArray:itemArray];
    self.view.frame = [UIScreen mainScreen].bounds;
    if (isOpen) {
        [self closeMenu];
    }
    [self openMenu];
}

- (void)openMenu {
    
    float duration = MENU_DURATION/menuWidth *fabs(self.view.center.x)+MENU_DURATION/2;
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         viewShadow.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:SHAWDOW_ALPHA];
                     }
                     completion:nil];
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         viewContainer.transform = CGAffineTransformIdentity;
                     }
                     completion:nil];
    
    isOpen = YES;
}

- (void)closeMenu {
    
    float duration = MENU_DURATION/menuWidth*fabs(self.view.center.x) + MENU_DURATION/2;
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         viewShadow.backgroundColor = [UIColor colorWithRed:0.8356 green:0.0 blue:0.02 alpha:0.0];
                     }
                     completion:^(BOOL finished){}];
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         viewContainer.transform = CGAffineTransformMakeTranslation(-menuWidth, 0);
                     }
                     completion:^(BOOL finished){
                         [self.view removeFromSuperview];
                         [self didMoveToParentViewController:nil];
                         [self removeFromParentViewController];
                     }];
    
    isOpen = NO;
}

#pragma mark - UITableView Delegates and Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return menuItemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = (MenuTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"cell"];
    MenuItem *item = [menuItemArray objectAtIndex:indexPath.row];
    cell.lblMenuTitle.text = item.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self closeMenu];
    if ([_delegate respondsToSelector:@selector(leftMenuItemSelectedAtIndex:)]) {
        [_delegate leftMenuItemSelectedAtIndex:indexPath.row];
    }
}

@end

//
//  SettingsViewController.h
//  searchbar
//
//  Created by osama mourad on 1/30/15.
//  Copyright (c) 2015 osama mourad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AddViewController.h"

@interface SettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AddStockSymbolProtocol> {
    NSMutableArray *stk;
    AppDelegate *appDelegate;
    /*BOOL hasEdited;*/
}

@property (weak, nonatomic) IBOutlet UITableView *table;
//@property (strong, nonatomic) UIPopoverController *popoverAddViewController;

- (IBAction)done:(id)sender;
//- (IBAction)add:(id)sender;

@end

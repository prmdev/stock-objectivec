//
//  ViewController.m
//  searchbar
//
//  Created by osama mourad on 1/30/15.
//  Copyright (c) 2015 osama mourad. All rights reserved.
//

#import "StockViewController.h"

@interface StockViewController ()

@end

@implementation StockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    stk = [appDelegate loadStockList];
}

- (void)viewWillAppear:(BOOL)animated {
    stk = [appDelegate loadStockList];
    [self.table reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return stk.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    UILabel *lblText = (UILabel*)[cell viewWithTag:1];
    lblText.text = [stk objectAtIndex:indexPath.row];
    
    return cell;
}

@end

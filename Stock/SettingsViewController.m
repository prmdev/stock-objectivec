//
//  SettingsViewController.m
//  searchbar
//
//  Created by osama mourad on 1/30/15.
//  Copyright (c) 2015 osama mourad. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.table.editing = YES;
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    stk = [appDelegate loadStockList];
}

- (void)viewWillAppear:(BOOL)animated {
    /*hasEdited = NO;*/
    [self.table reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    /*if (hasEdited)*/
    [appDelegate saveStockList:stk];
    /*[self dismissViewControllerAnimated:YES completion:nil];*/
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"toAddView"]) {
        AddViewController *addView = (AddViewController *)[segue destinationViewController];
        if ([addView respondsToSelector:@selector(setAddDelegate:)])
            [addView setValue:self forKey:@"addDelegate"];
    }
}


#pragma mark - table view

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return stk.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = stk[indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [stk removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
        /*hasEdited = YES;*/
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSString *stockName = stk[sourceIndexPath.row];
    [stk removeObjectAtIndex:sourceIndexPath.row];
    [stk insertObject:stockName atIndex:destinationIndexPath.row];
    /*hasEdited = YES;*/
}

#pragma mark - Add Stock Symbol Method

- (void)addView:(AddViewController *)addView addStockSymbol:(NSString *)symbol {
    [stk insertObject:[symbol copy] atIndex:0];
    NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.table insertRowsAtIndexPaths:[NSArray arrayWithObject:firstIndexPath]
                      withRowAnimation:UITableViewRowAnimationAutomatic];
    [addView.navigationController popToViewController:self animated:YES];
    /*hasEdited = YES;*/
}

@end

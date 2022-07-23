//
//  AddViewController.h
//  Stock
//
//  Created by prmdev on 2/2/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddViewController;

@protocol AddStockSymbolProtocol <NSObject>

- (void)addView:(AddViewController *)addView addStockSymbol:(NSString *)symbol;

@end

@interface AddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *symbolField;
@property (weak, nonatomic) id <AddStockSymbolProtocol> addDelegate;

- (IBAction)add:(id)sender;

@end

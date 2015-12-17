//
//  MainViewController.m
//  XY-iOS-Demo
//
//  Created by hzyuxiaohua on 15/12/17.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self installBasicUIElements];
}

- (void)installBasicUIElements
{
    self.title = @"welcome";
    
    [self constructMainEntryTableView];
}

- (void)constructMainEntryTableView
{
    XLFormDescriptor* form = [XLFormDescriptor formDescriptor];
    XLFormRowDescriptor* row;
    XLFormSectionDescriptor* section;
    
    // section UIKit
    section = [XLFormSectionDescriptor formSection];
    
    // row UITextField
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"UIKit"
                                                rowType:XLFormRowDescriptorTypeButton
                                                  title:@"UIKit"];
    row.action.formSegueIdentifier = @"UIKitIdentifier";
    [section addFormRow:row];
    [form addFormSection:section];
    
    // row XLForm
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"3rdParty"
                                                rowType:XLFormRowDescriptorTypeButton
                                                  title:@"3rdParty"];
    row.action.formSegueIdentifier = @"3rdPartyIdentifier";
    [section addFormRow:row];
    
    [form addFormSection:section];
    
    self.form = form;
}

@end

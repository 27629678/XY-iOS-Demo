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
    section = [XLFormSectionDescriptor formSectionWithTitle:@"UIKit"];
    
    // row UITextField
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"UIKit.TextField"
                                                rowType:XLFormRowDescriptorTypeSelectorPush
                                                  title:@"UITextField"];
    [section addFormRow:row];
    [form addFormSection:section];
    
    // section 3rd Party
    section = [XLFormSectionDescriptor formSectionWithTitle:@"3rd Party"];
    
    // row XLForm
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"3rdParty.XLForm"
                                                rowType:XLFormRowDescriptorTypeSelectorPush
                                                  title:@"XLForm"];
    [section addFormRow:row];
    
    [form addFormSection:section];
    
    self.form = form;
}

@end

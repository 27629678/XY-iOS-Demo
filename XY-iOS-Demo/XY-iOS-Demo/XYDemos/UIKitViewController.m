//
//  UIKitViewController.m
//  XY-iOS-Demo
//
//  Created by hzyuxiaohua on 15/12/17.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "UIKitViewController.h"

@interface UIKitViewController ()

@end

@implementation UIKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self installFormElements];
}

- (void)installFormElements
{
    self.title = @"UIKit";
    
    XLFormRowDescriptor* row;
    XLFormSectionDescriptor* section;
    XLFormDescriptor* form = [XLFormDescriptor formDescriptor];
    
    // null section
    section = [XLFormSectionDescriptor formSection];
    
    // ui text field
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"UIKit.TextField"
                                                rowType:XLFormRowDescriptorTypeSelectorPush
                                                  title:@"UITextField"];
    [section addFormRow:row];
    [form addFormSection:section];
    
    self.form = form;
}

@end

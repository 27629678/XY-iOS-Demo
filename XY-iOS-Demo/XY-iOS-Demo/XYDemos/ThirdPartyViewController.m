//
//  ThirdPartyViewController.m
//  XY-iOS-Demo
//
//  Created by hzyuxiaohua on 15/12/17.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "ThirdPartyViewController.h"

@interface ThirdPartyViewController ()

@end

@implementation ThirdPartyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self installFormElements];
}

- (void)installFormElements
{
    self.title = @"3rd party";
    
    XLFormRowDescriptor* row;
    XLFormSectionDescriptor* section;
    XLFormDescriptor* form = [XLFormDescriptor formDescriptor];
    
    section = [XLFormSectionDescriptor formSection];
    
    // xlform
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"3rdParty.XLForm"
                                                rowType:XLFormRowDescriptorTypeInfo
                                                  title:@"XLForm"];
    [section addFormRow:row];
    [form addFormSection:section];
    
    self.form = form;
}

@end

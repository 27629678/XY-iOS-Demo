//
//  MainViewController.m
//  XY-iOS-Demo
//
//  Created by hzyuxiaohua on 15/12/17.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "MainViewController.h"

#import "XYUrlQueryParser.h"

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
    
    [self testUrlQueryParser];
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

- (void)testUrlQueryParser
{
    NSString* query = @"uid=5a5c7814d057401a93431e62149c66f2&next=email#note-4&isMobile&ph=&=haha";
    __unused XYUrlQueryParser* parser = [[XYUrlQueryParser alloc] initWithQueryString:query];
    
    __unused NSDictionary* dict = parser.name2valueDictionary;
    
    __unused NSArray* items = parser.concreteQueryItems;
    
    __unused NSString* query1 = parser.concreteQueryString;
    
    NSLog(@"");
}

@end

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
    NSString* query = @"uid=5a5c7814d057401a93431e62149c66f2&next=/openid/%3Fopenid.assoc_handle%3D%257BHMAC-SHA1%257D%257B569f2f2d%257D%257B4xSP3Q%253D%253D%257D%26openid.ax.mode%3Dfetch_request%26openid.ax.required%3Dext0%26openid.ax.type.ext0%3Dhttps%253A%252F%252Flogin.netease.com%252Fopenid%252Fdep%252F%26openid.claimed_id%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%252Fidentifier_select%26openid.identity%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%252Fidentifier_select%26openid.mode%3Dcheckid_setup%26openid.ns%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%26openid.ns.ax%3Dhttp%253A%252F%252Fopenid.net%252Fsrv%252Fax%252F1.0%26openid.ns.sreg%3Dhttp%253A%252F%252Fopenid.net%252Fextensions%252Fsreg%252F1.1%26openid.realm%3Dhttp%253A%252F%252Fqa.mail.netease.com%252F%26openid.return_to%3Dhttp%253A%252F%252Fqa.mail.netease.com%252Fnew%252Flogin%253F_method%253Dget%2526open_id_complete%253D1%26openid.sreg.required%3Dnickname%252Cfullname%252Cemail#note-4&isMobile&ph=&=haha";
    __unused XYUrlQueryParser* parser = [[XYUrlQueryParser alloc] initWithQueryString:query];
    
    __unused NSDictionary* dict = parser.name2valueDictionary;
    
    __unused NSArray* items = parser.concreteQueryItems;
    
    __unused NSString* query1 = parser.concreteQueryString;
    
    NSLog(@"");
}

@end

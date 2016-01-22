//
//  XYUrlQueryParser.h
//  XY-iOS-Demo
//
//  Created by hzyuxiaohua on 16/1/22.
//  Copyright © 2016年 X Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYUrlQueryItem : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* value;

@end    // class XYUrlQueryItem

@interface XYUrlQueryParser : NSObject

- (instancetype)initWithQueryString:(NSString *)query;
- (instancetype)initWithQueryItems:(NSArray<XYUrlQueryItem *> *)items;

- (NSString *)concreteQueryString;
- (NSDictionary *)name2valueDictionary;
- (NSArray<XYUrlQueryItem *> *)concreteQueryItems;

@end    // class XYUrlQueryParser

//
//  XYUrlQueryParser.m
//  XY-iOS-Demo
//
//  Created by hzyuxiaohua on 16/1/22.
//  Copyright © 2016年 X Co., Ltd. All rights reserved.
//

#import "XYUrlQueryParser.h"

@implementation XYUrlQueryItem

- (void)setName:(NSString *)name
{
    _name = [name stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (void)setValue:(NSString *)value
{
    _value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)description
{
    NSString* name = _name;
    NSString* value = _value ? : @"";
    NSString* equal_sign = _value == nil ? @"" : @"=";
    return [NSString stringWithFormat:@"%@%@%@", name, equal_sign, value];
}

@end    // class XYUrlQueryItem

static NSArray<XYUrlQueryItem *> * __query_items_from_query(NSString *query)
{
    // scheme://www.host.com/path?query
    if (query.length == 0) {
        return nil;
    }
    
    // &&       <=> item.name = @""; item.value = nil;
    // &name&   <=> item.name = @"name"; item.value = nil;
    // &=bla&   <=> item.name = @""; item.value = bla;
    // &name=&  <=> item.name = @"name"; item.value = @"";
    NSArray* components = [query componentsSeparatedByString:@"&"];
    NSMutableArray<XYUrlQueryItem *> *items = [NSMutableArray new];
    for (NSString* component in components) {
        XYUrlQueryItem* item = [XYUrlQueryItem new];
        
        if (component.length == 0) {
            item.name = @"";
            item.value = nil;
            
            [items addObject:item];
            continue;
        }
        
        if ([component rangeOfString:@"="].location == NSNotFound) {
            item.name = component;
            item.value = nil;
            
            [items addObject:item];
            continue;
        }
        
        NSArray* sub_components = [component componentsSeparatedByString:@"="];
        assert(sub_components.count == 2);
        if (sub_components.count != 2) {
            continue;
        }
        
        item.name = sub_components.firstObject;
        item.value = sub_components.lastObject;
        [items addObject:item];
    }
    
    return items.copy;
}

@interface XYUrlQueryParser ()

@property (nonatomic, strong) NSArray<XYUrlQueryItem *> * query_items;

@end

@implementation XYUrlQueryParser

- (instancetype)initWithQueryString:(NSString *)query
{
    return [self initWithQueryItems:__query_items_from_query(query)];
}

- (instancetype)initWithQueryItems:(NSArray<XYUrlQueryItem *> *)items
{
    self = [super init];
    if (self) {
        _query_items = items;
    }
    
    return self;
}

- (NSString *)concreteQueryString
{
    NSString* ret_query = [self queryStringFromItems:_query_items];
    
    return [ret_query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSDictionary *)name2valueDictionary
{
    NSMutableDictionary* ret_dict = [NSMutableDictionary new];
    [_query_items enumerateObjectsUsingBlock:^(XYUrlQueryItem *item, NSUInteger idx, BOOL *stop) {
        id object = item.value ? : [NSNull null];
        NSString* key = item.name.length ? item.name : [@(idx) stringValue];
        [ret_dict setObject:object forKey:key];
    }];
    
    return ret_dict;
}

- (NSArray<XYUrlQueryItem *> *)concreteQueryItems
{
    return _query_items;
}

#pragma mark - private

- (NSString *)queryStringFromItems:(NSArray<XYUrlQueryItem *> *)items
{
    return [_query_items componentsJoinedByString:@"&"];
}

@end    // class XYUrlQueryParser

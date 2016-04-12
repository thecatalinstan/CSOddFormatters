//
//  CSTimeIntervalFormatterTests.m
//  CSOddFormatters
//
//  Created by Cătălin Stan on 12/04/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CSTimeIntervalFormatter.h"

@interface CSTimeIntervalFormatterTests : XCTestCase

@end

@implementation CSTimeIntervalFormatterTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testStringFromTimeInterval {
    XCTAssertNotNil([CSTimeIntervalFormatter stringFromTimeInterval:[NSDate date].timeIntervalSince1970]);
    XCTAssertNotNil([CSTimeIntervalFormatter stringFromTimeInterval:[NSDate distantFuture].timeIntervalSinceNow]);
    XCTAssertNotNil([CSTimeIntervalFormatter stringFromTimeInterval:[NSDate distantPast].timeIntervalSinceNow]);

    XCTAssertNotNil([CSTimeIntervalFormatter stringFromTimeInterval:UINTMAX_MAX]);
}

- (void)testStringFromDates {
    XCTAssertNotNil([CSTimeIntervalFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:0] toDate:[NSDate date]]);
    XCTAssertNotNil([CSTimeIntervalFormatter stringFromDate:[NSDate date] toDate:[NSDate distantFuture]]);
    XCTAssertNotNil([CSTimeIntervalFormatter stringFromDate:[NSDate distantPast] toDate:[NSDate date]]);
}

- (void)testStringFromDateComponents {
    NSDateComponents* dateComponents = [[NSDateComponents alloc] init];

    dateComponents.second = [NSDate date].timeIntervalSince1970;
    XCTAssertNotNil([CSTimeIntervalFormatter stringFromDateComponents:dateComponents]);

    dateComponents.second = [[NSDate date] timeIntervalSinceDate:[NSDate distantFuture]];
    XCTAssertNotNil([CSTimeIntervalFormatter stringFromDateComponents:dateComponents]);

    dateComponents.second = [[NSDate date] timeIntervalSinceDate:[NSDate distantPast]];
    XCTAssertNotNil([CSTimeIntervalFormatter stringFromDateComponents:dateComponents]);

    dateComponents.second = UINTMAX_MAX;
    XCTAssertNotNil([CSTimeIntervalFormatter stringFromDateComponents:dateComponents]);
}

@end

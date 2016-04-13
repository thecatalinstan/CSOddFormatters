//
//  CSLargeNumberFormatterTests.m
//  CSOddFormatters
//
//  Created by Cătălin Stan on 13/04/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CSLargeNumberFormatter.h"

@interface CSLargeNumberFormatterTests : XCTestCase

@property (nonatomic, readonly, strong) NSArray<NSString *> * units;

@end

@implementation CSLargeNumberFormatterTests

- (void)setUp {
    [super setUp];

    _units = [[CSLargeNumberFormatter class] performSelector:@selector(units)];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testStringFromNumberNoThrow {
    XCTAssertNoThrow([CSLargeNumberFormatter stringFromNumber:@(arc4random())]);
    XCTAssertNoThrow([CSLargeNumberFormatter stringFromNumber:@(UINTMAX_MAX)]);
    XCTAssertNoThrow([CSLargeNumberFormatter stringFromNumber:@(-UINTMAX_MAX)]);
}

- (void)testStringFromNumberNotNull {
    XCTAssertNotNil([CSLargeNumberFormatter stringFromNumber:@(arc4random())]);
    XCTAssertNotNil([CSLargeNumberFormatter stringFromNumber:@(UINTMAX_MAX)]);
    XCTAssertNotNil([CSLargeNumberFormatter stringFromNumber:@(-UINTMAX_MAX)]);
}

- (void)testStringFromNumberResult {
    [self.units enumerateObjectsUsingBlock:^(NSString * _Nonnull unit, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDecimalNumber * number = [[[NSDecimalNumber decimalNumberWithString:@"1000"] decimalNumberByRaisingToPower:idx] decimalNumberByMultiplyingByPowerOf10:2];

        XCTAssertNotNil([CSLargeNumberFormatter stringFromNumber:number]);
        XCTAssertNoThrow([CSLargeNumberFormatter stringFromNumber:number]);

        XCTAssertNotNil(self.units[idx]);
        XCTAssertNoThrow(self.units[idx]);

        NSString* formattedString = [CSLargeNumberFormatter stringFromNumber:number];
        NSString* expectedString = [[NSString stringWithFormat:@"100 %@", self.units[idx]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSLog(@"%lu) %@ = %@ = %@", idx, number, formattedString, expectedString);
        XCTAssertTrue([formattedString isEqualToString:expectedString]);
    }];
}

- (void)testNumberFromStringNoThrow {
    XCTAssertNoThrow([CSLargeNumberFormatter numberFromString:@(arc4random()).stringValue]);
    XCTAssertNoThrow([CSLargeNumberFormatter numberFromString:@(UINTMAX_MAX).stringValue]);
    XCTAssertNoThrow([CSLargeNumberFormatter numberFromString:@(-UINTMAX_MAX).stringValue]);
}

- (void)testNumberFromStringNotNull {
    XCTAssertNotNil([CSLargeNumberFormatter numberFromString:@(arc4random()).stringValue]);
    XCTAssertNotNil([CSLargeNumberFormatter numberFromString:@(UINTMAX_MAX).stringValue]);
    XCTAssertNotNil([CSLargeNumberFormatter numberFromString:@(-UINTMAX_MAX).stringValue]);
}

- (void)testNumberFromStringIsNull {
    XCTAssertNil([CSLargeNumberFormatter numberFromString:@""]);
    XCTAssertNil([CSLargeNumberFormatter numberFromString:[NSUUID UUID].UUIDString]);
}

- (void)testNumberFromStringResult {
    [self.units enumerateObjectsUsingBlock:^(NSString * _Nonnull unit, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDecimalNumber * expectedNumber = [[[NSDecimalNumber decimalNumberWithString:@"1000"] decimalNumberByRaisingToPower:idx] decimalNumberByMultiplyingByPowerOf10:2];

        XCTAssertNoThrow([CSLargeNumberFormatter stringFromNumber:expectedNumber]);
        XCTAssertNotNil([CSLargeNumberFormatter stringFromNumber:expectedNumber]);
        NSString * formattedString = [CSLargeNumberFormatter stringFromNumber:expectedNumber];

        XCTAssertNoThrow([CSLargeNumberFormatter numberFromString:formattedString]);
        XCTAssertNotNil([CSLargeNumberFormatter numberFromString:formattedString]);

        XCTAssertNoThrow(self.units[idx]);
        XCTAssertNotNil(self.units[idx]);

        NSDecimalNumber * number = (NSDecimalNumber *)[CSLargeNumberFormatter numberFromString:formattedString];

        NSLog(@"%lu) %@ = %@ = %@", idx, formattedString, number, expectedNumber);
        XCTAssertTrue([number compare:expectedNumber] == NSOrderedSame );
    }];
}


@end

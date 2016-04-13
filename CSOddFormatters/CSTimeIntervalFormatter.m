//
//  CSTimeIntervalFormatter.m
//  CSOddFormatters
//
//  Created by Cătălin Stan on 12/04/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import "CSTimeIntervalFormatter.h"

NS_ASSUME_NONNULL_BEGIN
@interface CSTimeIntervalFormatter ()

+ (instancetype)sharedFormatter;

@end
NS_ASSUME_NONNULL_END

@implementation CSTimeIntervalFormatter

+ (CSTimeIntervalFormatter *)sharedFormatter {
    static CSTimeIntervalFormatter *sharedFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedFormatter = [[CSTimeIntervalFormatter alloc] init];
        sharedFormatter.allowedUnits = NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
        sharedFormatter.unitsStyle = NSDateComponentsFormatterUnitsStyleAbbreviated;
        sharedFormatter.includesApproximationPhrase = NO;
        sharedFormatter.includesTimeRemainingPhrase = NO;
    });

    return sharedFormatter;
}

+ (NSString *)stringFromDate:(NSDate *)startDate toDate:(NSDate *)endDate {
    return [[CSTimeIntervalFormatter sharedFormatter] stringFromDate:startDate toDate:endDate];
}

+ (NSString *)stringFromTimeInterval:(NSTimeInterval)timeInterval {
    return [[CSTimeIntervalFormatter sharedFormatter] stringFromTimeInterval:timeInterval];
}

+ (NSString *)stringFromDateComponents:(NSDateComponents *)components {
    return [[CSTimeIntervalFormatter sharedFormatter] stringFromDateComponents:components];
}

@end

//
//  main.m
//  cal
//
//  Created by yin on 16/10/1.
//  Copyright © 2016年 yin. All rights reserved.
//

// 天 一 二 三 四 五 六
//  1  2  3  4  5  6  7
//  8  9 10 11 12 13 14
// 15 16 17 18 19 20 21
// 22 23 24 25 26 27 28
// 29 30 31 32 33 34 35
// 36 37 38 39 40 41 42
// 43 44 45 46 47 48 49
#import <Foundation/Foundation.h>
#import "Month.h"
#import "string.h"
#import "MonthPrintManager.h"

// 获取月的天数
int getNumberOfDaysInMonth(NSDate * date);


// 获取指定的日期是星期几
int getWeekDayWithDate (NSDate * date);

// 打印一个月
void printOneMonth(int mon, int year, NSArray *arr);

// 打印一年
void printYear(int year, NSArray *arr);


int main(int argc, const char * argv[]) {
    
    
    NSArray *arr = @[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                      @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"];
    
    int year = 0;
    int mon = 0;
    
    
    switch (argc) {
        case 1: {
            NSDate *date = [NSDate date];
            NSCalendar *cal = [NSCalendar currentCalendar];
            unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth;
            NSDateComponents *d = [cal components:unitFlags fromDate:date];
            // 当前年月
            year = (int)[d year];
            mon = (int)[d month];
            //TODO check year and month
            printOneMonth(mon, year, arr);
            break;
        }
        case 2: {
            //TODO check year
            year = atoi(argv[1]);
            printYear(year, arr);
            break;
        }
        case 3:
            //TODO check year and month
            year = atoi(argv[2]);
            mon = atoi(argv[1]);
            printOneMonth(mon, year, arr);
            break;
        default:
            //TODO check arguments
            break;
    }
    
    return 0;
}

int getNumberOfDaysInMonth(NSDate * date)
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                   inUnit: NSCalendarUnitMonth
                                  forDate:date];
    return (int)range.length;
}

int getWeekDayWithDate (NSDate * date)
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    
    // 1 是周日，2是周一 3.以此类推
    return (int)[comps weekday];
    
}


void printOneMonth(int mon, int year, NSArray *arr) {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString * str = [NSString stringWithFormat:@"%d-%d-01", year, mon];
    NSDate *date = [formatter dateFromString:str];
    int week = getWeekDayWithDate(date);
    int monthLength = getNumberOfDaysInMonth(date);
    
    Month* month = [Month monthWithStart:week end:monthLength+week-1 title: [NSString stringWithFormat:@"%@ %d", arr[mon-1], year]];
    
    MonthPrintManager* mpm = [[MonthPrintManager alloc] init];
    [mpm addMonth: month];
    [mpm setNumOfOneLine:3];
    [mpm print];
}

void printYear(int year, NSArray *arr) {
    MonthPrintManager* mpm = [[MonthPrintManager alloc] init];
    [mpm setNumOfOneLine:3];
    [mpm setTitle:[NSString stringWithFormat:@"%d", year]];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    for (int mon = 1; mon <= 12; mon ++) {
        NSString * str = [NSString stringWithFormat:@"%d-%d-01", year, mon];
        NSDate *date = [formatter dateFromString:str];
        int week = getWeekDayWithDate(date);
        int monthLength = getNumberOfDaysInMonth(date);
        Month* month = [Month monthWithStart:week end:monthLength+week-1 title: [NSString stringWithFormat:@"%@", arr[mon-1]]];
        [mpm addMonth: month];
    }
    [mpm print];
}

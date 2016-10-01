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
#import "MonthPrintManager.h"

int main(int argc, const char * argv[]) {
    
//    printf("天 一 二 三 四 五 六\n");
//    for (int i = 1; i <= 49; i ++) {
//        if (i%7 == 0) {
//            printf("%2d\n", i);
//        } else {
//            printf("%2d ", i);
//        }
//        
//    }
    
    Month* month = [Month monthWithStart:6 end:36 title:@"十月"];
//    NSLog(@"%d : %d : %@", month.start, month.end, month.title);
    
    MonthPrintManager* mpm = [[MonthPrintManager alloc] init];
    
    [mpm addMonth:month];
    [mpm addMonth:month];
    [mpm addMonth:month];
    
    [mpm addMonth:month];
    [mpm addMonth:month];
    [mpm addMonth:month];
    
    [mpm addMonth:month];
    [mpm addMonth:month];
    [mpm addMonth:month];
    
    [mpm addMonth:month];
    [mpm addMonth:month];
    [mpm addMonth:month];
    [mpm addMonth:month];
    [mpm addMonth:month];
    
    [mpm setNumOfOneLine:4];
    
    [mpm print];
    
//    printf("%d\n", [mpm calcLenOfCNString:@"十月 2016"]);
    
    return 0;
}

//
//  MonthPrintManager.m
//  cal
//
//  Created by yin on 16/10/1.
//  Copyright © 2016年 yin. All rights reserved.
//

#import "MonthPrintManager.h"

@implementation MonthPrintManager {
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _months = [[NSMutableArray alloc] initWithCapacity:12];
        _numOfOneLine = 3;
        _maxNum = 42;
    }
    return self;
}

- (void)addMonth:(Month *)month {
    [_months addObject:month];
}

- (void) print {
    // 当总月份数小于_numOfOneLine时，居中显示不一样
//    int maxCol = [_months count] > _numOfOneLine ? _numOfOneLine : [_months count];
    //todo 居中打印年标题 （ 总字符数为：maxCol*(7*2＋6＊1)＋ (maxCol－1)*2 )
    for (int i = 0; i < [_months count]; i += _numOfOneLine) {  // 月份行数 （比如12个月，没行打3个月，那么月份行数为4）
        // 每行月份打印的 月数（最大月份行数时有可能比_numOfOneLine小）
        int col = [_months count]-i > _numOfOneLine ? _numOfOneLine : [_months count]-i;
        
        //todo 居中打印月份标题 (总字符数为 7*2＋6＊1)
        for (int r = 0; r < 6; r++) {  //每行月份 要打印六行
            for (int k = 0; k < col; k++) { // 每行月份打印的 月数（有可能比_numOfOneLine小）
                Month* month = _months[i+k];
                for (int n = 1; n <= 7; n++) { // 打印周日到周六 总共7天
                    if (r*7 + n >= month.start && r*7 + n <= month.end) {
                        printf("%2d", r*7 + n - month.start + 1);
                    }
                    else {
                        printf("  ");
                    }
                    if (n != 7) {
                        printf(" ");
                    }
                }
                k+1 < col ? printf("  ") : printf("\n");
            }
        }
    }
}

- (int)calcLenOfCNString:(NSString *)str {
    int cnNum = 0;
    for(int i = 0; i < [str length]; i++){
        int a = [str characterAtIndex: i];
        if( a >= 0x4e00 && a <= 0x9fff)
            cnNum++;
    }
    int len = [str length] + cnNum;
    return len;
}

@end

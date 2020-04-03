#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {


    NSMutableString *str = [[NSMutableString alloc] init];
    BOOL skipNext = false;

    if ([numbers count] == 0) {
        return nil;
    } else {
        NSUInteger countNumbers = [numbers count];
        for (int i = 0; i < [numbers count]; i++) {
            NSNumber *num = numbers[i];

            countNumbers = countNumbers - 1;
            if (skipNext) {
                skipNext = false;
            } else {
                if (countNumbers >= 2) {
                    if (abs([num intValue]) != 1) {
                        [str appendString:[NSString stringWithFormat:@"%d%@%lu",abs([num intValue]), @"x^", (unsigned long)(countNumbers)]];
                    } else {
                        [str appendString:[NSString stringWithFormat:@"%@%lu", @"x^", (unsigned long)(countNumbers)]];
                    }
                } else if (countNumbers == 1) {
                    if (abs([num intValue]) != 1) {
                        [str appendString:[NSString stringWithFormat:@"%d%@",abs([num intValue]), @"x"]];
                    } else {
                        [str appendString:[NSString stringWithFormat:@"%@", @"x"]];
                    }
                } else if (countNumbers == 0) {
                    [str appendString:[NSString stringWithFormat:@"%d",abs([num intValue])]];
                }
            }
            if (countNumbers > 0) {
                if ([numbers[i+1] intValue] > 0) {
                    [str appendString:[NSString stringWithFormat:@" + "]];
                } else if ([numbers[i+1] intValue] < 0){
                    [str appendString:[NSString stringWithFormat:@" - "]];
                } else {
                    skipNext = true;
                }
            }
        }
    }
    return str;
}
@end

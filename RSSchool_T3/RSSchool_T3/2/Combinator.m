#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {

    int M_numberOfPosters = [array[0] intValue];
    int N_numberOfColors = [array[1] intValue];

    if (N_numberOfColors == M_numberOfPosters) {
        return @1;
    } else {
        for (int i = 1; i < N_numberOfColors; i++) {

            double n = [Combinator permutations: N_numberOfColors];
            double nr = [Combinator permutations: (N_numberOfColors - i)]*[Combinator permutations: i];
            double c = n/nr;

            if (c >= M_numberOfPosters) {
                return [NSNumber numberWithInt:i];
            }
        }
    }
    return nil;
}

+ (double)permutations:(NSInteger)num {
    double perm = 1;
    for (int i = 1; i <= num; i++) {
        perm = perm * i;
    }
    return perm;
}

@end


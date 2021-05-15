#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger returnNumber = 0;
    for (int member = 0; member < [array count]; member++) {
        for (int anotherMember = 1 + member; anotherMember < [array count]; anotherMember++) {
            if (abs([array[anotherMember] intValue] - [array[member] intValue]) == [number intValue]) {
                returnNumber++;
            }
        }
    }
    return returnNumber;
}

@end

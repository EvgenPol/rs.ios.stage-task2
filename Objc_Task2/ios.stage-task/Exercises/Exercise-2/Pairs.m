#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger returnNumber = 0;
    for (NSNumber *member in array) {
        
        for (NSNumber *anotherMember in array) {
            if ([member intValue] - [anotherMember intValue] < 0) { break; }
            
            if ([member intValue] - [anotherMember intValue] == [number intValue]) {
                returnNumber++;
            }
        }
    }
    return returnNumber;
}

@end

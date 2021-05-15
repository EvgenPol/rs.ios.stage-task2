#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if ([array isEqualToArray:@[]] || array == nil || ![array[0] isKindOfClass:[NSArray class]])  {
        return @[];
    }
    NSMutableArray *arrayOfNumbers = [NSMutableArray new];
    NSMutableArray *arrayOfStrings = [NSMutableArray new];
    for (NSArray *oneArray in array) {
        for (id member in oneArray) {
            if ([member isKindOfClass:[NSNumber class]]) {
                [arrayOfNumbers addObject:member];
            } else {
                [arrayOfStrings addObject:member];
            }
        }
    }
    if (arrayOfStrings.count == 0) {
        [arrayOfNumbers sortUsingDescriptors: [NSArray arrayWithObject: [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES]]];
        return arrayOfNumbers;
    } else if (arrayOfNumbers.count == 0){
        [arrayOfStrings sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        return arrayOfStrings;
    }
    [arrayOfNumbers sortUsingDescriptors: [NSArray arrayWithObject: [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES]]];
    [arrayOfStrings sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(localizedCaseInsensitiveCompare:)]]];
    return @[arrayOfNumbers, arrayOfStrings];
}
    
@end

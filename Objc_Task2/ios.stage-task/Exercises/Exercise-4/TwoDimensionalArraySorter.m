#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (([array isEqualToArray:@[]] || array == nil))  {
        return @[];
    }
    for (NSArray *internalArray in array) {
        if (![internalArray isKindOfClass:[NSArray class]]) {
            return @[];
        }
    }
    NSMutableArray *arrayOfNumbers = [NSMutableArray new];
    NSMutableArray *arrayOfStrings = [NSMutableArray new];
    NSArray *returnedNumbers;
    NSArray *returnedStrings;
    NSArray *returnedTwoDimensional;
    
    for (NSArray *oneArray in array) {
        if ([oneArray[0] isKindOfClass:[NSNumber class]]) {
            [arrayOfNumbers addObjectsFromArray:oneArray];
        }
        
        if ([oneArray[0] isKindOfClass:[NSString class]]) {
            [arrayOfStrings addObjectsFromArray:oneArray];
        }
    }
    
    if (arrayOfNumbers.count > 0 ) {
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
        returnedNumbers = [arrayOfNumbers sortedArrayUsingDescriptors:@[descriptor]];
    }
    
    if (arrayOfStrings.count > 0) {
        returnedStrings = [arrayOfStrings sortedArrayUsingSelector:@selector(compare:)];
    }
    
    if (returnedStrings != nil && returnedNumbers != nil) {
        returnedTwoDimensional = @[returnedNumbers, returnedStrings];
        return returnedTwoDimensional;
    }
    
    if (returnedNumbers.count > 0) {
        return returnedNumbers;
    } else {
        return returnedStrings;
    }
}

@end

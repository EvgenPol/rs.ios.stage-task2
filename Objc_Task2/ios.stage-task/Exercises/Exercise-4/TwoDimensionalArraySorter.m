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

    for (NSArray *oneArray in array) {
        if ([oneArray[0] isKindOfClass:[NSNumber class]]) {
            [arrayOfNumbers addObjectsFromArray:oneArray];
        }
        
        if ([oneArray[0] isKindOfClass:[NSString class]]) {
            [arrayOfStrings addObjectsFromArray:oneArray];
        }
    }
    
   
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSSortDescriptor *descriptorForDisascending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    
    
    if (arrayOfNumbers.count > 0 && arrayOfStrings.count > 0) {
        return @[[arrayOfNumbers sortedArrayUsingDescriptors:@[descriptor]], [arrayOfStrings sortedArrayUsingDescriptors:@[descriptorForDisascending]]];
    }
    
    if (arrayOfNumbers.count > 0) {
        return [arrayOfNumbers sortedArrayUsingDescriptors:@[descriptor]];;
    } else {
        return [arrayOfStrings sortedArrayUsingSelector:@selector(compare:)];;
    }
}

@end

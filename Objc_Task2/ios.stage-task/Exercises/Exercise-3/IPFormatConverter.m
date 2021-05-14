#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if (numbersArray == nil || [numbersArray isEqualToArray:@[]]) { return @"";}
    for (NSNumber *number in numbersArray) {
        if ([number intValue] > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        if ([number integerValue] != [number unsignedIntValue]) {
            return @"Negative numbers are not valid for input.";
        }
    }
    
    NSMutableArray *temporaryArray = [NSMutableArray arrayWithArray:numbersArray];
    while (temporaryArray.count != 4) {
        if (temporaryArray.count > 4) {
            [temporaryArray removeLastObject];
        }else{
            [temporaryArray addObject:@0];
        }
    }
    
    NSMutableString *str = [NSMutableString new];
    
    NSEnumerator *enumerator = [temporaryArray objectEnumerator];
    NSNumber *number;
    while (number = [enumerator nextObject]) {
        [str appendString:[NSString stringWithFormat:@"%@.", number]];
    }
    

    NSString *result = [str stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
    
    return result;
}

@end

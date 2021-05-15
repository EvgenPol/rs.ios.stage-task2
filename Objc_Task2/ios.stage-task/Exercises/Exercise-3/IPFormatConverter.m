#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if (numbersArray == nil || [numbersArray isEqualToArray:@[]]) {
        return @"";
    }
    NSMutableString *returned = [NSMutableString new];
    NSInteger number = 0;
    while (number != 4) {
        NSInteger value = 0;
        if (number < numbersArray.count) {
            value = [numbersArray[number] intValue];
        }
        if (value > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        } else if (value < 0) {
            return @"Negative numbers are not valid for input.";
        } else {
            [returned appendFormat:@"%ld.", value];
            number++;
        }
    }
    return [returned substringToIndex:[returned length] - 1];
}

@end

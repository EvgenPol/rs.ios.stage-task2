#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    NSInteger value = [[NSNumber numberWithUnsignedChar:n] integerValue];
    
    NSMutableArray *binNumber = [NSMutableArray new];
    
    while (binNumber.count != 8) {
        if (value % 2 == 1) {
            [binNumber addObject:@1];
            value = value/2;
        }else{
            [binNumber addObject:@0];
            value = value/2;
        }
        if (value == 1){
            [binNumber addObject:@1];
            value = 0;
        } else if (value == 0){
            [binNumber addObject:@0];
        }
    }

    
    while (binNumber.count >0) {
        value = value + [binNumber.firstObject doubleValue] * pow(2, binNumber.count-1);
        [binNumber removeObjectAtIndex:0];
    }
    
    return value;
}

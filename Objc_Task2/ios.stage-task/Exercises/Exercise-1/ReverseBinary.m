#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    
    UInt8 value = 0;
    for (NSInteger number = 0; number < 8; number++) {
        if ( n % 2) {
            value+=pow(2, 7 - number);
        }
        n /= 2;
    }
    return value;
}

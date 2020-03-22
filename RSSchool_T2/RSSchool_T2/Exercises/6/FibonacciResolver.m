#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    int n = [number intValue];
    NSMutableArray *array = [[NSMutableArray alloc] init];

    int firstEl = 0;
    int currentEl = 1;

    while (currentEl < n) {
        int sum = firstEl + currentEl;
        firstEl = currentEl;
        currentEl  = sum;
        if (firstEl * currentEl == n) {
            array = [NSMutableArray arrayWithObjects:@(firstEl), @(currentEl), @1, nil];
            break;
        } else if (firstEl * currentEl > n) {
            array = [NSMutableArray arrayWithObjects:@(firstEl), @(currentEl), @0, nil];
            break;
        }
    }
    return array;
}
@end

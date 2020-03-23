#import "Blocks.h"

@implementation Blocks

- (instancetype)init {
    self = [super init];
    if (self) {
        self.blockA = ^(NSArray *array) {
            self.array = array;
        };
        self.blockB = ^(Class class) {
            NSMutableArray *tempArray = [self.array mutableCopy];
            [tempArray removeObjectIdenticalTo: [NSNull null]];
            [tempArray filterUsingPredicate: [NSPredicate predicateWithFormat: @"self isKindOfClass: %@", class]];

            if (class == [NSString class]) {
                self.blockC([tempArray componentsJoinedByString: @""]);
            } else if (class == [NSNumber class]) {
                self.blockC([tempArray valueForKeyPath: @"@sum.self"]);
            } else if (class == [NSDate class]) {
                NSDate *neededDate = [tempArray firstObject];
                for (NSDate *currentDate in tempArray) {
                    neededDate = [currentDate laterDate: neededDate];
                }
                NSDateFormatter *format = [[NSDateFormatter alloc] init];
                [format setDateFormat: @"dd.MM.yyyy"];
                self.blockC([format stringFromDate: neededDate]);
            }
        };
    }
    return self;
}

@end


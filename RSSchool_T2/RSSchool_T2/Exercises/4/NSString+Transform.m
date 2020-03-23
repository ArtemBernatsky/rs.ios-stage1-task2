#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString: @"AEIOUYaeiouy"];
    NSCharacterSet *consonants = [NSCharacterSet characterSetWithCharactersInString: @"BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz"];
    NSCharacterSet *characterSetForSearch = [self isPangram] ? vowels : consonants;
    
    NSMutableArray<NSString*> *words = [NSMutableArray arrayWithArray: [self componentsSeparatedByString:@" "]];
    NSMutableArray<NSString*> *result = [[NSMutableArray alloc] init];
    
    for (NSString *word in words) {
        if (![word isEqualToString:@""]) {
            NSMutableString *mutableWord = [NSMutableString stringWithString: word];
            int count = 0;
            
            for (int i = 0; i < word.length; i++) {
                NSRange range = NSMakeRange(i, 1);
                NSString *currentCharacter = [word substringWithRange: range];
                if ([currentCharacter rangeOfCharacterFromSet: characterSetForSearch].location != NSNotFound) {
                    [mutableWord replaceCharactersInRange: range withString: [currentCharacter uppercaseString]];
                    count++;
                }
            }
            [result addObject: [NSString stringWithFormat:@"%d%@", count, mutableWord]];
        }
    }
    
    [result sortUsingComparator: ^NSComparisonResult(id word1, id word2) {
        NSRange weightCursor = NSMakeRange(0, 1);
        
        int firstWeight = [[word1 substringWithRange: weightCursor] intValue];
        int secondWeight = [[word2 substringWithRange: weightCursor] intValue];
        
        if (firstWeight < secondWeight) {
            return NSOrderedAscending;
        } else if (firstWeight == secondWeight) {
            return NSOrderedSame;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    return [result componentsJoinedByString:@" "];
}

- (BOOL)isPangram {
    NSArray<NSString*>* alphabet = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M",
                                     @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    
    NSMutableSet<NSString*>* uniqCharacters = [[NSMutableSet alloc] initWithArray: alphabet];
    
    for (int i = 0; i < self.length; i++) {
        NSString *currentCharacter = [self substringWithRange: NSMakeRange(i, 1)];
        [uniqCharacters removeObject: [currentCharacter uppercaseString]];
    }
    
    return [uniqCharacters count] == 0;
}

@end

#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSCharacterSet *bSet = [NSCharacterSet characterSetWithCharactersInString: b];
    NSCharacterSet *invertedBSet = [bSet invertedSet];
    
    NSArray <NSString *> *commonCharacters = [[a uppercaseString] componentsSeparatedByCharactersInSet: invertedBSet];
    NSString *result = [commonCharacters componentsJoinedByString: @""];

    if ([result isEqualToString: b]) {
        return @"YES";
    }
    else {
        return @"NO";        
    }
}
@end

#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    dateFormatter.dateFormat = @"dd MMMM, EEEE";
    
    NSDateComponents *target = [[NSDateComponents alloc] init];
    target.year = [year integerValue];
    target.month = [month integerValue];
    target.day = [day integerValue];

    if ([target isValidDateInCalendar: calendar]) {
        NSDate *currentDate = [calendar dateFromComponents:target];
        return [dateFormatter stringFromDate:currentDate];
    } else {
        return @"Такого дня не существует";
    }
}

@end

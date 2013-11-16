//
//  Statics.h

#import <Foundation/Foundation.h>

static NSString *USERID = @"userId";
static NSString *PASS= @"pass";
static NSString *SERVER = @"server";
static NSString *ADDRESS=@"ADDRESS";
static NSArray *userInfo;
static NSArray *commentInfo;
static NSArray *restaurantInfo;
static NSString *userStr;
static NSString *commentStr;
static NSString *restaurantStr;
@interface Statics : NSObject

+(NSString *)getCurrentTime;

@end

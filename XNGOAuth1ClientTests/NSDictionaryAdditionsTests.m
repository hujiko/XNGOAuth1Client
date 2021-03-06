#import <XCTest/XCTest.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>

#import <XNGOAuth1Client/NSDictionary+XNGOAuth1Additions.h>

@interface NSDictionaryAdditionsTests : XCTestCase

@end

@implementation NSDictionaryAdditionsTests

- (void)testInitializer {
    NSString *queryString = @"param1=HELLO&param2=XING";
    NSDictionary *resultDict = [[NSDictionary alloc] xng_initWithQueryString:queryString];

    expect(resultDict[@"param1"]).to.equal(@"HELLO");
    expect(resultDict[@"param2"]).to.equal(@"XING");
}

- (void)testClassMethod {
    NSString *queryString = @"param1=HELLO&param2=XING";
    NSDictionary *resultDict = [NSDictionary xng_dictionaryFromQueryString:queryString];

    expect(resultDict[@"param1"]).to.equal(@"HELLO");
    expect(resultDict[@"param2"]).to.equal(@"XING");
}

- (void)testQueryStringRepresentation {
    NSDictionary *dictionary = @{
            @"param1": @"HELLO",
            @"param2": @"XING"};
    NSString *queryString = [dictionary xng_queryStringRepresentation];
    expect(queryString).to.equal(@"param1=HELLO&param2=XING");
}

@end

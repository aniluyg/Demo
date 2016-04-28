//
//  TestTests.m
//  TestTests
//
//  Created by anil on 26/04/16.
//  Copyright © 2016 . All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SearchUtil.h"
@interface TestTests : XCTestCase

@end

@implementation TestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    [SearchUtil sharedUtil];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPrefixSearchLastWord {
    [self searchTestWithParam:@"événements"];
    XCTAssertTrue([@"événements" isEqualToString:[self searchTestWithParam:@"événements"]]);

}

- (void)testPrefixSearchWithOneChar {

    XCTAssertTrue([@"a" isEqualToString:[self searchTestWithParam:@"a"]]);

}

- (void)testPrefixSearchWithNoFound {
    NSArray *resultList = [[SearchUtil sharedUtil] getSuggestionsWithPrefix:@"aaaaaaaaa"];
    XCTAssertNotNil(resultList);
    XCTAssertFalse(resultList.count > 0);
}

- (NSString*)searchTestWithParam:(NSString*)param {
    NSArray *resultList = [[SearchUtil sharedUtil] getSuggestionsWithPrefix:param];
    
    XCTAssertNotNil(resultList);
    XCTAssertTrue(resultList.count > 0);
    
    NSString *searchResult = [resultList objectAtIndex:0];
    
    XCTAssertNotNil(searchResult);
    
    return searchResult;
}


- (void)testPerformancePrefixSearchOneCharInFirstWord {
    SearchUtil *searchUtil = [SearchUtil sharedUtil];
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [searchUtil getSuggestionsWithPrefix:@"A"];
    }];
}

- (void)testPerformancePrefixSearchOneCharInMiddleWord {
    SearchUtil *searchUtil = [SearchUtil sharedUtil];
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [searchUtil getSuggestionsWithPrefix:@"f"];
    }];
}

- (void)testPerformancePrefixSearchOneCharInLastWord {
    SearchUtil *searchUtil = [SearchUtil sharedUtil];
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [searchUtil getSuggestionsWithPrefix:@"é"];
    }];
}


- (void)testPerformancePrefixSearchNotFound {
    SearchUtil *searchUtil = [SearchUtil sharedUtil];
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [searchUtil getSuggestionsWithPrefix:@"aaaaaaaaa"];
    }];
}

- (void)testPerformanceFullTextLastWord {
    SearchUtil *searchUtil = [SearchUtil sharedUtil];
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [searchUtil getSuggestionsWithPrefix:@"événements"];
    }];
}

- (void)testPerformanceFullTextMiddleWord {
    SearchUtil *searchUtil = [SearchUtil sharedUtil];
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [searchUtil getSuggestionsWithPrefix:@"flies"];
    }];
}

- (void)testPerformanceFullTextFirstWord {
    SearchUtil *searchUtil = [SearchUtil sharedUtil];
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [searchUtil getSuggestionsWithPrefix:@"A"];
    }];
}
@end

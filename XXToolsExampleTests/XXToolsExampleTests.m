//
//  XXToolsExampleTests.m
//  XXToolsExampleTests
//
//  Created by xunxu on 16/10/13.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XXToolsHeader.h"
@interface XXToolsExampleTests : XCTestCase

@end

@implementation XXToolsExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMatchPhone {
    NSString *phone1 = nil;
    NSString *phone2 = @"";
    NSString *phone3 = @"1234";
    NSString *phone4 = @"123456789101111";
    NSString *phone5 = @"12345678910";
    
    XXLog(@"\nphone1:%@\nphone2:%@\nphone3:%@\nphone4:%@\nphone5:%@", @([phone1 matchPhone]), @([phone2 matchPhone]), @([phone3 matchPhone]), @([phone4 matchPhone]), @([phone5 matchPhone]));
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

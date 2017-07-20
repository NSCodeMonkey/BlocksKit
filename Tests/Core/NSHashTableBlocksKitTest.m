//
//  NSHashTableBlocksKitTest.m
//  BlocksKit
//
//  Created by edison on 20/07/2017.

@import XCTest;
@import BlocksKit;

@interface NSHashTableBlocksKitTest : XCTestCase

@end

@implementation NSHashTableBlocksKitTest {
    NSHashTable *_subject;
    NSInteger _total;
}

- (void)setUp {
    _subject = [NSHashTable weakObjectsHashTable];
    [_subject addObject:@"1"];
    [_subject addObject:@"22"];
    [_subject addObject:@"333"];
    
    _total = 0;
}

- (void)testEach {
    void(^senderBlock)(id) = ^(NSString *sender) {
        _total += [sender length];
    };
    [_subject bk_each:senderBlock];
    XCTAssertEqual(_total, (NSInteger)6 ,@"total length of \"122333\" is %ld", (long)_total);
}

@end

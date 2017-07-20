//
//  NSHashTable+BlocksKit.m
//  BlocksKit
//

#import "NSHashTable+BlocksKit.h"

@implementation NSHashTable (BlocksKit)

- (void)bk_enumerateKeysAndObjectsUsingBlock:(void (^)(id obj, BOOL* stop))block
{
    BOOL stop = NO;
    for (id obj in self)
    {
        block(obj, &stop);
        if (stop)
        {
            break;
        }
    }
}

- (void)bk_each:(void (^)(id obj))block
{
    NSParameterAssert(block != nil);

    [self bk_enumerateKeysAndObjectsUsingBlock:^(id obj, BOOL* stop) {
        block(obj);
    }];
}

@end

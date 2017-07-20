//
//  NSHashTable+BlocksKit.h
//  BlocksKit
//

#import "BKDefines.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** Block extensions for NSHashTable.
 */
@interface __GENERICS(NSHashTable, ObjectType) (BlocksKit)

/** Loops through a hashTable and executes the given block with each object.
 
 @param block A single-argument, void-returning code block.
 */
- (void)bk_each:(void (^)(ObjectType obj))block;

@end

NS_ASSUME_NONNULL_END

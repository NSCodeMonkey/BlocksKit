//
//  MFMessageComposeViewControllerBlocksKitTest.m
//  BlocksKit Unit Tests
//

@import XCTest;
@import BlocksKit.Dynamic.MessageUI;

/**
 It seems like showing an MFMessageComposeViewController in a test cause an exception.
 
 seealso:
 https://stackoverflow.com/questions/22335403/issue-with-unit-tests-in-xcode-5-1-ios-7-1-assertion-failure-in-bkseventfocus
 https://github.com/jonreid/MockUIAlertViewActionSheet
 */

#if 0

@interface MFMessageComposeViewControllerBlocksKitTest : XCTestCase <MFMessageComposeViewControllerDelegate>

- (void)testCompletionBlock;

@end

@implementation MFMessageComposeViewControllerBlocksKitTest {
	MFMessageComposeViewController *_subject;
	BOOL delegateWorked;
}

- (void)setUp {
	_subject = [MFMessageComposeViewController new];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
	delegateWorked = YES;
}

- (void)testCompletionBlock {
	if (![MFMessageComposeViewController canSendText])
		return;
	
	delegateWorked = NO;
	__block BOOL blockWorked = NO;
	_subject.messageComposeDelegate = self;
	_subject.bk_completionBlock = ^(MFMessageComposeViewController *controller, MessageComposeResult result) {
		blockWorked = YES;
	};
	[[_subject bk_dynamicDelegateForProtocol:@protocol(MFMessageComposeViewControllerDelegate)] messageComposeViewController:_subject didFinishWithResult:MessageComposeResultSent];
	XCTAssertTrue(delegateWorked, @"Delegate method not called.");
	XCTAssertTrue(blockWorked, @"Block handler not called.");
}

@end

#endif

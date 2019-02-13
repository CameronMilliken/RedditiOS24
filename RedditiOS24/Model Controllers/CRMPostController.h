//
//  CRMPostController.h
//  RedditiOS24
//
//  Created by Cameron Milliken on 2/13/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRMPost.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRMPostController : NSObject

+ (void)fetchAllPostsForSubreddit:(NSString *)title completeion:(void(^)(NSArray<CRMPost *> *_Nullable posts))completion;

+ (void)fetchImageFromImageString:(NSString *)imageString completion:(void(^)(UIImage * _Nullable image)) completion;

@end

NS_ASSUME_NONNULL_END

//
//  CRMPost.h
//  RedditiOS24
//
//  Created by Cameron Milliken on 2/13/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRMPost : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *upVotes;
@property (nonatomic, readonly) NSNumber *commentCount;
@property (nonatomic, copy, readonly, nullable) NSString *thumbnailString;


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

//
//  CRMPost.m
//  RedditiOS24
//
//  Created by Cameron Milliken on 2/13/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import "CRMPost.h"

@implementation CRMPost

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    //1) Get all of the necessary Values out of the dictionary
    //The red words are determined by the Reddit JSON
    NSDictionary *dataDictionary = dictionary[@"data"];
    NSString *titleFromJSON = dataDictionary[@"title"];
    NSNumber *upVotesFromJSON = dataDictionary[@"ups"];
    NSNumber *commentCountFromJSON = dataDictionary[@"num_comments"];
    NSString *thumbnailStringFromJSON = dataDictionary[@"thumbnail"];
    
    //2) Initializing and setting values.The values need to be pulled from the JSON.
    self = [super init];
    if (self) {
        _title = titleFromJSON;
        _upVotes = upVotesFromJSON;
        _commentCount = commentCountFromJSON;
        _thumbnailString = thumbnailStringFromJSON;
    }
    return self;
}

@end

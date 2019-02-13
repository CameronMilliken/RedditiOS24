//
//  CRMPostController.m
//  RedditiOS24
//
//  Created by Cameron Milliken on 2/13/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import "CRMPostController.h"


@implementation CRMPostController

+ (NSURL *)baseUrl
{
    return [NSURL URLWithString:@"https://www.reddit.com/r/"];
}

+ (void)fetchAllPostsForSubreddit:(NSString *)title completeion:(void (^)(NSArray<CRMPost *> * _Nullable))completion
{
    // Construct the URL
    NSURL *url = [[[CRMPostController baseUrl] URLByAppendingPathComponent:title] URLByAppendingPathExtension:@"json"];
    NSLog(@"%@", [url absoluteString]);
    
    // Data Task
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        //Check response
//        NSLog(@"%@", response);
        if (!data){
            NSLog(@"No data available");
            completion(nil);
            return; //
        }
        //Serialization
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = jsonDictionary[@"data"];
        NSArray *childrenArray = dataDictionary[@"children"];
        
        NSMutableArray *postsArray = [[NSMutableArray alloc] init];
        
        //For In Loop.
        for (NSDictionary *postDictionary in childrenArray) {
            CRMPost *post = [[CRMPost alloc] initWithDictionary:postDictionary];
            
            [postsArray addObject:post];
        }
        completion(postsArray);
    }]resume];
}

+ (void)fetchImageFromImageString:(NSString *)imageString completion:(void (^)(UIImage * _Nullable))completion

{
    // Create a URL from the image string
    NSURL *imageURL = [[NSURL alloc] initWithString:imageString];
    
    //Use the URL to make a network call
    [[[NSURLSession sharedSession] dataTaskWithURL: imageURL completionHandler:^(NSData * _Nullable imageData, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Handle the error
        if (error) {
            NSLog(@"There was an error fetching your imageData from the NSURL %@", error.localizedDescription);
        }
        //response
//        if (response) {
//            NSLog(@"%@", response);
//        }
        // If there is no image data...
        if (!imageData){
            NSLog(@"No image data from network request %@", error.localizedDescription);
        }
        // With this data init an image
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        
        if (image) {
            // Complete image
            completion(image);
        } else {
            return completion(nil);
        }
    }]resume];
    
}




@end

//
//  Kumulos.h
//  Kumulos
//
//  Created by Kumulos Bindings Compiler on Apr 21, 2016
//

#import <Foundation/Foundation.h>
#import "libKumulos.h"


@class Kumulos;
@protocol KumulosDelegate <kumulosProxyDelegate>
@optional

 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation uploadPhotoDidCompleteWithResult:(NSNumber*)newRecordID;
 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation createPostDidCompleteWithResult:(NSNumber*)newRecordID;
 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation getPostDidCompleteWithResult:(NSArray*)theResults;
 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation createUserDidCompleteWithResult:(NSNumber*)newRecordID;
 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation deleteUserDidCompleteWithResult:(NSNumber*)affectedRows;
 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation selectUserDidCompleteWithResult:(NSArray*)theResults;
 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation updateUserDidCompleteWithResult:(NSNumber*)affectedRows;

@end

@interface Kumulos : kumulosProxy {
    NSString* theAPIKey;
    NSString* theSecretKey;
}

-(Kumulos*)init;
-(Kumulos*)initWithAPIKey:(NSString*)APIKey andSecretKey:(NSString*)secretKey;

   
-(KSAPIOperation*) uploadPhotoWithImageData:(NSData*)imageData andPostData:(NSUInteger)postData;
    
   
-(KSAPIOperation*) createPostWithDescription:(NSString*)description andPostOwner:(NSUInteger)postOwner andImageData:(NSNumber*)imageData;
    
   
-(KSAPIOperation*) getPostWithPostOwner:(NSUInteger)postOwner;
    
   
-(KSAPIOperation*) createUserWithUsername:(NSString*)username andPassword:(NSString*)password andEmail:(NSString*)email andAuthData:(NSString*)authData;
    
   
-(KSAPIOperation*) deleteUserWithUsername:(NSString*)username andPassword:(NSString*)password;
    
   
-(KSAPIOperation*) selectUserWithUsername:(NSString*)username;
    
   
-(KSAPIOperation*) updateUserWithUsername:(NSString*)username andPassword:(NSString*)password andEmail:(NSString*)email;
    
            
@end
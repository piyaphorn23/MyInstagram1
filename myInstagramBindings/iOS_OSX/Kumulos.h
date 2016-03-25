//
//  Kumulos.h
//  Kumulos
//
//  Created by Kumulos Bindings Compiler on Mar 16, 2016
//  Copyright DPU All rights reserved.
//

#import <Foundation/Foundation.h>
#import "libKumulos.h"


@class Kumulos;
@protocol KumulosDelegate <kumulosProxyDelegate>
@optional

 
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

   
-(KSAPIOperation*) createUserWithUsername:(NSString*)username andPassword:(NSString*)password andEmail:(NSString*)email andAuthData:(NSString*)authData;
    
   
-(KSAPIOperation*) deleteUserWithUsername:(NSString*)username andPassword:(NSString*)password;
    
   
-(KSAPIOperation*) selectUserWithUsername:(NSString*)username;
    
   
-(KSAPIOperation*) updateUserWithUsername:(NSString*)username andPassword:(NSString*)password andEmail:(NSString*)email;
    
            
@end
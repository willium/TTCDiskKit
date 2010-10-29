//
//  TTCDiskKit.m
//  Drive
//
//  Created by will strimling on 8/5/10.
//  Copyright 2010 TapTouchClick - Will Strimling. All rights reserved.
//

#import "TTCDiskKit.h"


@implementation TTCDiskKit

+(NSString *)gigabytesFromBytes:(float)bytes {
	float kilobytes = bytes/1024.0;
	float megabytes = kilobytes/1024.0;
	float gigabytes = megabytes/1024.0;
	return [NSString stringWithFormat:@"%.2f",gigabytes];
}

+(NSString *)totalSpace {  
    float bytes = 0.0f;  
    NSError *error = nil;  
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];  
    
    if (dictionary) {  
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];  
        bytes = [fileSystemSizeInBytes floatValue];  
    } else {  
        NSLog(@"Error Obtaining File System Info: Domain = %@, Code = %@", [error domain], [error code]);  
    }  
	
    return [self gigabytesFromBytes:bytes];
}

+(NSString *)takenSpace {  
	float bytes = ([[self totalSpace]floatValue])-([[self freeSpace]floatValue]);
    return [NSString stringWithFormat:@"%.2f",bytes];
}

+(NSString *)freeSpace {  
	float bytes = 0.0f;  
    NSError *error = nil;  
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];  
	
    if (dictionary) {  
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemFreeSize];  
        bytes = [fileSystemSizeInBytes floatValue];  
    } else {  
        NSLog(@"Error Obtaining File System Info: Domain = %@, Code = %@", [error domain], [error code]);  
    }  
   
    return [self gigabytesFromBytes:bytes];

}

@end

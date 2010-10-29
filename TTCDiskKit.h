//
//  TTCDiskKit.h
//  Drive
//
//  Created by will strimling on 8/5/10.
//  Copyright 2010 TapTouchClick - Will Strimling. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TTCDiskKit : NSObject {

}

+(NSString *)gigabytesFromBytes:(float)bytes;

+(NSString *)totalSpace;
+(NSString *)takenSpace;
+(NSString *)freeSpace;
@end

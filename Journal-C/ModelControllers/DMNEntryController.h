//
//  DMNEntryController.h
//  Journal-C
//
//  Created by Chris Anderson on 12/5/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMNEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface DMNEntryController : NSObject

+ (DMNEntryController *)sharedController;

- (void)saveToPersistentStorage;

@property (nonatomic, strong, readonly) NSArray *entries;
- (void)addEntriesObject:(DMNEntry *)entry;
- (void)removeEntriesObject:(DMNEntry *)entry;

@end

NS_ASSUME_NONNULL_END

//
//  DMNEntryController.m
//  Journal-C
//
//  Created by Chris Anderson on 12/5/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import "DMNEntryController.h"


static NSString * const EntriesKey = @"entries";

@interface DMNEntryController ()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end

@implementation DMNEntryController

+ (DMNEntryController *)sharedController
{
    static DMNEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DMNEntryController alloc] init];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [NSMutableArray array];
    }
    return self;
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (DMNEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries) {
        DMNEntry *entry = [[DMNEntry alloc] initWithDictionary:dictionary];
        [self addEntriesObject:entry];
    }
}

#pragma mark - Properties

- (NSArray *)entries { return self.internalEntries; }

- (void)addEntriesObject:(DMNEntry *)entry
{
    [self.internalEntries addObject:entry];
    
    [self saveToPersistentStorage];
}

- (void)removeEntriesObject:(DMNEntry *)entry
{
    [self.internalEntries removeObject:entry];
    
    [self saveToPersistentStorage];
}

@end

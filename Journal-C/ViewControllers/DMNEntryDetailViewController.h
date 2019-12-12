//
//  DMNEntryDetailViewController.h
//  Journal-C
//
//  Created by Chris Anderson on 12/5/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMNEntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DMNEntryDetailViewController : UIViewController

@property (nonatomic, strong) DMNEntry *entry;

@end

NS_ASSUME_NONNULL_END

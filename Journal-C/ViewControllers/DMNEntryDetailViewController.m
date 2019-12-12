//
//  DMNEntryDetailViewController.m
//  Journal-C
//
//  Created by Chris Anderson on 12/5/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import "DMNEntryDetailViewController.h"
#import "DMNEntryController.h"

@interface DMNEntryDetailViewController () <UITextFieldDelegate>

#pragma mark - Outlets

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *textTextView;

@end

@implementation DMNEntryDetailViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self updateViews];
}

#pragma mark - Class Methods

- (void)updateViews
{
    if (!self.entry) return;
    
    self.titleTextField.text = self.entry.title;
    self.textTextView.text = self.entry.text;
}

#pragma mark - Actions

- (IBAction)saveButtonTapped:(id)sender
{
    if (self.entry) {
        
        self.entry.title = self.titleTextField.text;
        self.entry.text = self.textTextView.text;
        self.entry.timestamp = [NSDate date];
        
    } else {
        
        DMNEntry *entry = [[DMNEntry alloc] initWithTitle:self.titleTextField.text text:self.textTextView.text timeStamp:[NSDate date]];
        
        [[DMNEntryController sharedController] addEntriesObject:entry];
        
        self.entry = entry;
    }

    [self.navigationController popViewControllerAnimated:true];

}

- (IBAction)clearButtonTapped:(id)sender
{
    self.titleTextField.text = @"";
    self.textTextView.text = @"";
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Properties

- (void)setEntry:(DMNEntry *)entry
{
    if (entry != _entry) {
        _entry = entry;
        [self updateViews];
    }
}

@end

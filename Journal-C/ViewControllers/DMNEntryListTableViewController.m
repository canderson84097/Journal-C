//
//  DMNEntryListTableViewController.m
//  Journal-C
//
//  Created by Chris Anderson on 12/5/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import "DMNEntryListTableViewController.h"
#import "DMNEntryDetailViewController.h"
#import "DMNEntryController.h"

@implementation DMNEntryListTableViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[DMNEntryController sharedController] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    DMNEntryController *entryController = [DMNEntryController sharedController];
    DMNEntry *entry = entryController.entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toDetailEntry"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        DMNEntry *entry = [DMNEntryController sharedController].entries[indexPath.row];
        
        DMNEntryDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}

@end

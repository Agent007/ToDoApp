//
//  ToDoTableViewController.m
//  ToDoApp
//
//  Created by Jeffrey Lam on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ToDoTableViewController.h"
#import "ToDo.h"
#import "TodoItemDetailViewController.h"
#import "CreateTodoItemViewController.h"


@implementation ToDoTableViewController

@synthesize todoDatabase = _todoDatabase;

- (void)setupFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ToDo"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"dueDate" ascending:YES]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.todoDatabase.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}

- (void)useDocument
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.todoDatabase.fileURL path]]) {
        // does not exist on disk, so create it
        [self.todoDatabase saveToURL:self.todoDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            [self setupFetchedResultsController];
        }];
    } else if (self.todoDatabase.documentState == UIDocumentStateClosed) {
        // exists on disk, but we need to open it
        [self.todoDatabase openWithCompletionHandler:^(BOOL success) {
            [self setupFetchedResultsController];
        }];
    } else if (self.todoDatabase.documentState == UIDocumentStateNormal) {
        // already open and ready to use
        [self setupFetchedResultsController];
    }
}

- (void)setTodoDatabase:(UIManagedDocument *)todoDatabase
{
    if (_todoDatabase != todoDatabase) {
        _todoDatabase = todoDatabase;
        [self useDocument];
    }
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.todoDatabase) {
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:@"ToDo Database"];
        self.todoDatabase = [[UIManagedDocument alloc] initWithFileURL:url];
    }
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ToDoListCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    ToDo *todo = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = todo.title;
    cell.detailTextLabel.text = [todo.dueDate description];
    // TODO display check mark for done tasks
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetailView"]) {
        TodoItemDetailViewController *dest = (TodoItemDetailViewController *) segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        dest.todo = [self.fetchedResultsController objectAtIndexPath:indexPath];
        dest.datasource = self;
    } else if ([[segue identifier] isEqualToString:@"addTodoItem"]) {
        CreateTodoItemViewController *vc = (CreateTodoItemViewController *) segue.destinationViewController;
        vc.datasource = self;
    }
}

- (void)synchronize
{
    [self.todoDatabase saveToURL:self.todoDatabase.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:^(BOOL success) {
        if (!success) {
            NSLog(@"unable to save"); // TODO maybe show an alert to user?
        }
    }];
}

@end

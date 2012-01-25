//
//  CreateTodoItemViewController.m
//  ToDoApp
//
//  Created by Jeff Lam on 1/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateTodoItemViewController.h"
#import "ToDo+Create.h"

@implementation CreateTodoItemViewController

@synthesize titleInput;
@synthesize dueDatePicker;
@synthesize datasource;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"save"]) {
        UIManagedDocument *managedDocument = datasource.todoDatabase;
        [ToDo todoWithTitle:titleInput.text andDueDate:dueDatePicker.date inManagedObjectContext:managedDocument.managedObjectContext];
        [datasource synchronize];
    }
}

#pragma mark - View lifecycle

- (void)viewDidUnload {
    self.titleInput = nil;
    self.dueDatePicker = nil;
    [super viewDidUnload];
}

@end

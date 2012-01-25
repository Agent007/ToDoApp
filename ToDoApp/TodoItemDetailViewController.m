//
//  TodoItemDetailViewController.m
//  ToDoApp
//
//  Created by Jeff Lam on 1/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TodoItemDetailViewController.h"
#import "ToDo.h"


@implementation TodoItemDetailViewController

@synthesize todo, titleLabel, dueDate, toggle, datasource;

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    titleLabel.text = todo.title;
    dueDate.text = [todo.dueDate description];
    toggle.selected = [self.todo.done boolValue];
}

// http://weheartgames.com/2009/06/simple-iphone-checkbox/
- (IBAction)toggleDone:(UIButton *)sender
{
    if (!self.todo.done) {
        toggle.selected = YES;
        self.todo.done = [NSNumber numberWithBool:YES];
    } else {
        toggle.selected = NO;
        self.todo.done = [NSNumber numberWithBool:NO];
    }
    [datasource synchronize];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"delete"]) {
        [datasource.todoDatabase.managedObjectContext deleteObject:todo];
        [datasource synchronize];
    }
}


- (void)viewDidUnload
{
    self.titleLabel = nil;
    self.dueDate = nil;
    self.toggle = nil;
    [super viewDidUnload];
}
                           
@end

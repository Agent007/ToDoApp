//
//  ToDo+Create.m
//  ToDoApp
//
//  Created by Jeffrey Lam on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ToDo+Create.h"

@implementation ToDo (Create)

+ (ToDo *)todoWithTitle:(NSString *)title andDueDate:(NSDate *)dueDate inManagedObjectContext:(NSManagedObjectContext *)context
{
    ToDo *todo = [NSEntityDescription insertNewObjectForEntityForName:@"ToDo"
                                               inManagedObjectContext:context];
    todo.title = title;
    todo.dueDate = dueDate;
    
    return todo;
}
@end

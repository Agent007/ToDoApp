//
//  ToDo+Create.h
//  ToDoApp
//
//  Created by Jeffrey Lam on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ToDo.h"

@interface ToDo (Create)

+ (ToDo *)todoWithTitle:(NSString *)title andDueDate:(NSDate *)dueDate inManagedObjectContext:(NSManagedObjectContext *)context;

@end

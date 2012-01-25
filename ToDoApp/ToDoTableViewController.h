//
//  ToDoTableViewController.h
//  ToDoApp
//
//  Created by Jeffrey Lam on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
#import "ToDoViewControllerDataSource.h"

@interface ToDoTableViewController : CoreDataTableViewController <ToDoViewControllerDataSource>

@end

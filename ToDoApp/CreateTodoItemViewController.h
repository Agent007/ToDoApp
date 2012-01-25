//
//  CreateTodoItemViewController.h
//  ToDoApp
//
//  Created by Jeff Lam on 1/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoViewControllerDataSource.h"

@interface CreateTodoItemViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDatePicker;
@property (strong, nonatomic) id <ToDoViewControllerDataSource> datasource;

@end

//
//  TodoItemDetailViewController.h
//  ToDoApp
//
//  Created by Jeff Lam on 1/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoViewControllerDataSource.h"

@class ToDo;

@interface TodoItemDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueDate;
@property (strong, nonatomic) ToDo *todo;
@property (weak, nonatomic) IBOutlet UIButton *toggle;
@property (weak, nonatomic) id <ToDoViewControllerDataSource> datasource;

@end

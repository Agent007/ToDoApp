//
//  ToDoViewControllerDataSource.h
//  ToDoApp
//
//  Created by Jeffrey Lam on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Todo.h"

@protocol ToDoViewControllerDataSource <NSObject>

@property (nonatomic, strong) UIManagedDocument *todoDatabase;

- (void)synchronize;

@end

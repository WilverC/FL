//
//  AppDelegate.h
//  FL
//
//  Created by Alberto Garcia on 24/01/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end


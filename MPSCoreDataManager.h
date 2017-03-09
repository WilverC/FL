//
//  MPSCoreDataManager.h
//  Seguros BBVA
//
//  Created by Juan Manuel on 4/11/16.
//  Copyright © 2016 Wave Community. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface MPSCoreDataManager : NSObject

/**
 * Returns an instance of CoreDataManager; Also you can use a call to "init" in order to retrieve the unique instance
 * @return CoreDataManager instance
 */
+(instancetype)buildCoreDataManager;

-(BOOL)commit;

-(BOOL)saveEntity:(NSManagedObject *)entity;

-(BOOL)deleteEntity:(NSManagedObject *)entity;

-(NSEntityDescription *)determineEntityDescriptionFromEntityName:(NSString *)entityName;

-(NSManagedObject *)generateEntityFromEntityDescription:(NSEntityDescription *)entityDescription;

-(NSManagedObject *)generateIndependentEntityFromEntityDescription:(NSEntityDescription *)entityDescription;

//Select * from <tabla>...
-(NSArray *)fetchObjectsForEntityDescription:(NSEntityDescription *)entityDescription;

//Select * from <tabla>...[where]...[sortby]
-(NSArray *)fetchObjectsForEntityDescription:(NSEntityDescription *)entityDescription
                                forPredicate:(NSPredicate *)predicate
                           andSortDescriptor:(NSArray *)sortDescriptors;

@end







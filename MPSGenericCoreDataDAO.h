//
//  MPSGenericCoreDataDAO.h
//  Seguros BBVA
//
//  Created by Juan Manuel on 4/11/16.
//  Copyright © 2016 Wave Community. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "MPSCoreDataManager.h"

typedef NS_ENUM(NSInteger, CoreDataPredicateType){
    CoreDataPredicateTypeAND,
    CoreDataPredicateTypeOR,
    CoreDataPredicateTypeNOT
};

typedef NS_ENUM(NSInteger, CoreDataEntity) {
    CoreDataEntityPerson,
    CoreDataEntityStore,
    CoreDataEntityDocument
};

@interface MPSGenericCoreDataDAO : NSObject

-(NSManagedObject *)generateInstanceForCoreDataEntity:(CoreDataEntity)entity;

-(NSManagedObject *)generateIndependentInstanceForCoreDataEntity:(CoreDataEntity)entity;

-(BOOL)saveEntity:(NSManagedObject *)entity;

-(BOOL)deleteEntity:(NSManagedObject *)entityToDelete;

-(BOOL)updateEntity:(NSManagedObject *)entity;

-(NSArray *)fetchAllEntitiesForCoreDataEntity:(CoreDataEntity)entity;

//-(NSManagedObject *)fetchEntityByID:(NSManagedObjectID *)idEntity;

-(NSArray *)fetchEntitiesWithWhereParam:(NSString *)whereParam
                      forCoreDataEntity:(CoreDataEntity)entity;

-(NSArray *)fetchEntitiesWithWhereParams:(NSArray *)whereParams
                        andPredicateType:(CoreDataPredicateType)predicateType
                       forCoreDataEntity:(CoreDataEntity)entity;

-(NSArray *)fetchEntitiesWithWhereParams:(NSArray *)whereParams
                         sortDescriptors:(NSArray *)sortDescriptors
                        andPredicateType:(CoreDataPredicateType)predicateType
                       forCoreDataEntity:(CoreDataEntity)entity;

-(NSManagedObject *)fetchEntityByIdentifier:(NSNumber *)identifier
                          forCoreDataEntity:(CoreDataEntity)coreDataEntity;

-(NSArray *)fetchEntitiesByDate:(NSDate *)date
              forCoreDataEntity:(CoreDataEntity)entity;

-(BOOL)persistChanges;

@end

//
//  MPSGenericCoreDataDAO.m
//  Seguros BBVA
//
//  Created by Juan Manuel on 4/11/16.
//  Copyright © 2016 Wave Community. All rights reserved.
//

#import "MPSGenericCoreDataDAO.h"
#import "MPSCoreDataManager.h"
#import "StoreEntity+CoreDataProperties.h"
#import "PersonEntity+CoreDataProperties.h"
#import "DocumentEntity+CoreDataProperties.h"

@interface MPSGenericCoreDataDAO()
@property (strong) MPSCoreDataManager *coreDataManager;
@end

@implementation MPSGenericCoreDataDAO

@synthesize coreDataManager;

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        self.coreDataManager = [MPSCoreDataManager buildCoreDataManager];
    }
    return self;
}

-(BOOL)persistChanges{
    
    BOOL result = [self.coreDataManager commit];
    return result;
    
}

-(NSManagedObject *)generateInstanceForCoreDataEntity:(CoreDataEntity)entity{
    
    return [self generateInstanceForCoreDataEntity:entity addToContext:YES];
    
}

-(NSManagedObject *)generateIndependentInstanceForCoreDataEntity:(CoreDataEntity)entity{
    
    return [self generateInstanceForCoreDataEntity:entity addToContext:NO];
    
}

-(NSManagedObject *)generateInstanceForCoreDataEntity:(CoreDataEntity)entity
                                         addToContext:(BOOL)addToContext{
    
    NSString *entityName = [self determineEntityNameForCoreDataEntity:entity];
    NSEntityDescription *entityDescription = [self.coreDataManager determineEntityDescriptionFromEntityName:entityName];
   
    NSManagedObject *managedObject = nil;
    
    if (addToContext) {
        managedObject = [self.coreDataManager generateEntityFromEntityDescription:entityDescription];
    } else {
        managedObject = [self.coreDataManager generateIndependentEntityFromEntityDescription:entityDescription];
    }
    
    return managedObject;
    
}

-(BOOL)saveEntity:(NSManagedObject *)entity{
    
    BOOL result = [self.coreDataManager saveEntity:entity];
    
    return result;
}

-(BOOL)deleteEntity:(NSManagedObject *)entityToDelete{
    
    BOOL result = [self.coreDataManager deleteEntity:entityToDelete];
    
    return result;
    
}

-(BOOL)updateEntity:(NSManagedObject *)entity{
    
    BOOL result = [self persistChanges];
    
    return result;
    
}

-(NSArray *)fetchAllEntitiesForCoreDataEntity:(CoreDataEntity)entity{
    
    NSArray *fetchedObjects = [self fetchEntitiesWithWhereParam:nil forCoreDataEntity:entity];
    
    return fetchedObjects;
    
}

//-(NSManagedObject *)fetchEntityByID:(NSManagedObjectID *)idEntity{
//
//    //    NSString *whereParam = [NSString stringWithFormat:@"objectID = \"%@\"", idEntity];
//    //    NSManagedObject *fotoFavorita = [_entityFactory fetchEntityFromModel:CoreDataEntityTypeFotoFavorita withWhereParam:whereParam];
//    @throw([NSException exceptionWithName:@"Method Not Supported" reason:@"The Method \"fetchEntityByID:\" not currently supported" userInfo:nil]);
//
//}

-(NSArray *)fetchEntitiesWithWhereParam:(NSString *)whereParam
                      forCoreDataEntity:(CoreDataEntity)entity{
    
    NSString *entityName = [self determineEntityNameForCoreDataEntity:entity];
    NSEntityDescription *entityDescription = [self.coreDataManager determineEntityDescriptionFromEntityName:entityName];
    
    NSArray *managedObjects = nil;
    
    NSPredicate *predicate = nil;
    
    if (whereParam != nil) {
        predicate = [NSPredicate predicateWithFormat:whereParam];
    }
    
    managedObjects = [self.coreDataManager fetchObjectsForEntityDescription:entityDescription forPredicate:predicate andSortDescriptor:nil];
    
    return managedObjects;
}

-(NSArray *)fetchEntitiesWithWhereParams:(NSArray *)whereParams andPredicateType:(CoreDataPredicateType)predicateType
                       forCoreDataEntity:(CoreDataEntity)entity{
    
    return [self fetchEntitiesWithWhereParams:whereParams sortDescriptors:nil andPredicateType:predicateType forCoreDataEntity:entity];
    
}

-(NSArray *)fetchEntitiesWithWhereParams:(NSArray *)whereParams sortDescriptors:(NSArray *)sortDescriptors
                        andPredicateType:(CoreDataPredicateType)predicateType forCoreDataEntity:(CoreDataEntity)entity{
    
    NSArray *managedObjects = nil;
    
    if (whereParams != nil) {
        
        NSMutableArray *predicates = [[NSMutableArray alloc] init];
        
        for (NSString *param in whereParams) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:param];
            [predicates addObject:predicate];
            predicate = nil;
        }
        
        if (predicates.count > 0) {
            
            NSPredicate *compoundPredicate = nil;
            
            switch (predicateType) {
                case CoreDataPredicateTypeAND:
                    
                    compoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:predicates];
                    
                    break;
                    
                case CoreDataPredicateTypeOR:
                    
                    compoundPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
                    
                    break;
                    
                case CoreDataPredicateTypeNOT:
                    
                    @throw([NSException exceptionWithName:@"Predicate Type Not Supported" reason:@"The \"PredicateTypeNOT\" is not currently supported" userInfo:nil]);
                    
                    break;
                    
                default:
                    break;
            }
            
            if (compoundPredicate != nil) {
                
                NSString *entityName = [self determineEntityNameForCoreDataEntity:entity];
                
                NSEntityDescription *entityDescription = [self.coreDataManager determineEntityDescriptionFromEntityName:entityName];
                
                managedObjects = [self.coreDataManager fetchObjectsForEntityDescription:entityDescription forPredicate:compoundPredicate andSortDescriptor:sortDescriptors];
                
            } else {
                
                managedObjects = [self fetchAllEntitiesForCoreDataEntity:entity];
                
            }
        } else  {
            
            NSString *entityName = [self determineEntityNameForCoreDataEntity:entity];
            
            NSEntityDescription *entityDescription = [self.coreDataManager determineEntityDescriptionFromEntityName:entityName];
            
            managedObjects = [self.coreDataManager fetchObjectsForEntityDescription:entityDescription forPredicate:nil andSortDescriptor:sortDescriptors];
            
        }
        
    } else {
        
        managedObjects = [self fetchAllEntitiesForCoreDataEntity:entity];
        
    }
    
    return managedObjects;
    
}

-(NSManagedObject *)fetchEntityByIdentifier:(NSNumber *)identifier forCoreDataEntity:(CoreDataEntity)coreDataEntity{
    
    NSString *whereParam = [NSString stringWithFormat:@"identifier = %@", identifier];
    
    NSArray *objectResult = [self fetchEntitiesWithWhereParam:whereParam forCoreDataEntity:coreDataEntity];
    
    NSManagedObject *singleResult = nil;
    
    if (objectResult.count > 0) {
        
        singleResult = [objectResult lastObject];
        
    }
    
    return singleResult;
}

-(NSArray *)fetchEntitiesByDate:(NSDate *)date forCoreDataEntity:(CoreDataEntity)entity{
    
    //    if (entity == CoreDataEntityCotizacion || entity == CoreDataEntityOrdenCompra) {
    
    NSString *entityName = [self determineEntityNameForCoreDataEntity:entity];
    NSEntityDescription *entityDescription = [self.coreDataManager determineEntityDescriptionFromEntityName:entityName];
    
    NSArray *managedObjects = nil;
    
    if (date != nil) {
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"fecha = %@", date];
        managedObjects = [self.coreDataManager fetchObjectsForEntityDescription:entityDescription forPredicate:predicate andSortDescriptor:nil];
        
    } else {
        
        managedObjects = [self fetchAllEntitiesForCoreDataEntity:entity];
    }
    
    return managedObjects;
    
    //} else {
    //        @throw([NSException exceptionWithName:@"Method Not Supported For Entities Different To CoreDataEntityCotizacion Or CoreDataEntityOrdenCompra" reason:@"The Method \"fetchEntitiesByDate:forCoreDataEntity:\" not currently supported" userInfo:nil]);
    //        //        return nil;
    //    }
}

-(NSString *)determineEntityNameForCoreDataEntity:(CoreDataEntity)entity{
    
    NSString *entityName = nil;
    
    switch (entity) {
        case CoreDataEntityStore:
            entityName = NSStringFromClass([StoreEntity class]);
            break;
            
        case CoreDataEntityPerson:
            entityName = NSStringFromClass([PersonEntity class]);
            break;
        
        case CoreDataEntityDocument:
            entityName = NSStringFromClass([DocumentEntity class]);
            break;
            
        default:
            break;
    }
    
    return entityName;
}

@end

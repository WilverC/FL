//
//  MPSCoreDataManager.m
//  Seguros BBVA
//
//  Created by Juan Manuel on 4/11/16.
//  Copyright © 2016 Wave Community. All rights reserved.
//

#import "MPSCoreDataManager.h"

@interface MPSCoreDataManager ()
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end

@implementation MPSCoreDataManager{
    NSManagedObjectModel *_managedObjectModel;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
}

static NSString *dataBaseName = @"CoreData.sqlite";

#pragma Singleton implementation
static MPSCoreDataManager *instance = nil;

+(instancetype)buildCoreDataManager{
    
    @synchronized(self){
        if (instance == nil) {
            instance = [[MPSCoreDataManager alloc] initForSingleton];
        }
    }
    
    return instance;
}

- (instancetype)initForSingleton
{
    self = [super init];
    if (self != nil) {
        //Nueva Instancia
    }
    return self;
}

- (instancetype)init
{
    return [[self class] buildCoreDataManager];
}

#pragma mark Basic CRUD Methods

-(BOOL)commit{
    
    NSError *error = nil;
    BOOL result;
    
    if([self.managedObjectContext hasChanges]){
        if([self.managedObjectContext save:&error]){
            
            NSLog(@"CoreDataManager Contexto Salvado");
            result = YES;
            
        } else {
            
            NSLog(@"CoreDataManager Error: %@", [error localizedDescription]);
            result = NO;
            
        }
    } else {
        
        NSLog(@"CoreDataManager No Hay Cambios");
        result = NO;
        
    }
    
    return result;
    
}

-(BOOL)saveEntity:(NSManagedObject *)entity{
    
    //  In case of multiple object generation, but only want to save selected ones element,
    //  should be neccesary to create ManagedObjects without MOC and then insert them to one when save
    if (entity.managedObjectContext == nil) {
        [self.managedObjectContext insertObject:entity];
    }
    
    return [self commit];
    
}

-(BOOL)deleteEntity:(NSManagedObject *)entity{
    
    [self.managedObjectContext deleteObject:entity];
    
    return [self commit];
    
}

-(NSManagedObject *)generateEntityFromEntityDescription:(NSEntityDescription *)entityDescription{
    
    NSManagedObject *managedObject = [[NSManagedObject alloc] initWithEntity:entityDescription
                                              insertIntoManagedObjectContext:self.managedObjectContext];
    
    return managedObject;
    
}

-(NSManagedObject *)generateIndependentEntityFromEntityDescription:(NSEntityDescription *)entityDescription{
    
    NSManagedObject *managedObject = [[NSManagedObject alloc] initWithEntity:entityDescription
                                              insertIntoManagedObjectContext:nil];
    
    return managedObject;
    
}

-(NSEntityDescription *)determineEntityDescriptionFromEntityName:(NSString *)entityName{
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:entityName
                                                         inManagedObjectContext:self.managedObjectContext];
    return entityDescription;
    
}

-(NSArray *)fetchObjectsForEntityDescription:(NSEntityDescription *)entityDescription{
    
    return [self fetchObjectsForEntityDescription:entityDescription
                                     forPredicate:nil
                                andSortDescriptor:nil];
    
}

-(NSArray *)fetchObjectsForEntityDescription:(NSEntityDescription *)entityDescription
                                forPredicate:(NSPredicate *)predicate
                           andSortDescriptor:(NSArray *)sortDescriptors{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDescription];
    
    if (predicate != nil) {
        [fetchRequest setPredicate:predicate];
    }
    
    if (sortDescriptors != nil) {
        [fetchRequest setSortDescriptors:sortDescriptors];
    }
    
    
    return [self performFetchRequest:fetchRequest];
}

-(NSArray *)performFetchRequest:(NSFetchRequest *)fetchRequest{
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error != nil) {
        
        NSLog(@"CORE DATA MANAGER ERROR: -> %@", error.localizedDescription);
        
    }
    
    return fetchedObjects;
}

#pragma mark CoreData Configuration
-(NSManagedObjectContext *)managedObjectContext{
    
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _managedObjectContext;
}

-(NSManagedObjectModel *)managedObjectModel{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return _managedObjectModel;
}

-(NSPersistentStoreCoordinator *)persistentStoreCoordinator{
    
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [NSURL fileURLWithPath:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:dataBaseName]];
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    NSError *error = nil;
    
    NSPersistentStore *persistenceStore = [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                                    configuration:nil
                                                                                              URL:storeURL
                                                                                          options:nil
                                                                                            error:&error];
    
    if (persistenceStore != nil && error == nil) {
        NSLog(@"Instancia de Base de datos inicializada exitosamente");
    } else {
        NSLog(@"Hubo un error en la cración de la base de datos %@", [error userInfo]);
    }
    
    return _persistentStoreCoordinator;
}

-(NSString *)applicationDocumentsDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


@end

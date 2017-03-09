//
//  EntityVacante+CoreDataProperties.m
//  FL
//
//  Created by CIC-IPN-E3 on 08/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "EntityVacante+CoreDataProperties.h"

@implementation EntityVacante (CoreDataProperties)

+ (NSFetchRequest<EntityVacante *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EntityVacante"];
}

@dynamic idVacante;
@dynamic idEmpresa;
@dynamic vacante;
@dynamic salario;
@dynamic requisitos;

@end

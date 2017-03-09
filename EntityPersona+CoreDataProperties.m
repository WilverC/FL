//
//  EntityPersona+CoreDataProperties.m
//  FL
//
//  Created by CIC-IPN-E3 on 08/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "EntityPersona+CoreDataProperties.h"

@implementation EntityPersona (CoreDataProperties)

+ (NSFetchRequest<EntityPersona *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EntityPersona"];
}

@dynamic apellido1;
@dynamic apellido2;
@dynamic calle;
@dynamic correo;
@dynamic estado;
@dynamic fechaNac;
@dynamic idCurriculum;
@dynamic idPersona;
@dynamic nombre1;
@dynamic nombre2;
@dynamic numExt;
@dynamic numInt;
@dynamic pais;
@dynamic rfc;
@dynamic telefono;

@end

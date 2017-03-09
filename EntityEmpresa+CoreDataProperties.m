//
//  EntityEmpresa+CoreDataProperties.m
//  FL
//
//  Created by CIC-IPN-E3 on 08/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "EntityEmpresa+CoreDataProperties.h"

@implementation EntityEmpresa (CoreDataProperties)

+ (NSFetchRequest<EntityEmpresa *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EntityEmpresa"];
}

@dynamic calle;
@dynamic colonia;
@dynamic contrasenia;
@dynamic correoCompania;
@dynamic estado;
@dynamic idEmpresa;
@dynamic idVacante;
@dynamic municipioDeleg;
@dynamic nomUsuario;
@dynamic numExt;
@dynamic numInt;
@dynamic pais;
@dynamic personaEncargada;
@dynamic razonSocial;
@dynamic telefono;

@end

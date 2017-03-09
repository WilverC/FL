//
//  EntityEmpresa+CoreDataProperties.h
//  FL
//
//  Created by CIC-IPN-E3 on 08/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "EntityEmpresa+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EntityEmpresa (CoreDataProperties)

+ (NSFetchRequest<EntityEmpresa *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *calle;
@property (nullable, nonatomic, copy) NSString *colonia;
@property (nullable, nonatomic, copy) NSString *contrasenia;
@property (nullable, nonatomic, copy) NSString *correoCompania;
@property (nullable, nonatomic, copy) NSString *estado;
@property (nonatomic) int32_t idEmpresa;
@property (nonatomic) int32_t idVacante;
@property (nullable, nonatomic, copy) NSString *municipioDeleg;
@property (nullable, nonatomic, copy) NSString *nomUsuario;
@property (nonatomic) int32_t numExt;
@property (nonatomic) int32_t numInt;
@property (nullable, nonatomic, copy) NSString *pais;
@property (nullable, nonatomic, copy) NSString *personaEncargada;
@property (nullable, nonatomic, copy) NSString *razonSocial;
@property (nonatomic) int64_t telefono;

@end

NS_ASSUME_NONNULL_END

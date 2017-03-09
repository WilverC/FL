//
//  EntityPersona+CoreDataProperties.h
//  FL
//
//  Created by CIC-IPN-E3 on 08/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "EntityPersona+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EntityPersona (CoreDataProperties)

+ (NSFetchRequest<EntityPersona *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *apellido1;
@property (nullable, nonatomic, copy) NSString *apellido2;
@property (nullable, nonatomic, copy) NSString *calle;
@property (nullable, nonatomic, copy) NSString *correo;
@property (nullable, nonatomic, copy) NSString *estado;
@property (nullable, nonatomic, copy) NSDate *fechaNac;
@property (nonatomic) int32_t idCurriculum;
@property (nonatomic) int32_t idPersona;
@property (nullable, nonatomic, copy) NSString *nombre1;
@property (nullable, nonatomic, copy) NSString *nombre2;
@property (nonatomic) int32_t numExt;
@property (nonatomic) int32_t numInt;
@property (nullable, nonatomic, copy) NSString *pais;
@property (nullable, nonatomic, copy) NSString *rfc;
@property (nonatomic) int64_t telefono;

@end

NS_ASSUME_NONNULL_END

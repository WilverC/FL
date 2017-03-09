//
//  EntityVacante+CoreDataProperties.h
//  FL
//
//  Created by CIC-IPN-E3 on 08/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "EntityVacante+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EntityVacante (CoreDataProperties)

+ (NSFetchRequest<EntityVacante *> *)fetchRequest;

@property (nonatomic) int16_t idVacante;
@property (nonatomic) int16_t idEmpresa;
@property (nullable, nonatomic, copy) NSString *vacante;
@property (nonatomic) double salario;
@property (nullable, nonatomic, copy) NSString *requisitos;

@end

NS_ASSUME_NONNULL_END

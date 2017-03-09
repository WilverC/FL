//
//  EntityIdioma+CoreDataProperties.h
//  FL
//
//  Created by CIC-IPN-E3 on 08/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "EntityIdioma+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EntityIdioma (CoreDataProperties)

+ (NSFetchRequest<EntityIdioma *> *)fetchRequest;

@property (nonatomic) int16_t iDIdioma;
@property (nonatomic) int16_t iDProfesional;
@property (nullable, nonatomic, copy) NSString *idioma;
@property (nonatomic) int64_t dominio;

@end

NS_ASSUME_NONNULL_END

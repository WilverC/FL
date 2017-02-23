//
//  Persona.h
//  FL
//
//  Created by CIC-IPN-E3 on 21/02/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Usuario.h"

@interface Persona : Usuario
//Atributos necesarios para la implementacion de la base de datos a la hora de actualiza y mandarlo al viewController del usuario

@property (nonatomic,strong)NSString *nombre1;
@property (nonatomic,strong)NSString *nombre2;
@property (nonatomic,strong)NSString *apellido1;
@property (nonatomic,strong)NSString *apellido2;
@property (nonatomic,strong)NSDate *fechaNac;

//metodos de creacion de datos y manipulacion de ellos

@end

//
//  Persona.h
//  FL
//
//  Created by CIC-IPN-E3 on 21/02/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Persona : NSObject
//Atributos necesarios para la implementacion de la base de datos a la hora de actualiza y mandarlo al viewController del usuario

@property (nonatomic,strong)NSString *nombre1;
@property (nonatomic,strong)NSString *nombre2;
@property (nonatomic,strong)NSString *apellido1;
@property (nonatomic,strong)NSString *apellido2;
@property (nonatomic,strong)NSString *correo;
@property (nonatomic,strong)NSString *pais;
@property (nonatomic,strong)NSString *estado;
@property (nonatomic,strong)NSString *muniDel;
@property (nonatomic,strong)NSString *colonia;
@property (nonatomic,strong)NSString *calle;
@property (nonatomic,assign)int numExt;
@property (nonatomic,assign)int numInt;
@property (nonatomic,assign)int telefono;
@property (nonatomic,strong)NSDate *fechaNac;

//metodos de creacion de datos y manipulacion de ellos

@end

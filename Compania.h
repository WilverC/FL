//
//  Compania.h
//  FL
//
//  Created by CIC-IPN-E3 on 21/02/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Usuario.h"

@interface Compania : Usuario
//Atributos necesarios para lamanipulacion de la base de datos de la compania
@property (nonatomic,strong) NSString *razonSocial;
@property (nonatomic,strong) NSString *personaEncargada;
@property (nonatomic,strong) NSString *nomUsuario;
@property (nonatomic,strong) NSString *contrasenia;
//metodos de solicitud de datos en la base para si posterior visualizacion en el ViewController

@end

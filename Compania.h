//
//  Compania.h
//  FL
//
//  Created by CIC-IPN-E3 on 21/02/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Compania : NSObject
//Atributos necesarios para lamanipulacion de la base de datos de la compania
@property (nonatomic,strong) NSString *razonSocial;
@property (nonatomic,strong) NSString *personaEncargada;
@property (nonatomic,strong) NSString *nomUsuario;
@property (nonatomic,strong) NSString *contrasenia;
@property (nonatomic,strong) NSString *correoCompania;
@property (nonatomic,strong) NSString *pais;
@property (nonatomic,strong) NSString *estado;
@property (nonatomic,strong) NSString *muniDel;
@property (nonatomic,strong) NSString *colonia;
@property (nonatomic,strong) NSString *calle;
@property (nonatomic,assign) int numExt;
@property (nonatomic,assign) int numInt;
@property (nonatomic,assign) int telefono;

//metodos de solicitud de datos en la base para si posterior visualizacion en el ViewController

@end

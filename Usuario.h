//
//  Usuario.h
//  FL
//
//  Created by CIC-IPN-E3 on 21/02/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject
//variables a heredar
@property (nonatomic,strong) NSString *nomUsuario;
@property (nonatomic,strong) NSString *contrasenia;
@property (nonatomic,strong) NSString *correo;
@property (nonatomic,assign) int *telefono;
@property (nonatomic,strong) NSString *estado;
@property (nonatomic,strong) NSString *calle;
@property (nonatomic,assign) int numExt;
@property (nonatomic,assign) int numInt;
@property (nonatomic,assign) int cp;

@end

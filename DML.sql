-- Inserts

    -- gama
    {
            INSERT INTO gama_producto VALUES (NULL,'Herbaceas','Plantas decorativas',NULL,NULL);
            INSERT INTO gama_producto VALUES (NULL,'Herramientas','Herramientas para todo tipo de acción',NULL,NULL);
            INSERT INTO gama_producto VALUES (NULL,'Aromáticas','Plantas aromáticas',NULL,NULL);
            INSERT INTO gama_producto VALUES (NULL,'Frutales','Árboles de producción frutal',NULL,NULL);
            INSERT INTO gama_producto VALUES (NULL,'Ornamentales','Plantas vistosas para decoración de jardín',NULL,NULL);
    }

    -- pais
    {
        INSERT INTO pais (nombre) VALUES ('USA');
        INSERT INTO pais (nombre) VALUES ('España');
        INSERT INTO pais (nombre) VALUES ('Francia');
        INSERT INTO pais (nombre) VALUES ('Australia');
        INSERT INTO pais (nombre) VALUES ('UK (Reino Unido)');
    }

    -- estado
    {
        INSERT INTO estado (nombre_estado) VALUES ('Entregado');
        INSERT INTO estado (nombre_estado) VALUES ('Rechazado');
        INSERT INTO estado (nombre_estado) VALUES ('Pendiente');
    }

    -- region
    {
        INSERT INTO region (id_region, nombre, codigo_pais) VALUES 
        (NULL, 'Comunidad Autónoma de Madrid', 2), 
        (NULL, 'Comunidad Autónoma de Cataluña', 2), (NULL, 'Floridad', 1),
        (NULL, 'Región de Île-de-France', 3), (NULL, 'Nueva Gales del Sur', 4), 
        (NULL, 'London', 5);
    }

    -- ciudad
    {
        INSERT INTO ciudad (id_ciudad, nombre, codigo_region)
        VALUES (NULL, "Madrid", 1);

        INSERT INTO ciudad (id_ciudad, nombre, codigo_region)
        VALUES (NULL, "Fuenlabrada", 1);

        INSERT INTO ciudad (id_ciudad, nombre, codigo_region)
        VALUES (NULL, "Alcalá de Henares", 1);

        INSERT INTO ciudad (id_ciudad, nombre, codigo_region)
        VALUES (NULL, "Barcelona", 2);

        INSERT INTO ciudad (id_ciudad, nombre, codigo_region)
        VALUES (NULL, "Girona", 2);

        INSERT INTO ciudad (id_ciudad, nombre, codigo_region)
        VALUES (NULL, "París", 3);

        INSERT INTO ciudad (id_ciudad, nombre, codigo_region)
        VALUES (NULL, "Sídney", 4);

        INSERT INTO ciudad (id_ciudad, nombre, codigo_region)
        VALUES (NULL, "London", 5);
    }

    -- metodo pago
    {
        INSERT INTO metodo_pago (nombre_metodo) VALUES ('PayPal');
        INSERT INTO metodo_pago (nombre_metodo) VALUES ('Transferencia');
        INSERT INTO metodo_pago (nombre_metodo) VALUES ('Cheque');
    }

    -- dimensiones
    {
        INSERT INTO dimension (alto, ancho, largo)
        VALUES (5.5, 3.7, 1.7);  -- Insert 1: Small dimensions

        INSERT INTO dimension (alto, ancho, largo)
        VALUES (7.0, 2.5, 1.3);  -- Insert 2: Medium dimensions

        INSERT INTO dimension (alto, ancho, largo)
        VALUES (15.0, 1.0, 4.0);
    }

    -- puesto
    {
        INSERT INTO cargo (nombre_cargo)
        VALUES ('Director General');

        INSERT INTO cargo (nombre_cargo)
        VALUES ('Subdirector Marketing');

        INSERT INTO cargo (nombre_cargo)
        VALUES ('Subdirector Ventas');

        INSERT INTO cargo (nombre_cargo)
        VALUES ('Secretaria');

        INSERT INTO cargo (nombre_cargo)
        VALUES ('Representante Ventas');

        INSERT INTO cargo (nombre_cargo)
        VALUES ('Director Oficina');
    }

    --tipo telefono
    {
        INSERT INTO tipo_telefono (descripcion)
        VALUES ('Móvil');

        INSERT INTO tipo_telefono (descripcion)
        VALUES ('Fijo');

        INSERT INTO tipo_telefono (descripcion)
        VALUES ('Fax');
    }

    -- direccion
    {
        INSERT INTO direccion (linea_direccion1, linea_direccion2, codigo_ciudad_d)
        VALUES ('Calle A, 456', NULL, 1);

        INSERT INTO direccion (linea_direccion1, linea_direccion2, codigo_ciudad_d)
        VALUES ('Avenida de la Libertad, 1123', 'Piso 7, Puerta 1', 2);

        INSERT INTO direccion (linea_direccion1, linea_direccion2, codigo_ciudad_d)
        VALUES ('Plaza de España, 789', NULL, 1);

        INSERT INTO direccion (linea_direccion1, linea_direccion2, codigo_ciudad_d)
        VALUES ('Paseo del Mar, 1234', NULL, 1);

        INSERT INTO direccion (linea_direccion1, linea_direccion2, codigo_ciudad_d)
        VALUES ('Calle del Sol, 2020', 'Urbanización Los Rosales', 2);

        INSERT INTO direccion (linea_direccion1, linea_direccion2, codigo_ciudad_d)
        VALUES ('Carrer de Ferran, 1', NULL, 4); -- Barcelona address

        INSERT INTO direccion (linea_direccion1, linea_direccion2, codigo_ciudad_d)
        VALUES ('Avinguda Diagonal, 731', 'Planta 12', 4); -- Barcelona address

        INSERT INTO direccion (linea_direccion1, linea_direccion2, codigo_ciudad_d)
        VALUES ('Plaza Real, 10', NULL, 5); -- Barcelona address

        INSERT INTO direccion (linea_direccion1, linea_direccion2, codigo_ciudad_d)
        VALUES ('Carrera Ballesteries, 4', NULL, 2); -- Girona address

        INSERT INTO direccion (linea_direccion1, linea_direccion2, codigo_ciudad_d)
        VALUES ('Paseo Arqueológico, 2', NULL, 1); -- Girona address
    }

    -- proveedores
    {
        INSERT INTO proveedor (nombre, codigo_direccion_p)
        VALUES ('Acme Corporation', 1);

        INSERT INTO proveedor (nombre, codigo_direccion_p)
        VALUES ('Global Tech Solutions', 5);

        INSERT INTO proveedor (nombre, codigo_direccion_p)
        VALUES ('Ikea', 6);

        INSERT INTO proveedor (nombre, codigo_direccion_p)
        VALUES ('Exotic Imports', 10);
    }

    -- oficina
    {
        INSERT INTO oficina (codigo_direccion_o)
        VALUES (1);

        INSERT INTO oficina (codigo_direccion_o)
        VALUES (2);

        INSERT INTO oficina (codigo_direccion_o)
        VALUES (7);

        INSERT INTO oficina (codigo_direccion_o)
        VALUES (10);
    }

    -- empleado
    {
    -- oficina madrid
        INSERT INTO empleado (nombre_empleado, apellido1, apellido2, extension, email, id_jefe, codigo_oficina, codigo_cargo)
        VALUES ('Laura', 'Galvis', 'López', '54321', 'Laura.galvis@empresa.com', NULL, NULL, 1);

        INSERT INTO empleado (nombre_empleado, apellido1, apellido2, extension, email, id_jefe, codigo_oficina, codigo_cargo)
        VALUES ('Juan', 'Pérez', 'Gómez', '12345', 'juan.perez@empresa.com', 1, 1, 6);

        INSERT INTO empleado (nombre_empleado, apellido1, apellido2, extension, email, id_jefe, codigo_oficina, codigo_cargo)
        VALUES ('Pedro', 'Páramo', 'Sánchez', '67890', 'pedro.paramo@empresa.com', 2, 1, 5);
        
        INSERT INTO empleado (nombre_empleado, apellido1, apellido2, extension, email, id_jefe, codigo_oficina, codigo_cargo)
        VALUES ('Andrea', 'Martínez', 'Fernández', '98765', 'andre.martinez@empresa.com', 2, 1, 5);

        INSERT INTO empleado (nombre_empleado, apellido1, apellido2, extension, email, id_jefe, codigo_oficina, codigo_cargo)
        VALUES ('José', 'Meneses', 'Marin', '98765', 'jose.meneses@empresa.com', 2, 1, 5);

        -- oficina de fuenlabrada
        INSERT INTO empleado (nombre_empleado, apellido1, apellido2, extension, email, id_jefe, codigo_oficina, codigo_cargo)
        VALUES ('Esteban', 'Bayona', NULL, '45321', 'EstebanBayona@empresa.com', NULL, NULL, 1);

        INSERT INTO empleado (nombre_empleado, apellido1, apellido2, extension, email, id_jefe, codigo_oficina, codigo_cargo)
        VALUES ('Angie', 'Suárez', NULL, '12345', 'Angie.suarez@ejemplo.com', 6, 2, 6);

        INSERT INTO empleado (nombre_empleado, apellido1, apellido2, extension, email, id_jefe, codigo_oficina, codigo_cargo)
        VALUES ('Luisa', 'Luque', NULL, '67890', 'l.luque@ejemplo.com', 7, 2, 5);
        
        INSERT INTO empleado (nombre_empleado, apellido1, apellido2, extension, email, id_jefe, codigo_oficina, codigo_cargo)
        VALUES ('Santiago', 'Mayorga', NULL, '98765', 's.mayorga@ejemplo.com', 7, 2, 5);

        INSERT INTO empleado (nombre_empleado, apellido1, apellido2, extension, email, id_jefe, codigo_oficina, codigo_cargo)
        VALUES ('Andrey', 'Galvis', NULL, '98765', 'a.galvis@ejemplo.com', 7, 2, 5);
    }

    -- cliente
    {
        INSERT INTO cliente (nombre_cliente, limite_credito, codigo_ciudad_c, codigo_direccion_c, codigo_empleado_rep_ventas)
        VALUES ('David Ramírez', 5000.00, 1, 10, 3);

        INSERT INTO cliente (nombre_cliente, limite_credito, codigo_ciudad_c, codigo_direccion_c, codigo_empleado_rep_ventas)
        VALUES ('Michelle Amaya', 8000.00, 1, 4, 4);

        INSERT INTO cliente (nombre_cliente, limite_credito, codigo_ciudad_c, codigo_direccion_c, codigo_empleado_rep_ventas)
        VALUES ('Fernando José Dominguez', 10000.00, 1, 3, 4);

        INSERT INTO cliente (nombre_cliente, limite_credito, codigo_ciudad_c, codigo_direccion_c, codigo_empleado_rep_ventas)
        VALUES ('Isabel Gutiérrez', 6000.00, 2, 9, 10);

        INSERT INTO cliente (nombre_cliente, limite_credito, codigo_ciudad_c, codigo_direccion_c, codigo_empleado_rep_ventas)
        VALUES ('Gabriela Doncel', 7000.00, 2, 5, 8);

        INSERT INTO cliente (nombre_cliente, limite_credito, codigo_ciudad_c, codigo_direccion_c, codigo_empleado_rep_ventas)
        VALUES ('Verónica Alcócer', 9000.00, 2, 2, 8);
        -- empleado null
        INSERT INTO cliente (nombre_cliente, limite_credito, codigo_ciudad_c, codigo_direccion_c, codigo_empleado_rep_ventas)
        VALUES ('Vicente Fernández', 7500.00, 4, 7, NULL);

        INSERT INTO cliente (nombre_cliente, limite_credito, codigo_ciudad_c, codigo_direccion_c, codigo_empleado_rep_ventas)
        VALUES ('Juan Ramírez', 8500.00, 4, 6, NULL);
    }

    -- contacto
    {
        INSERT INTO contacto (id_contacto, nombre_contacto, apellido_contacto, email_contacto, codigo_cliente_co) VALUES 
        (NULL, 'Roberto', 'Martínez', 'roberto@gmail.com', 1),
        (NULL, 'Alejandra', 'López', 'alejandraL@gmail.com', 2);
    }

    -- telefono
    {
        INSERT INTO telefono (numero, prefijo, codigo_cliente_te, codigo_tipo_telefono, codigo_oficina_te, codigo_proveedor_te)
        VALUES (3123456789, 31, NULL, 1, 1, NULL);

        INSERT INTO telefono (numero, prefijo, codigo_cliente_te, codigo_tipo_telefono, codigo_oficina_te, codigo_proveedor_te)
        VALUES (5712345678, 57, NULL, 2, 1, NULL);

        INSERT INTO telefono (numero, prefijo, codigo_cliente_te, codigo_tipo_telefono, codigo_oficina_te, codigo_proveedor_te)
        VALUES (4123456789, 4, NULL, 2, 2, NULL);
    }

    -- pago
    {
        INSERT INTO pago (fecha_pago, total, codigo_metodo_pago, codigo_cliente_pa)
        VALUES ('2024-04-01', 150.00, 1, 1);

        -- Registro 2
        INSERT INTO pago (fecha_pago, total, codigo_metodo_pago, codigo_cliente_pa)
        VALUES ('2024-04-02', 200.00, 1, 2);

        -- Registro 3
        INSERT INTO pago (fecha_pago, total, codigo_metodo_pago, codigo_cliente_pa)
        VALUES ('2024-04-03', 300.00, 1, 3);

        -- Registro 4
        INSERT INTO pago (fecha_pago, total, codigo_metodo_pago, codigo_cliente_pa)
        VALUES ('2024-04-04', 250.00, 2, 1);

        -- Registro 5
        INSERT INTO pago (fecha_pago, total, codigo_metodo_pago, codigo_cliente_pa)
        VALUES ('2024-04-05', 180.00, 2, 3);

        -- Registro 6
        INSERT INTO pago (fecha_pago, total, codigo_metodo_pago, codigo_cliente_pa)
        VALUES ('2008-02-28', 150.00, 1, 1);

        -- Registro 7
        INSERT INTO pago (fecha_pago, total, codigo_metodo_pago, codigo_cliente_pa)
        VALUES ('2008-11-02', 200.00, 1, 2);

        -- Registro 8
        INSERT INTO pago (fecha_pago, total, codigo_metodo_pago, codigo_cliente_pa)
        VALUES ('2009-06-21', 300.00, 1, 3);
    }

    -- pedido
    {
        -- Registro 1
        INSERT INTO pedido (fecha_pedido, fecha_esperado, fecha_entrega, comentario, codigo_client_pedido, codigo_estado_pedido)
        VALUES ('2024-04-01', '2024-04-05', NULL, 'Pedido urgente', 1, 1);

        -- Registro 2
        INSERT INTO pedido (fecha_pedido, fecha_esperado, fecha_entrega, comentario, codigo_client_pedido, codigo_estado_pedido)
        VALUES ('2024-04-02', '2024-04-06', '2024-04-06', NULL, 1, 1);

        -- Registro 3
        INSERT INTO pedido (fecha_pedido, fecha_esperado, fecha_entrega, comentario, codigo_client_pedido, codigo_estado_pedido)
        VALUES ('2024-04-03', '2024-04-07', '2024-04-07', 'Pedido regular', 1, 2);

        -- Registro 4
        INSERT INTO pedido (fecha_pedido, fecha_esperado, fecha_entrega, comentario, codigo_client_pedido, codigo_estado_pedido)
        VALUES ('2024-04-04', '2024-04-08', '2024-04-12', NULL, 1, 3);

        -- Registro 5
        INSERT INTO pedido (fecha_pedido, fecha_esperado, fecha_entrega, comentario, codigo_client_pedido, codigo_estado_pedido)
        VALUES ('2024-04-05', '2024-04-09', '2024-04-09', 'Pedido especial', 3, 1);

        -- Registro 6
        INSERT INTO pedido (fecha_pedido, fecha_esperado, fecha_entrega, comentario, codigo_client_pedido, codigo_estado_pedido)
        VALUES ('2024-04-06', '2024-04-10', '2024-04-11', NULL, 3, 1);

        -- Registro 7
        INSERT INTO pedido (fecha_pedido, fecha_esperado, fecha_entrega, comentario, codigo_client_pedido, codigo_estado_pedido)
        VALUES ('2024-04-07', '2024-04-11', '2024-04-11', 'Pedido urgente', 3, 2);

        -- Registro 8
        INSERT INTO pedido (fecha_pedido, fecha_esperado, fecha_entrega, comentario, codigo_client_pedido, codigo_estado_pedido)
        VALUES ('2024-04-08', '2024-04-12', '2024-04-15', NULL, 3, 3);

        -- Registro 9
        INSERT INTO pedido (fecha_pedido, fecha_esperado, fecha_entrega, comentario, codigo_client_pedido, codigo_estado_pedido)
        VALUES ('2024-04-09', '2024-04-13', '2024-04-15', 'Pedido regular', 2, 1);

        -- Registro 10
        INSERT INTO pedido (fecha_pedido, fecha_esperado, fecha_entrega, comentario, codigo_client_pedido, codigo_estado_pedido)
        VALUES ('2024-04-10', '2024-04-14', '2024-04-12', NULL, 2, 2);
    }

    -- productos
    {
        -- Productos de la gama Herbáceas3
        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Planta de Vainilla', 10, 5.99, 3.50, 'Planta de vainilla aromática.', 1, 1);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Planta de Hierbabuena', 25, 4.49, 2.75, 'Planta de hierbabuena para infusiones.', 1, 1);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Hierba de Limón', 18, 3.99, 2.25, 'Hierba de limón para uso culinario y aromático.', 1, 1);

        (1, 3, 2, 5.99, 2), (2, 3, 2, 4.49, 2), (3, 3, 2, 3.99, 2)

        -- Productos de la gama Herramientas3
        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Set de Herramientas de Jardinería', 20, 39.99, 25.00, 'Incluye pala, rastrillo y tijeras de podar.', 2, 3);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Cortadora de Césped', 5, 149.99, 100.00, 'Cortadora de césped eléctrica con motor de 1500W.', 2, 1);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Set de Riego Automático', 8, 29.99, 20.00, 'Incluye temporizador y manguera para riego automático.', 2, 1);
        (4, 4, 1, 39.99, 2), (5, 4, 1, 149.99, 2), (6, 4, 1, 29.99, 2)

        -- Productos de la gama Aromáticas3
        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Incienso', 50, 2.99, 1.50, 'Incienso para aromaterapia.', 3, 1);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Vela de Lavanda', 25, 2.99, 2.50, 'Vela aromática de lavanda para relajación.', 3, 1);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Aceite Esencial de citronela', 40, 9.99, 6.00, 'Aceite esencial de citronela para difusores.', 3, 1);
        (7, 5, 1, 2.99, 2), (8, 5, 1, 2.99, 2), (9, 5, 1, 9.99, 2)

        -- Productos de la gama Frutales5
        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Manzanas verdes', 30, 0.99, 0.50, 'Manzanas frescas de la variedad verde', 4, 3);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Naranjas Valencia', 25, 1.49, 0.75, 'Naranjas frescas de la variedad Valencia.', 4, 3);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Plátanos Criollos', 35, 0.89, 0.40, 'Plátanos frescos criollos.', 4, 3);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Uvas', 40, 2.99, 1.80, 'Uvas frescas', 4, 3);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Fresas Frescas', 20, 3.49, 2.00, 'Fresas maduras y jugosas.', 4, 3);


        -- Productos de la gama Ornamentales5
        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Rosa Roja', 15, 3.99, 2.00, 'Rosa roja de floración temprana.', 5, 2);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Lirio Blanco', 25, 4.49, 2.50, 'Lirio blanco de fragancia suave y delicada.', 5, 2);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Begonia Escarlata', 18, 3.79, 2.00, 'Begonia de color escarlata intenso.', 5, 3);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Girasol Gigante', 12, 5.99, 3.50, 'Girasol de variedad gigante con flores de gran tamaño.', 5, 2);

        INSERT INTO producto (nombre, cantidad_stock, precio_venta, precio_proveedor, descripcion_producto, codigo_gama, codigo_dimension)
        VALUES ('Orquídea Phalaenopsis', 20, 8.99, 5.00, 'Orquídea Phalaenopsis en maceta de cerámica.', 5, 2);
    }

    -- detalle pedido 
    {
        -- Detalles del pedido 1
        INSERT INTO detalle_pedido (id_producto_pedido, id_pedido_producto, cantidad, precio_unidad, numero_linea)
        VALUES (10, 1, 3, 1, 1), (11, 1, 2, 1.49, 2), (12, 1, 3, 0.89, 1), (13, 1, 5, 2.99, 2);

        -- Detalles del pedido 2
        INSERT INTO detalle_pedido (id_producto_pedido, id_pedido_producto, cantidad, precio_unidad, numero_linea)
        VALUES (19, 2, 1, 8.99, 1), (18, 2, 2, 5.99, 2), (17, 2, 3, 3.79, 1), (16, 2, 5, 4.49, 2);

        -- Detalles del pedido 3
        INSERT INTO detalle_pedido (id_producto_pedido, id_pedido_producto, cantidad, precio_unidad, numero_linea)
        VALUES (1, 3, 2, 5.99, 2), (2, 3, 2, 4.49, 2), (3, 3, 2, 3.99, 2);

        -- Detalles del pedido 4
        INSERT INTO detalle_pedido (id_producto_pedido, id_pedido_producto, cantidad, precio_unidad, numero_linea)
        VALUES (4, 4, 1, 39.99, 2), (5, 4, 1, 149.99, 2), (6, 4, 1, 29.99, 2);
        
        -- Detalles del pedido 5
        INSERT INTO detalle_pedido (id_producto_pedido, id_pedido_producto, cantidad, precio_unidad, numero_linea)
        VALUES (7, 5, 1, 2.99, 2), (8, 5, 1, 2.99, 2), (9, 5, 1, 9.99, 2);
        
        -- Detalles del pedido 6
        INSERT INTO detalle_pedido (id_producto_pedido, id_pedido_producto, cantidad, precio_unidad, numero_linea)
        VALUES (1, 6, 2, 5.99, 2), (6, 6, 1, 29.99, 2), (9, 6, 1, 9.99, 2);
        
        -- Detalles del pedido 7
        INSERT INTO detalle_pedido (id_producto_pedido, id_pedido_producto, cantidad, precio_unidad, numero_linea)
        VALUES (12, 7, 3, 0.89, 1), (13, 7, 5, 2.99, 2);
        
        -- Detalles del pedido 8
        INSERT INTO detalle_pedido (id_producto_pedido, id_pedido_producto, cantidad, precio_unidad, numero_linea)
        VALUES (5, 8, 1, 149.99, 2), (8, 8, 1, 2.99, 2), (12, 8, 3, 0.89, 1);
        
        -- Detalles del pedido 9
        INSERT INTO detalle_pedido (id_producto_pedido, id_pedido_producto, cantidad, precio_unidad, numero_linea)
        VALUES (3, 9, 2, 3.99, 2);
        
        -- Detalles del pedido 10
        INSERT INTO detalle_pedido (id_producto_pedido, id_pedido_producto, cantidad, precio_unidad, numero_linea)
        VALUES (13, 10, 5, 2.99, 2), (19, 10, 1, 8.99, 1);

    }
# Proyecto de SQL - P 1

A continuación se realizan las diferentes consultas solicitadas por el docente:

**Nombre: ** Duván Camilo Arenas Rodríguez

![]()



### Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas. 

   ```mysql
   SELECT o.id_oficina, c.nombre
   FROM oficina AS o
   INNER JOIN direccion as dir ON dir.id_direccion = o.codigo_direccion_o
   INNER JOIN ciudad as c ON c.id_ciudad = dir.codigo_ciudad_d;
   
   +------------+-------------+
   | id_oficina | nombre      |
   +------------+-------------+
   |          1 | Madrid      |
   |          2 | Fuenlabrada |
   |          3 | Barcelona   |
   |          4 | Madrid      |
   +------------+-------------+
   ```

   

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España. 

   ```mysql
   SELECT c.nombre, tel.numero
   FROM telefono AS tel
   INNER JOIN oficina AS o ON o.id_oficina =  codigo_oficina_te
   INNER JOIN direccion AS dir ON dir.id_direccion = o.codigo_direccion_o
   INNER JOIN ciudad AS c ON c.id_ciudad = dir.codigo_ciudad_d
   INNER JOIN region AS r ON r.id_region = c.codigo_region
   INNER JOIN paIS AS p ON p.id_pais = r.codigo_pais
   WHERE p.id_pais = 2;
   
   +-------------+------------+
   | nombre      | numero     |
   +-------------+------------+
   | Madrid      | 3123456789 |
   | Madrid      | 5712345678 |
   | Fuenlabrada | 4123456789 |
   +-------------+------------+
   ```

   

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7. 

   ```mysql
   SELECT emp.nombre_empleado, emp.apellido1, emp.apellido2, emp.email
   FROM empleado AS emp
   WHERE emp.id_jefe = 7;
   
   +-----------------+-----------+-----------+-----------------------+
   | nombre_empleado | apellido1 | apellido2 | email                 |
   +-----------------+-----------+-----------+-----------------------+
   | Luisa           | Luque     | NULL      | l.luque@ejemplo.com   |
   | Santiago        | Mayorga   | NULL      | s.mayorga@ejemplo.com |
   | Andrey          | Galvis    | NULL      | a.galvis@ejemplo.com  |
   +-----------------+-----------+-----------+-----------------------+
   ```

   

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa. 

   ```mysql
   SELECT c.nombre_cargo, e.nombre_empleado, e.apellido1, e.apellido2, e.email
   FROM empleado as e, cargo as c
   WHERE id_jefe = 6 AND c.id_cargo = e.codigo_cargo;
   
   +------------------+-----------------+-----------+-----------+--------------------------+
   | nombre_cargo     | nombre_empleado | apellido1 | apellido2 | email                    |
   +------------------+-----------------+-----------+-----------+--------------------------+
   | Director Oficina | Angie           | Suárez    | NULL      | Angie.suarez@ejemplo.com |
   +------------------+-----------------+-----------+-----------+--------------------------+
   ```

   

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas. 

   ```mysql
   SELECT e.nombre_empleado, e.apellido1, e.apellido2, c.nombre_cargo
   FROM empleado as e, cargo as c
   WHERE e.codigo_cargo != 5 AND c.id_cargo = e.codigo_cargo;
   
   +-----------------+-----------+-----------+------------------+
   | nombre_empleado | apellido1 | apellido2 | nombre_cargo     |
   +-----------------+-----------+-----------+------------------+
   | Laura           | Galvis    | López     | Director General |
   | Esteban         | Bayona    | NULL      | Director General |
   | Juan            | Pérez     | Gómez     | Director Oficina |
   | Angie           | Suárez    | NULL      | Director Oficina |
   +-----------------+-----------+-----------+------------------+
   ```

   

6. Devuelve un listado con el nombre de los todos los clientes españoles. 

   ```mysql
   SELECT c.nombre_cliente
   FROM cliente AS c
   INNER JOIN ciudad as ci ON ci.id_ciudad = c.codigo_ciudad_c
   INNER JOIN region AS r ON r.id_region = ci.codigo_region
   INNER JOIN pais AS p ON p.id_pais = r.codigo_pais
   WHERE p.id_pais = 2;
   
   +-------------------------+
   | nombre_cliente          |
   +-------------------------+
   | David Ramírez           |
   | Michelle Amaya          |
   | Fernando José Dominguez |
   | Isabel Gutiérrez        |
   | Gabriela Doncel         |
   | Verónica Alcócer        |
   | Vicente Fernández       |
   | Juan Ramírez            |
   +-------------------------+
   ```

   

7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

   ```mysql
   SELECT nombre_estado
   FROM estado;
   
   +---------------+
   | nombre_estado |
   +---------------+
   | Entregado     |
   | Rechazado     |
   | Pendiente     |
   +---------------+
   ```

   

8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

   - Utilizando la función YEAR de MySQL.
   - Utilizando la función DATE_FORMAT de MySQL. 
   - Sin utilizar ninguna de las funciones anteriores.

   ```mysql
   SELECT c.id_cliente
   FROM cliente as c, pago as p
   WHERE YEAR(p.fecha_pago) = 2008 AND c.id_cliente = p.codigo_cliente_pa;
   
   +------------+
   | id_cliente |
   +------------+
   |          1 |
   |          2 |
   +------------+
   
   SELECT c.id_cliente
   FROM cliente as c, pago as p
   WHERE DATE_FORMAT(p.fecha_pago , '%Y') = 2008 AND c.id_cliente = p.codigo_cliente_pa;
   
   +------------+
   | id_cliente |
   +------------+
   |          1 |
   |          2 |
   +------------+
   ```



9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

   ```mysql
   SELECT p.id_pedido, c.id_cliente, p.fecha_esperado, p.fecha_entrega
   FROM pedido AS p, cliente AS c
   WHERE p.codigo_client_pedido = c.id_cliente AND p.fecha_entrega <= p.fecha_esperado;
   
   +-----------+------------+----------------+---------------+
   | id_pedido | id_cliente | fecha_esperado | fecha_entrega |
   +-----------+------------+----------------+---------------+
   |         2 |          1 | 2024-04-06     | 2024-04-06    |
   |         3 |          1 | 2024-04-07     | 2024-04-07    |
   |         5 |          3 | 2024-04-09     | 2024-04-09    |
   |         7 |          3 | 2024-04-11     | 2024-04-11    |
   |        10 |          2 | 2024-04-14     | 2024-04-12    |
   +-----------+------------+----------------+---------------+
   ```

   

10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

    - Utilizando la función ADDDATE de MySQL.
    - Utilizando la función DATEDIFF de MySQL.
    - ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

    ```mysql
    SELECT p.id_pedido, c.id_cliente, p.fecha_esperado, p.fecha_entrega
    FROM cliente as c, pedido as p
    WHERE p.codigo_client_pedido = c.id_cliente AND p.fecha_entrega < ADDDATE(p.fecha_esperado, INTERVAL 2 DAY);
    +-----------+------------+----------------+---------------+
    | id_pedido | id_cliente | fecha_esperado | fecha_entrega |
    +-----------+------------+----------------+---------------+
    |         2 |          1 | 2024-04-06     | 2024-04-06    |
    |         3 |          1 | 2024-04-07     | 2024-04-07    |
    |         5 |          3 | 2024-04-09     | 2024-04-09    |
    |         6 |          3 | 2024-04-10     | 2024-04-11    |
    |         7 |          3 | 2024-04-11     | 2024-04-11    |
    |        10 |          2 | 2024-04-14     | 2024-04-12    |
    +-----------+------------+----------------+---------------+
    
    SELECT p.id_pedido, c.id_cliente, p.fecha_esperado, p.fecha_entrega
    FROM cliente as c, pedido as p
    WHERE p.codigo_client_pedido = c.id_cliente AND DATEDIFF(p.fecha_esperado, p.fecha_entrega) > 1;
    ```

    

11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

    ```mysql
    SELECT id_pedido, fecha_esperado, fecha_entrega
    FROM pedido
    WHERE YEAR(fecha_pedido) = '2009' AND codigo_estado_pedido = 2;
    
    Este espacio está vacío debido a que no hubo pedidos rechazados en el 2009
    ```

    

12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

    ```mysql
    SELECT id_pedido
    FROM pedido
    WHERE MONTH(fecha_entrega) = 01;
    
    Este espacio está vacío porque no hubo entregas en el mes de enero
    ```

    

13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

    ```mysql
    SELECT p.id_pago, p.fecha_pago
    FROM pago as p, metodo_pago as m
    WHERE YEAR(p.fecha_pago) = '2008' AND m.id_metodo_pago = p.codigo_metodo_pago AND p.codigo_metodo_pago = 1
    ORDER BY p.id_pago DESC;
    
    +---------+------------+
    | id_pago | fecha_pago |
    +---------+------------+
    |       7 | 2008-11-02 |
    |       6 | 2008-02-28 |
    +---------+------------+
    ```

    

14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

    ```mysql
    SELECT id_metodo_pago, nombre_metodo
    FROM metodo_pago;
    
    +----------------+---------------+
    | id_metodo_pago | nombre_metodo |
    +----------------+---------------+
    |              1 | PayPal        |
    |              2 | Transferencia |
    |              3 | Cheque        |
    +----------------+---------------+
    ```

    

15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

    ```mysql
    SELECT p.id_producto, p.nombre, p.cantidad_stock, p.precio_venta, p.precio_proveedor, p.descripcion_producto, p.codigo_gama, p.codigo_dimension
    FROM producto as p, gama_producto as g
    WHERE g.nombre = 'Ornamentales' AND p.cantidad_stock > 100 AND g.id_gama = p.codigo_gama
    ORDER BY p.precio_venta DESC;
    
    Este aparece vacío debido a que no hay Ornamentales con stock mayor a 100
    ```

    

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

    ```mysql
    SELECT cl.id_cliente, cl.nombre_cliente, cl.limite_credito, cl.codigo_ciudad_c
    FROM cliente as cl
    INNER JOIN empleado as emp ON emp.id_empleado = cl.codigo_empleado_rep_ventas
    WHERE cl.codigo_ciudad_c = 1 AND  cl.codigo_empleado_rep_ventas IN(11, 30);
    
    Este aparece vacío porque no hay empleados con el código 11 o 30
    ```

    

### Consultas Multitabla (Composición Interna)

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

   ```mysql
   SELECT cl.nombre_cliente, CONCAT(em.nombre_empleado, ' ', em.apellido1, ' ', em.apellido2) as 'Representante'
   FROM cliente as cl 
   INNER JOIN empleado as em ON em.id_empleado = cl.codigo_empleado_rep_ventas;
   
   +-------------------------+---------------------------+
   | nombre_cliente          | Representante             |
   +-------------------------+---------------------------+
   | David Ramírez           | Pedro Páramo Sánchez      |
   | Michelle Amaya          | Andrea Martínez Fernández |
   | Fernando José Dominguez | Andrea Martínez Fernández |
   | Isabel Gutiérrez        | NULL                      |
   | Gabriela Doncel         | NULL                      |
   | Verónica Alcócer        | NULL                      |
   +-------------------------+---------------------------+
   ```

   

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el  nombre de sus representantes de ventas.

   ```mysql
   SELECT DISTINCT cl.nombre_cliente, CONCAT(emp.nombre_empleado, ' ', emp.apellido1, ' ', emp.apellido2) as 'Representante'
   FROM cliente as cl
   INNER JOIN pago as p ON p.codigo_cliente_pa = cl.id_cliente
   INNER JOIN empleado as emp ON emp.id_empleado = cl.codigo_empleado_rep_ventas;
   
   +-------------------------+---------------------------+
   | nombre_cliente          | Representante             |
   +-------------------------+---------------------------+
   | David Ramírez           | Pedro Páramo Sánchez      |
   | Michelle Amaya          | Andrea Martínez Fernández |
   | Fernando José Dominguez | Andrea Martínez Fernández |
   +-------------------------+---------------------------+
   ```

   

3. Muestra el nombre de los clientes que no hayan realizado pagos junto con  el nombre de sus representantes de ventas.

   ```mysql
   SELECT DISTINCT cl.nombre_cliente, CONCAT(emp.nombre_empleado, ' ', emp.apellido1, ' ', emp.apellido2) as 'Representante'
   FROM cliente as cl
   INNER JOIN empleado as emp ON emp.id_empleado = cl.codigo_empleado_rep_ventas
   WHERE cl.id_cliente NOT IN(
       SELECT codigo_cliente_pa
       FROM pago
   );
   
   +------------------+---------------+
   | nombre_cliente   | Representante |
   +------------------+---------------+
   | Isabel Gutiérrez | NULL          |
   | Gabriela Doncel  | NULL          |
   | Verónica Alcócer | NULL          |
   +------------------+---------------+
   ```

   

4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el  representante.

   ```mysql
   SELECT DISTINCT cl.nombre_cliente, CONCAT(emp.nombre_empleado, ' ', emp.apellido1, ' ', emp.apellido2) as 'Representante', c.nombre as 'Ciudad'
   FROM cliente as cl
   INNER JOIN pago as p ON p.codigo_cliente_pa = cl.id_cliente
   INNER JOIN empleado as emp ON emp.id_empleado = cl.codigo_empleado_rep_ventas
   INNER JOIN oficina as ofi ON ofi.id_oficina = emp.codigo_oficina
   INNER JOIN direccion as d ON d.id_direccion = ofi.codigo_direccion_o
   INNER JOIN ciudad as c ON c.id_ciudad = d.codigo_ciudad_d;
   
   +-------------------------+---------------------------+--------+
   | nombre_cliente          | Representante             | Ciudad |
   +-------------------------+---------------------------+--------+
   | David Ramírez           | Pedro Páramo Sánchez      | Madrid |
   | Michelle Amaya          | Andrea Martínez Fernández | Madrid |
   | Fernando José Dominguez | Andrea Martínez Fernández | Madrid |
   +-------------------------+---------------------------+--------+
   ```

   

5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre  de sus representantes junto con la ciudad de la oficina a la que pertenece el  representante.

   ```mysql
   SELECT DISTINCT cl.nombre_cliente, CONCAT(emp.nombre_empleado, ' ', emp.apellido1, ' ', emp.apellido2) as 'Representante', c.nombre as 'Ciudad'
   FROM cliente as cl
   INNER JOIN empleado as emp ON emp.id_empleado = cl.codigo_empleado_rep_ventas
   INNER JOIN oficina as ofi ON ofi.id_oficina = emp.codigo_oficina
   INNER JOIN direccion as d ON d.id_direccion = ofi.codigo_direccion_o
   INNER JOIN ciudad as c ON c.id_ciudad = d.codigo_ciudad_d
   WHERE cl.id_cliente NOT IN(
       SELECT codigo_cliente_pa
       FROM pago
   );
   
   +------------------+---------------+-------------+
   | nombre_cliente   | Representante | Ciudad      |
   +------------------+---------------+-------------+
   | Isabel Gutiérrez | NULL          | Fuenlabrada |
   | Gabriela Doncel  | NULL          | Fuenlabrada |
   | Verónica Alcócer | NULL          | Fuenlabrada |
   +------------------+---------------+-------------+
   ```

   

6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

   ```mysql
   SELECT DISTINCT d.linea_direccion1, d.linea_direccion2
   FROM cliente as cl
   INNER JOIN empleado as emp ON cl.codigo_empleado_rep_ventas = emp.id_empleado
   INNER JOIN oficina as o ON emp.codigo_oficina = o.id_oficina
   INNER JOIN direccion as d ON o.codigo_direccion_o = d.id_direccion
   INNER JOIN ciudad as c ON d.codigo_ciudad_d = c.id_ciudad
   WHERE c.nombre = 'Fuenlabrada';
   
   +------------------------------+------------------+
   | linea_direccion1             | linea_direccion2 |
   +------------------------------+------------------+
   | Avenida de la Libertad, 1123 | Piso 7, Puerta 1 |
   +------------------------------+------------------+
   ```

   

7. Devuelve el nombre de los clientes y el nombre de sus representantes junto  con la ciudad de la oficina a la que pertenece el representante.

   ```mysql
   SELECT cl.nombre_cliente as 'Nombre Cliente', emp.nombre_empleado as 'Nombre Representante', c.nombre as 'Ciudad'
   FROM cliente as cl
   INNER JOIN empleado as emp ON cl.codigo_empleado_rep_ventas = emp.id_empleado
   INNER JOIN oficina as o ON emp.codigo_oficina = o.id_oficina
   INNER JOIN direccion as d ON o.codigo_direccion_o = d.id_direccion
   INNER JOIN ciudad as c ON d.codigo_ciudad_d = c.id_ciudad;
   
   +-------------------------+----------------------+-------------+
   | Nombre Cliente          | Nombre Representante | Ciudad      |
   +-------------------------+----------------------+-------------+
   | David Ramírez           | Pedro                | Madrid      |
   | Michelle Amaya          | Andrea               | Madrid      |
   | Fernando José Dominguez | Andrea               | Madrid      |
   | Gabriela Doncel         | Luisa                | Fuenlabrada |
   | Verónica Alcócer        | Luisa                | Fuenlabrada |
   | Isabel Gutiérrez        | Andrey               | Fuenlabrada |
   +-------------------------+----------------------+-------------+
   ```

   

8. Devuelve un listado con el nombre de los empleados junto con el nombre  de sus jefes.

   ```mysql
   SELECT emp.nombre_empleado AS 'Nombre Empleado', CONCAT(j.nombre_empleado, ' ', j.apellido1) AS 'Nombre Jefe'
   FROM empleado as emp
   LEFT JOIN empleado as j ON emp.id_jefe = j.id_empleado;
   
   +-----------------+----------------+
   | Nombre Empleado | Nombre Jefe    |
   +-----------------+----------------+
   | Laura           | NULL           |
   | Juan            | Laura Galvis   |
   | Pedro           | Juan Pérez     |
   | Andrea          | Juan Pérez     |
   | José            | Juan Pérez     |
   | Esteban         | NULL           |
   | Angie           | Esteban Bayona |
   | Luisa           | Angie Suárez   |
   | Santiago        | Angie Suárez   |
   | Andrey          | Angie Suárez   |
   +-----------------+----------------+
   ```

   

9. Devuelve un listado que muestre el nombre de cada empleado, el nombre  de su jefe y el nombre del jefe de sus jefe.

   ```mysql
   SELECT emp1.nombre_empleado AS 'Nombre Empleado', CONCAT(emp2.nombre_empleado, ' ', emp2.apellido1) AS 'Nombre Jefe', CONCAT(emp3.nombre_empleado, ' ', emp3.apellido1) AS 'Jefe De Jefe'
   FROM empleado AS emp1
   LEFT JOIN empleado AS emp2 ON emp1.id_jefe = emp2.id_empleado
   LEFT JOIN empleado AS emp3 ON emp2.id_jefe = emp3.id_empleado;
   
   +-----------------+----------------+----------------+
   | Nombre Empleado | Nombre Jefe    | Jefe De Jefe   |
   +-----------------+----------------+----------------+
   | Laura           | NULL           | NULL           |
   | Juan            | Laura Galvis   | NULL           |
   | Pedro           | Juan Pérez     | Laura Galvis   |
   | Andrea          | Juan Pérez     | Laura Galvis   |
   | José            | Juan Pérez     | Laura Galvis   |
   | Esteban         | NULL           | NULL           |
   | Angie           | Esteban Bayona | NULL           |
   | Luisa           | Angie Suárez   | Esteban Bayona |
   | Santiago        | Angie Suárez   | Esteban Bayona |
   | Andrey          | Angie Suárez   | Esteban Bayona |
   +-----------------+----------------+----------------+
   ```

   

10. Devuelve el nombre de los clientes a los que no se les ha entregado a  tiempo un pedido.

    ```mysql
    SELECT DISTINCT cl.nombre_cliente
    FROM cliente as cl
    INNER JOIN pedido as p ON p.codigo_client_pedido = cl.id_cliente
    WHERE p.fecha_entrega >= p.fecha_esperado;
    
    +-------------------------+
    | nombre_cliente          |
    +-------------------------+
    | David Ramírez           |
    | Fernando José Dominguez |
    | Michelle Amaya          |
    +-------------------------+
    ```

    

11. Devuelve un listado de las diferentes gamas de producto que ha comprado  cada cliente.

    ```mysql
    SELECT DISTINCT CL.nombre_cliente, g.nombre AS 'Nombre Gama'
    FROM cliente as cl
    INNER JOIN pedido as p ON p.codigo_client_pedido = cl.id_cliente
    INNER JOIN detalle_pedido as det ON p.id_pedido = det.id_pedido_producto
    INNER JOIN producto as pro ON pro.id_producto = det.id_producto_pedido
    INNER JOIN gama_producto as g ON pro.codigo_gama = g.id_gama;
    
    +-------------------------+--------------+
    | nombre_cliente          | Nombre Gama  |
    +-------------------------+--------------+
    | David Ramírez           | Frutales     |
    | David Ramírez           | Ornamentales |
    | David Ramírez           | Herbaceas    |
    | David Ramírez           | Herramientas |
    | Michelle Amaya          | Herbaceas    |
    | Michelle Amaya          | Frutales     |
    | Michelle Amaya          | Ornamentales |
    | Fernando José Dominguez | Aromáticas   |
    | Fernando José Dominguez | Herbaceas    |
    | Fernando José Dominguez | Herramientas |
    | Fernando José Dominguez | Frutales     |
    +-------------------------+--------------+
    ```

    

### Consultas multitabla (Composición externa)

1. Devuelve un listado que muestre solamente los clientes que no han  realizado ningún pago.

   ```mysql
   SELECT cl.nombre_cliente
   FROM cliente as cl
   LEFT JOIN pago AS p ON cl.id_cliente = p.codigo_cliente_pa
   WHERE p.id_pago IS NULL;
   
   +---------+------------+-------+--------------------+-------------------+
   | id_pago | fecha_pago | total | codigo_metodo_pago | codigo_cliente_pa |
   +---------+------------+-------+--------------------+-------------------+
   |       1 | 2024-04-01 |   150 |                  1 |                 1 |
   |       2 | 2024-04-02 |   200 |                  1 |                 2 |
   |       3 | 2024-04-03 |   300 |                  1 |                 3 |
   |       4 | 2024-04-04 |   250 |                  2 |                 1 |
   |       5 | 2024-04-05 |   180 |                  2 |                 3 |
   |       6 | 2008-02-28 |   150 |                  1 |                 1 |
   |       7 | 2008-11-02 |   200 |                  1 |                 2 |
   |       8 | 2009-06-21 |   300 |                  1 |                 3 |
   +---------+------------+-------+--------------------+-------------------+
   ```

   

2. Devuelve un listado que muestre solamente los clientes que no han  realizado ningún pedido.

   ```mysql
   SELECT cl.nombre_cliente
   FROM cliente as cl
   LEFT JOIN pedido as pe ON pe.codigo_client_pedido = cl.id_cliente
   WHERE pe.id_pedido IS NULL;
   
   +-------------------+
   | nombre_cliente    |
   +-------------------+
   | Isabel Gutiérrez  |
   | Gabriela Doncel   |
   | Verónica Alcócer  |
   | Vicente Fernández |
   | Juan Ramírez      |
   +-------------------+
   ```

   

3. Devuelve un listado que muestre los clientes que no han realizado ningún  pago y los que no han realizado ningún pedido. 

   ```mysql
   SELECT cl.nombre_cliente as 'Nombre Cliente','Sin Pagos' AS Estado
   FROM cliente as cl
   LEFT JOIN pago as p ON cl.id_cliente = p.codigo_cliente_pa
   WHERE p.id_pago IS NULL
   UNION
   SELECT c2.nombre_cliente, 'Sin Pedidos' AS Estado
   FROM cliente as c2
   LEFT JOIN pedido as pe ON c2.id_cliente = pe.codigo_client_pedido
   WHERE pe.id_pedido IS NULL;
   
   +-------------------+-------------+
   | Nombre Cliente    | Estado      |
   +-------------------+-------------+
   | Isabel Gutiérrez  | Sin Pagos   |
   | Gabriela Doncel   | Sin Pagos   |
   | Verónica Alcócer  | Sin Pagos   |
   | Vicente Fernández | Sin Pagos   |
   | Juan Ramírez      | Sin Pagos   |
   | Isabel Gutiérrez  | Sin Pedidos |
   | Gabriela Doncel   | Sin Pedidos |
   | Verónica Alcócer  | Sin Pedidos |
   | Vicente Fernández | Sin Pedidos |
   | Juan Ramírez      | Sin Pedidos |
   +-------------------+-------------+
   ```

   

4. Devuelve un listado que muestre solamente los empleados que no tienen  una oficina asociada.

   ```mysql
   SELECT nombre_empleado
   FROM empleado
   WHERE codigo_oficina IS NULL;
   
   +-----------------+
   | nombre_empleado |
   +-----------------+
   | Laura           |
   | Esteban         |
   +-----------------+
   ```

   

5. Devuelve un listado que muestre solamente los empleados que no tienen un  cliente asociado. 

   ```mysql
   SELECT emp.nombre_empleado
   FROM empleado as emp
   WHERE emp.id_empleado NOT IN (
       SELECT codigo_empleado_rep_ventas
       FROM cliente WHERE codigo_empleado_rep_ventas IS NOT NULL
   );
   
   +-----------------+
   | nombre_empleado |
   +-----------------+
   | Laura           |
   | Juan            |
   | José            |
   | Esteban         |
   | Angie           |
   | Santiago        |
   +-----------------+
   ```

   

6. Devuelve un listado que muestre solamente los empleados que no tienen un  cliente asociado junto con los datos de la oficina donde trabajan.

   ```mysql
   SELECT emp.nombre_empleado, emp.codigo_oficina
   FROM empleado as emp
   WHERE emp.id_empleado NOT IN (
       SELECT codigo_empleado_rep_ventas
       FROM CLIENTE
       WHERE codigo_empleado_rep_ventas IS NOT NULL
   );
   
   +-----------------+----------------+
   | nombre_empleado | codigo_oficina |
   +-----------------+----------------+
   | Laura           |           NULL |
   | Juan            |              1 |
   | José            |              1 |
   | Esteban         |           NULL |
   | Angie           |              2 |
   | Santiago        |              2 |
   +-----------------+----------------+
   ```

   

7. Devuelve un listado que muestre los empleados que no tienen una oficina  asociada y los que no tienen un cliente asociado. 

   ```mysql
   SELECT e.nombre_empleado AS 'Nombre Empleado', 'Sin Oficina' AS Estado, NULL AS 'ID Oficina', NULL AS 'Codigo Direccion Oficina'
   FROM empleado AS e
   WHERE e.codigo_oficina IS NULL
   UNION
   SELECT e.nombre_empleado AS 'Nombre Empleado', 'Con Oficina' AS Estado, o.id_oficina AS 'ID Oficina', o.codigo_direccion_o AS 'Codigo Direccion Oficina'
   FROM empleado AS e
   LEFT JOIN oficina AS o ON e.codigo_oficina = o.id_oficina
   WHERE e.id_empleado NOT IN (SELECT codigo_empleado_rep_ventas FROM cliente WHERE codigo_empleado_rep_ventas IS NOT NULL);
   
   +-----------------+-------------+------------+--------------------------+
   | Nombre Empleado | Estado      | ID Oficina | Codigo Direccion Oficina |
   +-----------------+-------------+------------+--------------------------+
   | Laura           | Sin Oficina |       NULL |                     NULL |
   | Esteban         | Sin Oficina |       NULL |                     NULL |
   | Laura           | Con Oficina |       NULL |                     NULL |
   | Juan            | Con Oficina |          1 |                        1 |
   | José            | Con Oficina |          1 |                        1 |
   | Esteban         | Con Oficina |       NULL |                     NULL |
   | Angie           | Con Oficina |          2 |                        2 |
   | Santiago        | Con Oficina |          2 |                        2 |
   +-----------------+-------------+------------+--------------------------+
   ```

   

8. Devuelve un listado de los productos que nunca han aparecido en un  pedido.

   ```mysql
   SELECT p.id_producto, p.nombre
   FROM producto as p
   LEFT JOIN detalle_pedido as det ON p.id_producto = det.id_producto_pedido
   WHERE det.id_producto_pedido IS NULL;
   
   +-------------+----------------+
   | id_producto | nombre         |
   +-------------+----------------+
   |          14 | Fresas Frescas |
   |          15 | Rosa Roja      |
   +-------------+----------------+
   ```

   

9. Devuelve un listado de los productos que nunca han aparecido en un  pedido. El resultado debe mostrar el nombre, la descripción y la imagen del  producto.

   ```mysql
   SELECT p.id_producto, p.nombre, p.descripcion_producto, g.imagen
   FROM producto as p
   LEFT JOIN detalle_pedido as det ON p.id_producto = det.id_producto_pedido
   LEFT JOIN gama_producto as g ON g.id_gama = p.codigo_gama
   WHERE det.id_producto_pedido IS NULL;
   
   +-------------+----------------+----------------------------------+--------+
   | id_producto | nombre         | descripcion_producto             | imagen |
   +-------------+----------------+----------------------------------+--------+
   |          14 | Fresas Frescas | Fresas maduras y jugosas.        | NULL   |
   |          15 | Rosa Roja      | Rosa roja de floración temprana. | NULL   |
   +-------------+----------------+----------------------------------+--------+
   ```

   

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que  hayan sido los representantes de ventas de algún cliente que haya realizado  la compra de algún producto de la gama Frutales.

    ```mysql
    
    ```

    

11. Devuelve un listado con los clientes que han realizado algún pedido pero no  han realizado ningún pago.

    ```mysql
    
    ```

    

12. Devuelve un listado con los datos de los empleados que no tienen clientes  asociados y el nombre de su jefe asociado.

    ```mysql
    SELECT emp.id_empleado, CONCAT(emp.nombre_empleado, emp.apellido1, emp.apellido2) AS 'Nombre Empleado', je.nombre_empleado AS 'Nombre Jefe'
    FROM empleado as emp
    LEFT JOIN empleado as je ON emp.id_jefe = je.id_empleado
    LEFT JOIN cliente as cl ON emp.id_empleado = cl.codigo_empleado_rep_ventas
    WHERE cl.id_cliente IS NULL;
    
    +-------------+------------------+-------------+
    | id_empleado | Nombre Empleado  | Nombre Jefe |
    +-------------+------------------+-------------+
    |           1 | LauraGalvisLópez | NULL        |
    |           2 | JuanPérezGómez   | Laura       |
    |           5 | JoséMenesesMarin | Juan        |
    |           6 | NULL             | NULL        |
    |           7 | NULL             | Esteban     |
    |           9 | NULL             | Angie       |
    +-------------+------------------+-------------+
    ```



### Consultas resumen

1. ¿Cuántos empleados hay en la compañía?

   ```mysql
   SELECT COUNT(emp.nombre_empleado) as 'Número de empleados'
   FROM empleado as emp;
   
   +---------------------+
   | Número de empleados |
   +---------------------+
   |                  10 |
   +---------------------+
   ```

   

2. ¿Cuántos clientes tiene cada país? 

   ```mysql
   SELECT p.nombre AS 'País', COUNT(cl.id_cliente) AS 'Total Clientes'
   FROM pais as p
   LEFT JOIN region as r ON r.codigo_pais = p.id_pais
   LEFT JOIN ciudad as c ON c.codigo_region = r.id_region
   LEFT JOIN cliente as cl ON cl.codigo_ciudad_c = c.id_ciudad
   GROUP BY p.nombre;
   
   +------------------+----------------+
   | País             | Total Clientes |
   +------------------+----------------+
   | USA              |              0 |
   | España           |              8 |
   | Francia          |              0 |
   | Australia        |              0 |
   | UK (Reino Unido) |              0 |
   +------------------+----------------+
   ```

   

3. ¿Cuál fue el pago medio en 2009?

   ```mysql
   SELECT AVG(p.total) as 'Pago Medio 2009'
   FROM pago as p 
   WHERE YEAR(p.fecha_pago) = 2009;
   
   +-----------------+
   | Pago Medio 2009 |
   +-----------------+
   |             300 |
   +-----------------+
   ```

   

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma  descendente por el número de pedidos.

   ```mysql
   SELECT es.nombre_estado, COUNT(p.id_pedido) as 'Total pedidos'
   FROM pedido as p
   LEFT JOIN estado as es ON p.codigo_estado_pedido = es.id_estado
   GROUP BY es.nombre_estado;
   
   +---------------+---------------+
   | nombre_estado | Total pedidos |
   +---------------+---------------+
   | Entregado     |             5 |
   | Rechazado     |             3 |
   | Pendiente     |             2 |
   +---------------+---------------+
   ```

   

5. Calcula el precio de venta del producto más caro y más barato en una  misma consulta.

   ```mysql
   SELECT MAX(P.precio_venta) AS 'Producto más caro', MIN(p.precio_venta) AS 'Producto más barato'
   FROM producto as p;
   
   +-------------------+---------------------+
   | Producto más caro | Producto más barato |
   +-------------------+---------------------+
   |            149.99 |                0.89 |
   +-------------------+---------------------+
   ```

   

6. Calcula el número de clientes que tiene la empresa.

   ```mysql
   SELECT COUNT(nombre_cliente) as 'Número de clientes'
   FROM cliente;
   
   +--------------------+
   | Número de clientes |
   +--------------------+
   |                  8 |
   +--------------------+
   ```

   

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

   ```mysql
   SELECT COUNT(id_cliente) as 'Clientes en Madrid'
   FROM cliente
   WHERE codigo_ciudad_c = 1;
   
   +--------------------+
   | Clientes en Madrid |
   +--------------------+
   |                  3 |
   +--------------------+
   ```

   

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan  por M?

   ```mysql
   SELECT ci.nombre AS ciudad, COUNT(ci.nombre) AS 'Total Clientes'
   FROM cliente as cl
   INNER JOIN ciudad as ci
   WHERE ci.nombre LIKE 'M%'
   GROUP BY ci.nombre;
   
   +--------+----------------+
   | ciudad | Total Clientes |
   +--------+----------------+
   | Madrid |              8 |
   +--------+----------------+
   ```

   

9. Devuelve el nombre de los representantes de ventas y el número de clientes  al que atiende cada uno. 

   ```mysql
   SELECT emp.nombre_empleado as 'Representante Ventas', COUNT(cl.nombre_cliente) as 'Número de clientes'
   FROM empleado as emp
   LEFT JOIN cliente as cl ON cl.codigo_empleado_rep_ventas = emp.id_empleado
   WHERE emp.codigo_cargo = 5
   GROUP BY emp.nombre_empleado;
   
   +----------------------+--------------------+
   | Representante Ventas | Número de clientes |
   +----------------------+--------------------+
   | Pedro                |                  1 |
   | Andrea               |                  2 |
   | José                 |                  0 |
   | Luisa                |                  2 |
   | Santiago             |                  0 |
   | Andrey               |                  1 |
   +----------------------+--------------------+
   ```

   

10. Calcula el número de clientes que no tiene asignado representante de  ventas.

    ```mysql
    SELECT COUNT(cl.nombre_cliente) as 'Clientes sin representante'
    FROM cliente as cl
    WHERE cl.codigo_empleado_rep_ventas IS NULL;
    
    +----------------------------+
    | Clientes sin representante |
    +----------------------------+
    |                          2 |
    +----------------------------+
    ```

    

11. Calcula la fecha del primer y último pago realizado por cada uno de los  clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

    ```mysql
    SELECT cl.nombre_cliente, MIN(p.fecha_pago) as 'Primera fecha de pago', MAX(p.fecha_pago) as 'Fecha Último pago'
    FROM cliente as cl
    LEFT JOIN pago as p ON cl.id_cliente = p.codigo_cliente_pa
    GROUP BY cl.nombre_cliente;
    
    +-------------------------+-----------------------+-------------------+
    | nombre_cliente          | Primera fecha de pago | Fecha Último pago |
    +-------------------------+-----------------------+-------------------+
    | David Ramírez           | 2008-02-28            | 2024-04-04        |
    | Michelle Amaya          | 2008-11-02            | 2024-04-02        |
    | Fernando José Dominguez | 2009-06-21            | 2024-04-05        |
    | Isabel Gutiérrez        | NULL                  | NULL              |
    | Gabriela Doncel         | NULL                  | NULL              |
    | Verónica Alcócer        | NULL                  | NULL              |
    | Vicente Fernández       | NULL                  | NULL              |
    | Juan Ramírez            | NULL                  | NULL              |
    +-------------------------+-----------------------+-------------------+
    ```

    

12. Calcula el número de productos diferentes que hay en cada uno de los  pedidos.

    ```mysql
    SELECT id_pedido_producto, COUNT(DISTINCT id_producto_pedido) AS 'Número de productos' 
    FROM detalle_pedido
    GROUP BY id_pedido_producto;
    
    +--------------------+---------------------+
    | id_pedido_producto | Número de productos |
    +--------------------+---------------------+
    |                  1 |                   4 |
    |                  2 |                   4 |
    |                  3 |                   3 |
    |                  4 |                   3 |
    |                  5 |                   3 |
    |                  6 |                   3 |
    |                  7 |                   2 |
    |                  8 |                   3 |
    |                  9 |                   1 |
    |                 10 |                   2 |
    +--------------------+---------------------+
    ```

    

13. Calcula la suma de la cantidad total de todos los productos que aparecen en  cada uno de los pedidos.

    ```mysql
    SELECT ped.id_pedido, SUM(dp.cantidad) AS cantidad_total_productos
    FROM pedido as ped
    INNER JOIN detalle_pedido as dp ON ped.id_pedido = dp.id_pedido_producto
    GROUP BY ped.id_pedido;
    
    +-----------+--------------------------+
    | id_pedido | cantidad_total_productos |
    +-----------+--------------------------+
    |         1 |                       13 |
    |         2 |                       11 |
    |         3 |                        6 |
    |         4 |                        3 |
    |         5 |                        3 |
    |         6 |                        4 |
    |         7 |                        8 |
    |         8 |                        5 |
    |         9 |                        2 |
    |        10 |                        6 |
    +-----------+--------------------------+
    ```

    

14. Devuelve un listado de los 20 productos más vendidos y el número total de  unidades que se han vendido de cada uno. El listado deberá estar ordenado  por el número total de unidades vendidas.

    ```mysql
    SELECT p.nombre AS nombre_producto, SUM(dp.cantidad) AS total_unidades_vendidas
    FROM detalle_pedido AS dp
    INNER JOIN producto AS p ON dp.id_producto_pedido = p.id_producto
    GROUP BY p.nombre
    ORDER BY total_unidades_vendidas DESC
    LIMIT 20;
    
    +-----------------------------------+-------------------------+
    | nombre_producto                   | total_unidades_vendidas |
    +-----------------------------------+-------------------------+
    | Uvas                              |                      15 |
    | Plátanos Criollos                 |                       9 |
    | Lirio Blanco                      |                       5 |
    | Planta de Vainilla                |                       4 |
    | Hierba de Limón                   |                       4 |
    | Manzanas verdes                   |                       3 |
    | Begonia Escarlata                 |                       3 |
    | Planta de Hierbabuena             |                       2 |
    | Cortadora de Césped               |                       2 |
    | Set de Riego Automático           |                       2 |
    | Vela de Lavanda                   |                       2 |
    | Aceite Esencial de citronela      |                       2 |
    | Naranjas Valencia                 |                       2 |
    | Girasol Gigante                   |                       2 |
    | Orquídea Phalaenopsis             |                       2 |
    | Set de Herramientas de Jardinería |                       1 |
    | Incienso                          |                       1 |
    +-----------------------------------+-------------------------+
    ```

    

15. La facturación que ha tenido la empresa en toda la historia, indicando la  base imponible, el IVA y el total facturado. La base imponible se calcula  sumando el coste del producto por el número de unidades vendidas de la  tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la  suma de los dos campos anteriores.

    ```mysql
    SELECT SUM(base_imponible) AS total_base_imponible, SUM(iva) AS 'IVA Total', SUM(total_facturado) AS 'Total'
    FROM (
        SELECT SUM(dp.cantidad * p.precio_venta) AS base_imponible, SUM(dp.cantidad * p.precio_venta) * 0.21 AS iva, SUM(dp.cantidad * p.precio_venta) * 1.21 AS total_facturado
        FROM detalle_pedido dp
        JOIN producto p ON dp.id_producto_pedido = p.id_producto
        GROUP BY dp.id_pedido_producto
    ) AS facturacion;
    
    +----------------------+--------------------+----------+
    | total_base_imponible | IVA Total          | Total    |
    +----------------------+--------------------+----------+
    |               600.39 | 126.08190000000002 | 726.4719 |
    +----------------------+--------------------+----------+
    ```

    

16. La misma información que en la pregunta anterior, pero agrupada por  código de producto.

    ```mysql
    SELECT dp.id_producto_pedido AS 'id_producto', ROUND(SUM(dp.cantidad * p.precio_venta), 2) AS base_imponible, ROUND(SUM(dp.cantidad * p.precio_venta) * 0.21, 2) AS iva, ROUND(SUM(dp.cantidad * p.precio_venta) * 1.21, 2) AS 'Total'
    FROM detalle_pedido as dp
    JOIN producto as p ON dp.id_producto_pedido = p.id_producto
    GROUP BY dp.id_producto_pedido;
    
    +-------------+----------------+------+--------+
    | id_producto | base_imponible | iva  | Total  |
    +-------------+----------------+------+--------+
    |           1 |          23.96 | 5.03 |  28.99 |
    |           2 |           8.98 | 1.89 |  10.87 |
    |           3 |          15.96 | 3.35 |  19.31 |
    |           4 |          39.99 |  8.4 |  48.39 |
    |           5 |         299.98 |   63 | 362.98 |
    |           6 |          59.98 | 12.6 |  72.58 |
    |           7 |           2.99 | 0.63 |   3.62 |
    |           8 |           5.98 | 1.26 |   7.24 |
    |           9 |          19.98 |  4.2 |  24.18 |
    |          10 |           2.97 | 0.62 |   3.59 |
    |          11 |           2.98 | 0.63 |   3.61 |
    |          12 |           8.01 | 1.68 |   9.69 |
    |          13 |          44.85 | 9.42 |  54.27 |
    |          16 |          22.45 | 4.71 |  27.16 |
    |          17 |          11.37 | 2.39 |  13.76 |
    |          18 |          11.98 | 2.52 |   14.5 |
    |          19 |          17.98 | 3.78 |  21.76 |
    +-------------+----------------+------+--------+
    ```

    

17. La misma información que en la pregunta anterior, pero agrupada por  código de producto filtrada por los códigos que empiecen por OR.

    ```mysql
    SELECT 
        dp.id_producto_pedido AS codigo_producto,
        ROUND(SUM(dp.cantidad * p.precio_venta), 2) AS base_imponible,
        ROUND(SUM(dp.cantidad * p.precio_venta) * 0.21, 2) AS iva,
        ROUND(SUM(dp.cantidad * p.precio_venta) * 1.21, 2) AS total_facturado
    FROM detalle_pedido dp
    JOIN producto p ON dp.id_producto_pedido = p.id_producto
    WHERE p.id_producto LIKE 'OR%'
    GROUP BY dp.id_producto_pedido;
    
    En este caso la respuesta es vacía, ya que los productos tienen un ID autoincremental y carecen de 'OR' (no se especificó dicho requisito al inicio del taller)
    ```

    

18. Lista las ventas totales de los productos que hayan facturado más de 3000  euros. Se mostrará el nombre, unidades vendidas, total facturado y total  facturado con impuestos (21% IVA).

    ```mysql
    SELECT p.nombre AS nombre_producto, SUM(dp.cantidad) AS unidades_vendidas, ROUND(SUM(dp.cantidad * p.precio_venta), 2) AS total_facturado_sin_iva, ROUND(SUM(dp.cantidad * p.precio_venta) * 1.21, 2) total_facturado_con_iva
    FROM detalle_pedido dp
    JOIN producto p ON dp.id_producto_pedido = p.id_producto
    GROUP BY p.nombre
    HAVING total_facturado_con_iva > 3000;
    
    En este caso el resultado es vacío porque la cantidad de precios no supera el monto de 3000
    ```

    

19. Muestre la suma total de todos los pagos que se realizaron para cada uno  de los años que aparecen en la tabla pagos

    ```mysql
    SELECT YEAR(fecha_pago), SUM(total) as 'Suma Total Pagos'
    FROM pago
    GROUP BY YEAR(fecha_pago);
    
    +------------------+------------------+
    | YEAR(fecha_pago) | Suma Total Pagos |
    +------------------+------------------+
    |             2024 |             1080 |
    |             2008 |              350 |
    |             2009 |              300 |
    +------------------+------------------+
    ```

    

    ### Subconsultas

    ##### Con operadores básicos de comparación

    1. Devuelve el nombre del cliente con mayor límite de crédito.

       ```mysql
       SELECT nombre_cliente, limite_credito
       FROM cliente
       WHERE limite_credito = (
           SELECT MAX(limite_credito)
           FROM cliente
       );
       
       +-------------------------+----------------+
       | nombre_cliente          | limite_credito |
       +-------------------------+----------------+
       | Fernando José Dominguez |          10000 |
       +-------------------------+----------------+
       ```

       

    2. Devuelve el nombre del producto que tenga el precio de venta más caro.

       ```mysql
       SELECT nombre, precio_venta
       FROM producto
       WHERE precio_venta = (
           SELECT MAX(precio_venta)
           FROM producto
       );
       
       +---------------------+--------------+
       | nombre              | precio_venta |
       +---------------------+--------------+
       | Cortadora de Césped |       149.99 |
       +---------------------+--------------+
       ```

       

    3. Devuelve el nombre del producto del que se han vendido más unidades.  (Tenga en cuenta que tendrá que calcular cuál es el número total de  unidades que se han vendido de cada producto a partir de los datos de la  tabla detalle_pedido)

       ```mysql
       
       ```

       

    4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN). 

       ```mysql
       SELECT cl.id_cliente, cl.nombre_cliente
       FROM cliente as cl
       WHERE cl.limite_credito > (
           SELECT SUM(p.total)
           FROM pago as p
           WHERE p.codigo_cliente_pa = cl.id_cliente
       );
       
       +------------+-------------------------+
       | id_cliente | nombre_cliente          |
       +------------+-------------------------+
       |          1 | David Ramírez           |
       |          2 | Michelle Amaya          |
       |          3 | Fernando José Dominguez |
       +------------+-------------------------+
       ```

       

    5. Devuelve el producto que más unidades tiene en stock.

       ```mysql
       SELECT p.nombre
       FROM producto as p
       WHERE p.cantidad_stock = (
           SELECT MAX(pr.cantidad_stock)
           FROM producto as pr
       );
       
       +----------+
       | nombre   |
       +----------+
       | Incienso |
       +----------+
       ```

       

    6. Devuelve el producto que menos unidades tiene en stock.

       ```mysql
       SELECT p.nombre
       FROM producto as p
       WHERE p.cantidad_stock = (
           SELECT MIN(pr.cantidad_stock)
           FROM producto as pr
       );
       
       +---------------------+
       | nombre              |
       +---------------------+
       | Cortadora de Césped |
       +---------------------+
       ```

       

    7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.

       ```mysql
       SELECT emp.nombre_empleado
       FROM cliente as cl, empleado as emp
       WHERE cl.codigo_empleado_rep_ventas = emp.id_empleado AND cl.nombre_cliente = 'Alberto Soria';
       
       Esta consulta está vacía porque no hay clientes llamados 'Alberto Soria'
       ```

    ##### Subconsultas con ALL y ANY

    8. Devuelve el nombre del cliente con mayor límite de crédito. 

       ```mysql
       SELECT cl.nombre_cliente
       FROM cliente as cl
       WHERE cl.limite_credito >= ALL (
           SELECT limite_credito
           FROM cliente
       );
       
       +-------------------------+
       | nombre_cliente          |
       +-------------------------+
       | Fernando José Dominguez |
       +-------------------------+
       ```

       

    9. Devuelve el nombre del producto que tenga el precio de venta más caro.

       ```mysql
       SELECT pr.nombre as 'Nombre producto'
       FROM producto as pr
       WHERE pr.precio_venta >= ALL (
           SELECT precio_venta
           FROM producto
       );
       
       +---------------------+
       | Nombre producto     |
       +---------------------+
       | Cortadora de Césped |
       +---------------------+
       ```

       

    10. Devuelve el producto que menos unidades tiene en stock.

        ```mysql
        SELECT pr.nombre as 'Nombre Producto'
        FROM producto as pr
        WHERE pr.cantidad_stock <= ALL (
            SELECT cantidad_stock
            FROM producto
        );
        
        +---------------------+
        | Nombre Producto     |
        +---------------------+
        | Cortadora de Césped |
        +---------------------+
        ```

##### 	Subconsultas con IN y NOT IN

 11. Devuelve el nombre, apellido1 y cargo de los empleados que no  representen a ningún cliente. 

     ```mysql
     SELECT emp.nombre_empleado as 'Nombre Empleado', emp.apellido1, emp.codigo_cargo
     FROM empleado as emp
     WHERE emp.id_empleado IN (
         SELECT emp.id_empleado
         FROM empleado as emp
         LEFT JOIN cliente as c ON c.codigo_empleado_rep_ventas = emp.id_empleado
         WHERE c.id_cliente IS NULL
     );
     
     +-----------------+-----------+--------------+
     | Nombre Empleado | apellido1 | codigo_cargo |
     +-----------------+-----------+--------------+
     | Laura           | Galvis    |            1 |
     | Juan            | Pérez     |            6 |
     | José            | Meneses   |            5 |
     | Esteban         | Bayona    |            1 |
     | Angie           | Suárez    |            6 |
     | Santiago        | Mayorga   |            5 |
     +-----------------+-----------+--------------+
     
     ```

     

 12. Devuelve un listado que muestre solamente los clientes que no han  realizado ningún pago. 

     ```mysql
     SELECT cl.nombre_cliente
     FROM cliente as cl
     WHERE cl.id_cliente NOT IN (
         SELECT codigo_cliente_pa
         FROM pago
     );
     
     +-------------------+
     | nombre_cliente    |
     +-------------------+
     | Isabel Gutiérrez  |
     | Gabriela Doncel   |
     | Verónica Alcócer  |
     | Vicente Fernández |
     | Juan Ramírez      |
     +-------------------+
     ```

     

 13. Devuelve un listado que muestre solamente los clientes que sí han realizado  algún pago.

     ```mysql
     SELECT cl.nombre_cliente
     FROM cliente as cl
     WHERE cl.id_cliente IN (
         SELECT codigo_cliente_pa
         FROM pago
     );
     
     +-------------------------+
     | nombre_cliente          |
     +-------------------------+
     | David Ramírez           |
     | Michelle Amaya          |
     | Fernando José Dominguez |
     +-------------------------+
     ```

      

 14. Devuelve un listado de los productos que nunca han aparecido en un  pedido.

     ```mysql
     SELECT pr.nombre 
     FROM producto as pr
     WHERE pr.id_producto NOT IN (
         SELECT id_producto_pedido
         FROM detalle_pedido
     );
     
     +----------------+
     | nombre         |
     +----------------+
     | Fresas Frescas |
     | Rosa Roja      |
     +----------------+
     ```

     

 15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos  empleados que no sean representante de ventas de ningún cliente.

     ```mysql
     SELECT emp.nombre_empleado as 'Nombre Empleado', emp.apellido1, ofi.id_oficina, t.numero as 'Teléfono' 
     FROM empleado as emp
     INNER JOIN oficina as ofi ON ofi.id_oficina = emp.codigo_oficina
     INNER JOIN telefono as t ON t.codigo_oficina_te = ofi.id_oficina
     WHERE emp.id_empleado IN (
         SELECT emp.id_empleado
         FROM empleado as emp
         LEFT JOIN cliente as c ON c.codigo_empleado_rep_ventas = emp.id_empleado
         WHERE c.id_cliente IS NULL
     );
     
     +-----------------+-----------+------------+------------+
     | Nombre Empleado | apellido1 | id_oficina | Teléfono   |
     +-----------------+-----------+------------+------------+
     | José            | Meneses   |          1 | 3123456789 |
     | Juan            | Pérez     |          1 | 3123456789 |
     | José            | Meneses   |          1 | 5712345678 |
     | Juan            | Pérez     |          1 | 5712345678 |
     | Santiago        | Mayorga   |          2 | 4123456789 |
     | Angie           | Suárez    |          2 | 4123456789 |
     +-----------------+-----------+------------+------------+
     
     ```

     

 16. Devuelve las oficinas donde no trabajan ninguno de los empleados que  hayan sido los representantes de ventas de algún cliente que haya realizado  la compra de algún producto de la gama Frutales.

     ```mysql
     SELECT DISTINCT ofi.id_oficina as 'Oficinas'
     FROM oficina as ofi
     INNER JOIN empleado as emp ON emp.codigo_oficina = ofi.id_oficina
     INNER JOIN cliente as c ON c.codigo_empleado_rep_ventas = emp.id_empleado
     INNER JOIN pedido as p ON p.codigo_client_pedido = c.id_cliente
     INNER JOIN detalle_pedido as det ON det.id_pedido_producto = p.id_pedido
     INNER JOIN producto as pr ON pr.id_producto = det.id_producto_pedido
     WHERE pr.codigo_gama = (
         SELECT id_gama
         FROM gama_producto
         WHERE id_gama = 4
     );
     
     +----------+
     | Oficinas |
     +----------+
     |        1 |
     +----------+
     ```

     

 17. Devuelve un listado con los clientes que han realizado algún pedido pero no  han realizado ningún pago.

     ```mysql
     SELECT cl.nombre_cliente
     FROM cliente as cl
     INNER JOIN pedido as p ON p.codigo_client_pedido = cl.id_cliente
     WHERE cl.id_cliente In (
         SELECT c.id_cliente
         FROM cliente as c
         LEFT JOIN pago as pa ON pa.codigo_cliente_pa = c.id_cliente
         WHERE pa.codigo_cliente_pa IS NULL
     );
     
     Este apartado está vacío porque no hay clientes que hayan realizado pedidos sin pagar
     ```
     
     ##### 

##### Subconsultas con EXISTS y NOT EXISTS

18. Devuelve un listado que muestre solamente los clientes que no han  realizado ningún pago.

    ```mysql
    SELECT cl.nombre_cliente
    FROM cliente as cl
    WHERE NOT EXISTS (
        SELECT p.codigo_cliente_pa
        FROM pago as p
        WHERE p.codigo_cliente_pa = cl.id_cliente
    );
    
    +-------------------+
    | nombre_cliente    |
    +-------------------+
    | Isabel Gutiérrez  |
    | Gabriela Doncel   |
    | Verónica Alcócer  |
    | Vicente Fernández |
    | Juan Ramírez      |
    +-------------------+
    ```

    

19. Devuelve un listado que muestre solamente los clientes que sí han realizado  algún pago.

    ```mysql
    SELECT cl.nombre_cliente
    FROM cliente as cl
    WHERE EXISTS (
        SELECT p.codigo_cliente_pa
        FROM pago as p
        WHERE p.codigo_cliente_pa = cl.id_cliente
    );
    
    +-------------------------+
    | nombre_cliente          |
    +-------------------------+
    | David Ramírez           |
    | Michelle Amaya          |
    | Fernando José Dominguez |
    +-------------------------+
    ```

     

20. Devuelve un listado de los productos que nunca han aparecido en un  pedido.

    ```mysql
    SELECT pr.nombre
    FROM producto as pr
    WHERE NOT EXISTS (
        SELECT det.id_producto_pedido
        FROM detalle_pedido as det
        WHERE det.id_producto_pedido = pr.id_producto
    );
    
    +----------------+
    | nombre         |
    +----------------+
    | Fresas Frescas |
    | Rosa Roja      |
    +----------------+
    ```

    

21. Devuelve un listado de los productos que han aparecido en un pedido  alguna vez.

    ```mysql
    SELECT pr.nombre
    FROM producto as pr
    WHERE EXISTS (
        SELECT det.id_producto_pedido
        FROM detalle_pedido as det
        WHERE det.id_producto_pedido = pr.id_producto
    );
    
    +-----------------------------------+
    | nombre                            |
    +-----------------------------------+
    | Planta de Vainilla                |
    | Planta de Hierbabuena             |
    | Hierba de Limón                   |
    | Set de Herramientas de Jardinería |
    | Cortadora de Césped               |
    | Set de Riego Automático           |
    | Incienso                          |
    | Vela de Lavanda                   |
    | Aceite Esencial de citronela      |
    | Manzanas verdes                   |
    | Naranjas Valencia                 |
    | Plátanos Criollos                 |
    | Uvas                              |
    | Lirio Blanco                      |
    | Begonia Escarlata                 |
    | Girasol Gigante                   |
    | Orquídea Phalaenopsis             |
    +-----------------------------------+
    ```
    
    

### Consultas variadas

1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos  pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no  han realizado ningún pedido.

   ```mysql
   SELECT cl.nombre_cliente AS 'Nombre cliente', COUNT(p.id_pedido) AS 'Número de pedidos'
   FROM cliente AS cl
   LEFT JOIN pedido AS p ON cl.id_cliente = p.codigo_client_pedido
   GROUP BY cl.nombre_cliente;
   
   +-------------------------+-------------------+
   | Nombre cliente          | Número de pedidos |
   +-------------------------+-------------------+
   | David Ramírez           |                 4 |
   | Michelle Amaya          |                 2 |
   | Fernando José Dominguez |                 4 |
   | Isabel Gutiérrez        |                 0 |
   | Gabriela Doncel         |                 0 |
   | Verónica Alcócer        |                 0 |
   | Vicente Fernández       |                 0 |
   | Juan Ramírez            |                 0 |
   +-------------------------+-------------------+
   ```

   

2. Devuelve un listado con los nombres de los clientes y el total pagado por  cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han  realizado ningún pago.

   ```mysql
   SELECT c.nombre_cliente AS 'Nombre Cliente', COALESCE(SUM(pa.total), 0) AS 'Total'
   FROM cliente AS c
   LEFT JOIN pago AS pa ON c.id_cliente = pa.codigo_cliente_pa
   GROUP BY c.nombre_cliente;
   
   +-------------------------+-------+
   | Nombre Cliente          | Total |
   +-------------------------+-------+
   | David Ramírez           |   550 |
   | Michelle Amaya          |   400 |
   | Fernando José Dominguez |   780 |
   | Isabel Gutiérrez        |     0 |
   | Gabriela Doncel         |     0 |
   | Verónica Alcócer        |     0 |
   | Vicente Fernández       |     0 |
   | Juan Ramírez            |     0 |
   +-------------------------+-------+
   ```

   

3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008  ordenados alfabéticamente de menor a mayor.

   ```mysql
   SELECT c.nombre_cliente
   FROM cliente c
   JOIN pedido p ON c.id_cliente = p.codigo_client_pedido
   WHERE YEAR(p.fecha_pedido) = 2008
   ORDER BY c.nombre_cliente ASC;
   
   Esta consulta arroja un resultado vacío porque no hubo pedidos hechos en el año 2008
   ```

   

4. Devuelve el nombre del cliente, el nombre y primer apellido de su  representante de ventas y el número de teléfono de la oficina del  representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

   ```mysql
   SELECT c.nombre_cliente, CONCAT(e.nombre_empleado, ' ', e.apellido1) AS nombre_representante, t.numero AS telefono_oficina_representante
   FROM cliente c
   JOIN empleado e ON c.codigo_empleado_rep_ventas = e.id_empleado
   JOIN telefono t ON e.id_empleado = t.codigo_oficina_te
   LEFT JOIN pago p ON c.id_cliente = p.codigo_cliente_pa
   WHERE p.id_pago IS NULL;
   
   El resultado es vacío porque los clientes vinculados a representates de ventas realizaron pedidos y pagaron
   ```

   

5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el  nombre y primer apellido de su representante de ventas y la ciudad donde  está su oficina.

   ```mysql
   SELECT c.nombre_cliente, CONCAT(e.nombre_empleado, ' ', e.apellido1) AS Representante, ci.nombre AS ciudad
   FROM cliente AS c
   JOIN empleado AS e ON c.codigo_empleado_rep_ventas = e.id_empleado
   JOIN oficina AS o ON e.codigo_oficina = o.id_oficina
   JOIN direccion AS d ON o.codigo_direccion_o = d.id_direccion
   JOIN ciudad AS ci ON d.codigo_ciudad_d = ci.id_ciudad;
   
   +-------------------------+-----------------+-------------+
   | nombre_cliente          | Representante   | ciudad      |
   +-------------------------+-----------------+-------------+
   | David Ramírez           | Pedro Páramo    | Madrid      |
   | Michelle Amaya          | Andrea Martínez | Madrid      |
   | Fernando José Dominguez | Andrea Martínez | Madrid      |
   | Gabriela Doncel         | Luisa Luque     | Fuenlabrada |
   | Verónica Alcócer        | Luisa Luque     | Fuenlabrada |
   | Isabel Gutiérrez        | Andrey Galvis   | Fuenlabrada |
   +-------------------------+-----------------+-------------+
   ```

   

6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

   ```mysql
   SELECT e.nombre_empleado, e.apellido1, e.apellido2, c.nombre_cargo AS Puesto, t.numero AS 'Teléfono'
   FROM empleado e
   JOIN cargo c ON e.codigo_cargo = c.id_cargo
   JOIN telefono t ON e.id_empleado = t.codigo_oficina_te
   LEFT JOIN cliente cl ON e.id_empleado = cl.codigo_empleado_rep_ventas
   WHERE cl.codigo_empleado_rep_ventas IS NULL;
   
   +-----------------+-----------+-----------+------------------+------------+
   | nombre_empleado | apellido1 | apellido2 | Puesto           | Teléfono   |
   +-----------------+-----------+-----------+------------------+------------+
   | Laura           | Galvis    | López     | Director General | 3123456789 |
   | Laura           | Galvis    | López     | Director General | 5712345678 |
   | Juan            | Pérez     | Gómez     | Director Oficina | 4123456789 |
   +-----------------+-----------+-----------+------------------+------------+
   ```



7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el  número de empleados que tiene.

   ```mysql
   SELECT ci.nombre AS Ciudad, COUNT(e.id_empleado) AS 'Empleados'
   FROM empleado AS e
   JOIN oficina AS o ON e.codigo_oficina = o.id_oficina
   JOIN direccion AS d ON o.codigo_direccion_o = d.id_direccion
   JOIN ciudad AS ci ON d.codigo_ciudad_d = ci.id_ciudad
   GROUP BY ci.nombre;
   
   +-------------+-----------+
   | Ciudad      | Empleados |
   +-------------+-----------+
   | Madrid      |         4 |
   | Fuenlabrada |         4 |
   +-------------+-----------+
   ```

   

### Vistas

1. vista para mostrar oficina y la ciudad donde se encuentra.

```mysql
CREATE VIEW listaOficinasCiudad AS
SELECT o.id_oficina, c.nombre
FROM oficina AS o
INNER JOIN direccion as dir ON dir.id_direccion = o.codigo_direccion_o
INNER JOIN ciudad as c ON c.id_ciudad = dir.codigo_ciudad_d;

+------------+-------------+
| id_oficina | nombre      |
+------------+-------------+
|          1 | Madrid      |
|          2 | Fuenlabrada |
|          3 | Barcelona   |
|          4 | Madrid      |
+------------+-------------+
```



2. vista para mostrar nombre del puesto, nombre, apellidos y email del jefe de la empresa. 

   ```mysql
   CREATE VIEW listaJefeEmpresa AS
   SELECT c.nombre_cargo, e.nombre_empleado, e.apellido1, e.apellido2, e.email
   FROM empleado as e, cargo as c
   WHERE id_jefe = 6 AND c.id_cargo = e.codigo_cargo;
   
   +------------------+-----------------+-----------+-----------+--------------------------+
   | nombre_cargo     | nombre_empleado | apellido1 | apellido2 | email                    |
   +------------------+-----------------+-----------+-----------+--------------------------+
   | Director Oficina | Angie           | Suárez    | NULL      | Angie.suarez@ejemplo.com |
   +------------------+-----------------+-----------+-----------+--------------------------+
   ```

3. Vista para listar el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas. 

   ```mysql
   CREATE VIEW listaEmpleadosNoRp AS
   SELECT e.nombre_empleado, e.apellido1, e.apellido2, c.nombre_cargo
   FROM empleado as e, cargo as c
   WHERE e.codigo_cargo != 5 AND c.id_cargo = e.codigo_cargo;
   
   +-----------------+-----------+-----------+------------------+
   | nombre_empleado | apellido1 | apellido2 | nombre_cargo     |
   +-----------------+-----------+-----------+------------------+
   | Laura           | Galvis    | López     | Director General |
   | Esteban         | Bayona    | NULL      | Director General |
   | Juan            | Pérez     | Gómez     | Director Oficina |
   | Angie           | Suárez    | NULL      | Director Oficina |
   +-----------------+-----------+-----------+------------------+
   ```

4. Vista para listar el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

   ```mysql
   CREATE VIEW listaPedidosNoEntregados AS
   SELECT p.id_pedido, c.id_cliente, p.fecha_esperado, p.fecha_entrega
   FROM pedido AS p, cliente AS c
   WHERE p.codigo_client_pedido = c.id_cliente AND p.fecha_entrega <= p.fecha_esperado;
   
   +-----------+------------+----------------+---------------+
   | id_pedido | id_cliente | fecha_esperado | fecha_entrega |
   +-----------+------------+----------------+---------------+
   |         2 |          1 | 2024-04-06     | 2024-04-06    |
   |         3 |          1 | 2024-04-07     | 2024-04-07    |
   |         5 |          3 | 2024-04-09     | 2024-04-09    |
   |         7 |          3 | 2024-04-11     | 2024-04-11    |
   |        10 |          2 | 2024-04-14     | 2024-04-12    |
   +-----------+------------+----------------+---------------+
   
   ```

5. Vista para listar todas las formas de pago.

   ```mysql
   CREATE VIEW listaMetodosPago AS
   SELECT id_metodo_pago, nombre_metodo
   FROM metodo_pago;
   
   +----------------+---------------+
   | id_metodo_pago | nombre_metodo |
   +----------------+---------------+
   |              1 | PayPal        |
   |              2 | Transferencia |
   |              3 | Cheque        |
   +----------------+---------------+
   ```

6. Vista para listar el nombre de los clientes a los que no se les ha entregado a  tiempo un pedido.

   ```mysql
   CREATE VIEW listaClientesNoATiempo AS
   SELECT DISTINCT cl.nombre_cliente
   FROM cliente as cl
   INNER JOIN pedido as p ON p.codigo_client_pedido = cl.id_cliente
   WHERE p.fecha_entrega >= p.fecha_esperado;
   
   +-------------------------+
   | nombre_cliente          |
   +-------------------------+
   | David Ramírez           |
   | Fernando José Dominguez |
   | Michelle Amaya          |
   +-------------------------+
   ```

7. Vista para listar el nombre de cada cliente y el nombre y apellido de su representante de ventas.

   ```mysql
   CREATE VIEW listaClienteRepresentante AS
   SELECT cl.nombre_cliente, CONCAT(em.nombre_empleado, ' ', em.apellido1, ' ', em.apellido2) as 'Representante'
   FROM cliente as cl 
   INNER JOIN empleado as em ON em.id_empleado = cl.codigo_empleado_rep_ventas;
   
   +-------------------------+---------------------------+
   | nombre_cliente          | Representante             |
   +-------------------------+---------------------------+
   | David Ramírez           | Pedro Páramo Sánchez      |
   | Michelle Amaya          | Andrea Martínez Fernández |
   | Fernando José Dominguez | Andrea Martínez Fernández |
   | Isabel Gutiérrez        | NULL                      |
   | Gabriela Doncel         | NULL                      |
   | Verónica Alcócer        | NULL                      |
   +-------------------------+---------------------------+
   ```

8. Vista para lsitar los productos que nunca han aparecido en un pedido.

   ```mysql
   CREATE VIEW listaProductoSinPedido AS
   SELECT p.id_producto, p.nombre
   FROM producto as p
   LEFT JOIN detalle_pedido as det ON p.id_producto = det.id_producto_pedido
   WHERE det.id_producto_pedido IS NULL;
   
   +-------------+----------------+
   | id_producto | nombre         |
   +-------------+----------------+
   |          14 | Fresas Frescas |
   |          15 | Rosa Roja      |
   +-------------+----------------+
   ```

9. Vista para listar empleados que no tienen  una oficina asociada.

   ```mysql
   CREATE VIEW listaEmpleadoSinOficina AS
   SELECT nombre_empleado
   FROM empleado
   WHERE codigo_oficina IS NULL;
   
   +-----------------+
   | nombre_empleado |
   +-----------------+
   | Laura           |
   | Esteban         |
   +-----------------+
   ```

10. Vista para listar el número de clientes con domicilio en la ciudad de Madrid

    ```mysql
    CREATE VIEW listaClientesMadrid AS
    SELECT COUNT(id_cliente) as 'Clientes en Madrid'
    FROM cliente
    WHERE codigo_ciudad_c = 1;
    
    +--------------------+
    | Clientes en Madrid |
    +--------------------+
    |                  3 |
    +--------------------+
    ```



### Procedimientos Almacenados

1. Insertar País

   ```mysql
   DELIMITER $$
   DROP PROCEDURE IF EXISTS insert_pais $$
   CREATE PROCEDURE insert_pais (IN nombrePais VARCHAR(50))
   BEGIN
       INSERT INTO pais (idPais, nombrePais) VALUES (NULL, nombrePais);
   END $$
   DELIMITER ;
   
   CALL insert_pais('Colombia');
   ```

   

2. Insertar Gama

   ```mysql
   DELIMITER $$
   DROP PROCEDURE IF EXISTS insert_gama $$
   CREATE PROCEDURE insert_gama (
       IN id_gama,
       IN nombre VARCHAR(50),
       IN descripcion_texto TEXT,
       IN descripcion_html TEXT,
       IN imagen VARCHAR(256)
   )
   BEGIN
       INSERT INTO gama_producto () VALUES (NULL,nombre,descripcion_texto,descripcion_html, imagen)
   END $$
   DELIMITER ;
   ```

   

3. Insertar Estado

   ```mysql
   DELIMITER $$
   DROP PROCEDURE IF EXISTS insert_estado $$
   CREATE PROCEDURE insert_estado (
       IN id_estado,
       IN nombre_estado
   )
   BEGIN
       INSERT INTO estado (id_estado, nombre_estado) VALUES (NULL, nombre_estado);
   END $$
   DELIMITER ;
   ```

   

4. Insertar método de pago 

   ```mysql
   DELIMITER $$
   DROP PROCEDURE IF EXISTS insert_metodo_pago $$
   CREATE PROCEDURE insert_metodo_pago (
       IN id_metodo_pago
       IN nombre_metodo
   )
   BEGIN
       INSERT INTO metodo_pago (id_metodo_pago, nombre_metodo) VALUES (NULL, nombre_metodo)
   END $$
   DELIMITER ;
   ```

   

5. Insertar tipo de teléfono

   ```mysql
   DELIMITER $$
   DROP PROCEDURE IF EXISTS insert_tipo_telefono $$
   CREATE PROCEDURE insert_tipo_telefono (
       IN id_tipo_telefono,
       IN descripcion
   )
   BEGIN
       INSERT INTO tipo_telefono (id_tipo_telefono, descripcion) VALUES (NULL, descripcion);
   END $$
   DELIMITER ;
   ```

   

6. Mostrar clientes

   ```mysql
   DELIMITER $$
   DROP PROCEDURE IF EXISTS mostrar_clientes $$
   CREATE PROCEDURE mostrar_clientes ()
   BEGIN
       SELECT id_cliente as 'ID Cliente', nombre_cliente as 'Nombre Cliente', limite_credito as 'Límite de Crédito', codigo_ciudad_c as 'Ciudad', codigo_direccion_c as 'Dirección', codigo_empleado_rep_ventas as 'Representante de Ventas Asignado'
       FROM cliente
   END $$
   DELIMITER ;
   ```

   

7. Mostrar empleados

   ```mysql
   DELIMITER $$
   DROP PROCEDURE IF EXISTS mostrar_empleados $$
   CREATE PROCEDURE mostrar_empleados ()
   BEGIN
       SELECT id_empleado as 'ID Empleado', nombre_empleado as 'Nombre', apellido1 as 'Primer Apellido', apellido2 as 'Segundo apellido', extension as 'Extension', email as 'Email', id_jefe 'Jefe', codigo_oficina as 'Oficina', codigo_cargo as 'Cargo'
       FROM empleados
   END $$
   DELIMITER ;
   ```

   

8. Actualizar país

   ```mysql
   DELIMITER $$
   DROP PROCEDURE IF EXISTS actualizar_pais $$
   CREATE PROCEDURE actualizar_pais (
       IN id_pais,
       IN nombre VARCHAR(30)
   )
   BEGIN
       UPDATE pais SET nombre = nombre
   END $$
   DELIMITER ;
   ```

   

9. Eliminar dimensión

   ```mysql
   DELIMITER $$
   DROP PROCEDURE IF EXISTS eliminar_dimension $$
   CREATE PROCEDURE eliminar_dimension (
       IN id 
   )
   BEGIN
       DELETE FROM dimension WHERE id_dimension = id;
   END $$
   DELIMITER ;
   ```

   

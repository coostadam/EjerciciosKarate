# Ejercicios Karate
## Escenario 1
1. Haz una petición para crear un usuario.
2. Almacena el token de autorización para poder llevar a cabo el resto de solicitudes.

## Escenario 2
1. Realiza una solicitud para obtener la lista completa de artículos existente.
2. Crea un nuevo artículo indicando:
   - Título
   - Descripción
   - Cuerpo
3. Haz una comprobación que verifique el status 200.

## Escenario 3
1. Realiza una solicitud nuevamente para obtener la lista completa de artículos existente.
2. Almacena en una variable el `slugID` del artículo que creaste anteriormente.
3. Actualiza el título y la descripción del artículo identificado por su `slugID`.
4. Haz una comprobación para asegurarse de que el título es el esperado.
5. Haz una comprobación para asegurarse de que la descripción sea la esperada.

## Escenario 4
1. Crea otra variable para almacenar el nuevo `slugID`.
2. Realiza una solicitud para eliminar el artículo.
3. Confirma que ya no existe haciendo de nuevo una solicitud para obtener la lista de artículos.

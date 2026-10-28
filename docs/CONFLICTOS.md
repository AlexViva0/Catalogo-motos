# Conflictos de merge

Los cinco conflictos se provocaron a propósito con el mismo procedimiento:

1. Desde `main` se crean dos ramas, `conflicto/<nombre>-a` y `conflicto/<nombre>-b`.
2. Cada rama cambia **la misma línea** de forma distinta.
3. Se abre y fusiona primero el PR de la rama A.
4. Se abre el PR de la rama B. GitHub lo marca como *“This branch has conflicts”* porque `main` ya trae otra versión de esa línea.
5. En la rama B se ejecuta `git merge origin/main`, Git detiene el merge y deja marcadores en el archivo:

   ```
   <<<<<<< HEAD          ← versión de la rama B (donde estoy)
   ...
   =======
   ...
   >>>>>>> origin/main   ← versión que ya está en main (rama A)
   ```

6. Se edita el archivo para dejar la versión final, se **borran los tres marcadores**, se hace `git add` + `git commit` y se sube. El PR B ya se puede fusionar.

Después de cada resolución se comprueba `flutter analyze` y `flutter test`.

| # | Archivo | Rama A (se fusionó primero) | Rama B | Resolución | PRs |
|---|---------|-----------------------------|--------|------------|-----|
| 1 | `lib/core/theme/colores_app.dart` | primario `0xFF2E7D32` (más oscuro) | primario `0xFF4C8C4A` (más claro) | Se conserva **A**, el verde oscuro | #7, #8, #9 |
| 2 | `lib/presentation/widgets/vista_carga.dart` | `'Cargando motos...'` | `'Cargando, espera un momento...'` | Se conserva **A** | #10, #11 |
| 3 | `lib/presentation/widgets/campo_busqueda.dart` | `'Buscar moto o marca'` | `'Escribe un modelo o una marca'` | Se conserva **B** | #12, #13 |
| 4 | `lib/presentation/widgets/vista_error.dart` | `'Volver a intentar'` | `'Intentar otra vez'` | Texto **nuevo**: `'Intentar de nuevo'` | #14, #15 |
| 5 | `lib/presentation/screens/pantalla_favoritos.dart` | título y mensaje A | título y mensaje B | **Combinado**: título de A, mensaje de B | #16, #17 |

## Detalle

### 1. Color primario
Las dos ramas cambiaron `ColoresApp.primario`. Se eligió el verde oscuro de A porque contrasta mejor con el texto blanco de los botones.
**Lección:** en la primera resolución quedaron marcadores `<<<<<<<` en el archivo; se corrigió en el PR #9. Desde entonces se busca `<<<<<<<` antes de hacer commit.

### 2. Mensaje de carga
Se conservó `'Cargando motos...'` (A): es más corto y dice exactamente qué se carga.

### 3. Pista del buscador
Se conservó `'Escribe un modelo o una marca'` (B): le dice al usuario qué escribir. La versión de `main` se descartó.

### 4. Botón de reintentar
Ninguna versión se quedó tal cual: se escribió una tercera, `'Intentar de nuevo'`. Resolver un conflicto no obliga a elegir A o B.

### 5. Favoritos vacío
El conflicto abarcó dos líneas (título y mensaje). Se combinó línea por línea:

```dart
titulo: 'Todavía no hay favoritos',                                 // de A
mensaje: 'Toca el corazón de una moto y aparecerá en esta lista.', // de B
```

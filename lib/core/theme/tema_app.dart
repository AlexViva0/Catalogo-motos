import 'package:flutter/material.dart';

import 'colores_app.dart';

class TemaApp {
  TemaApp._();

  static ThemeData get claro {
    const esquema = ColorScheme.light(
      primary: ColoresApp.primario,
      onPrimary: ColoresApp.sobrePrimario,
      secondary: ColoresApp.acentoMedio,
      onSecondary: ColoresApp.textoPrincipal,
      surface: ColoresApp.fondo,
      onSurface: ColoresApp.textoPrincipal,
      error: ColoresApp.error,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: esquema,
      scaffoldBackgroundColor: ColoresApp.fondo,
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: ColoresApp.textoPrincipal,
          letterSpacing: -0.2,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ColoresApp.textoPrincipal,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          height: 1.4,
          color: ColoresApp.textoPrincipal,
        ),
        bodySmall: TextStyle(
          fontSize: 13,
          height: 1.3,
          color: ColoresApp.textoSecundario,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColoresApp.fondo,
        foregroundColor: ColoresApp.textoPrincipal,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: ColoresApp.textoPrincipal,
        ),
      ),
      cardTheme: CardThemeData(
        color: ColoresApp.tarjeta,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: ColoresApp.borde),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColoresApp.primario,
          foregroundColor: ColoresApp.sobrePrimario,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: ColoresApp.acentoClaro,
        selectedColor: ColoresApp.acentoMedio,
        labelStyle: const TextStyle(color: ColoresApp.textoPrincipal),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColoresApp.tarjeta,
        hintStyle: const TextStyle(color: ColoresApp.textoSecundario),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: ColoresApp.borde),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: ColoresApp.borde),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: ColoresApp.primario, width: 2),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_flutter/data.dart';
import 'package:test_app_flutter/screen2.dart';
import 'registration_bloc.dart'; // Importa el archivo del Bloc
import 'registration_screen.dart'; // Importa la pantalla de registro


void main() {
  final RegistrationBloc registrationBloc = RegistrationBloc();

  runApp(
    BlocProvider<RegistrationBloc>(
      create: (BuildContext context) => registrationBloc,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/registration', // Ruta inicial
      routes: {
        '/registration': (context) => RegistrationScreen(), // Pantalla de registro
        '/email_password': (context) => EmailPasswordScreen(), // Pantalla de correo y contraseña
        '/data_display': (context) => DataDisplayScreen(), // Pantalla de visualización de datos
      },
    );
  }
}

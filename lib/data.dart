import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'registration_bloc.dart';

class DataDisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RegistrationBloc _bloc = BlocProvider.of<RegistrationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Display Screen'),
      ),
      body: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          inspect(state);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nombre: ${state.name}'),
                Text('Apellido: ${state.lastName}'),
                Text('Correo: ${state.email}'),
                Text('Contraseña: ${state.password}'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Regresa a la pantalla anterior
                  },
                  child: Text('Volver'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

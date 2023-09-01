import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_flutter/screen2.dart';
import 'registration_bloc.dart';
import 'data.dart'; // Importa el archivo con RegistrationState

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RegistrationBloc _bloc = BlocProvider.of<RegistrationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Screen'),
      ),
      body: BlocBuilder<RegistrationBloc, RegistrationState>(
  builder: (context, state) {
    return Center(
      child: Column(
        children: [
          Text('Nombre: ${state.name}'),
          Text('Apellido: ${state.lastName}'),
          TextField(
            onChanged: (value) {
              _bloc.add(RegistrationNameChanged(value));
            },
            decoration: InputDecoration(labelText: 'Nombre'),
          ),
          TextField(
            onChanged: (value) {
              _bloc.add(RegistrationLastNameChanged(value));
            },
            decoration: InputDecoration(labelText: 'Apellido'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/email_password');
            },
            child: Text('Siguiente'),
          ),
        ],
      ),
    );
  },
)
,
    );
  }
}

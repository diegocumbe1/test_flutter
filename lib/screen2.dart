import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_flutter/data.dart';
import 'package:test_app_flutter/registration_bloc.dart';

class EmailPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registrationBloc = BlocProvider.of<RegistrationBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Añadir Correo y Contraseña')),
      body: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (email) {
                    registrationBloc.add(RegistrationEmailChanged(email));
                  },
                  decoration: InputDecoration(labelText: 'Correo'),
                ),
                TextField(
                  onChanged: (password) {
                    registrationBloc.add(RegistrationPasswordChanged(password));
                  },
                  decoration: InputDecoration(labelText: 'Contraseña'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la siguiente pantalla
                    Navigator.pushNamed(context, '/data_display');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => DataDisplayScreen()),
                    // );
                  },
                  child: Text('Siguiente'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

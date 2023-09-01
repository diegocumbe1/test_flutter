import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationState {
  final String name;
  final String lastName;
  final String email;
  final String password;
  final String photo;
  final String cardId;

  RegistrationState({
    this.name = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.photo = '',
    this.cardId = '',
  });

  RegistrationState copyWith({String? name, String? lastName, String? email, String? password, String? photo, String? cardId}) {
    return RegistrationState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      photo: photo ?? this.photo,
      cardId: cardId ?? this.cardId,
    );
  }
}


class RegistrationEvent {
  const RegistrationEvent();
}

class RegistrationNameChanged extends RegistrationEvent {
  final String name;

  RegistrationNameChanged(this.name);
}

class RegistrationLastNameChanged extends RegistrationEvent {
  final String lastName;

  RegistrationLastNameChanged(this.lastName);
}
class RegistrationEmailChanged extends RegistrationEvent {
  final String email;

  RegistrationEmailChanged(this.email);
}
class RegistrationPasswordChanged extends RegistrationEvent {
  final String password;

  RegistrationPasswordChanged(this.password);
}

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState()){
    on<RegistrationNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<RegistrationLastNameChanged>((event, emit) {
      emit(state.copyWith(lastName: event.lastName));
    });

    on<RegistrationEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<RegistrationPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    // ... otros manejadores de eventos ...
  }
  

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegistrationNameChanged) {
      yield state.copyWith(name: event.name);
    } else if (event is RegistrationLastNameChanged) {
      yield state.copyWith(lastName: event.lastName);
    }
    if (event is RegistrationEmailChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is RegistrationPasswordChanged) {
      yield state.copyWith(password: event.password);
    }
  }
}

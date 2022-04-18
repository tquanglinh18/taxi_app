part of 'sign_in_cubit.dart';

class SignInState extends Equatable {

  final String email;

  final String phoneNumber;

  final int indexTab;

  const SignInState({this.indexTab = 0, this.email = '', this.phoneNumber = '',});

  SignInState copyWith({
    String? email,
    String? phoneNumber,
    int? indexTab,
  }) {
    return SignInState(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      indexTab: indexTab ?? this.indexTab,
    );
  }
  @override
  List<Object> get props => [
    email, phoneNumber, indexTab
  ];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());
  void updateIndexTab(int index){
    emit(state.copyWith(indexTab: index));
  }
  void emailChanged(String email){
    emit(state.copyWith(email: email));
  }
  void phoneNumberChanged(String phoneNumber){
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

}

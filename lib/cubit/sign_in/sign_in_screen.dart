import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_application/cubit/sign_in/sign_in_cubit.dart';
import 'package:taxi_application/screens/verificaion_screen.dart';

import '../../form/image.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final SignInCubit _cubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberTextFieldSignUp = TextEditingController();
  TextEditingController phoneNumberTextFieldSignIn = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cubit = SignInCubit();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Material(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => SignInCubit(),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height / 2,
                    width: screenSize.width,
                    child: _logoWidget(),
                  ),
                  _loginForm(),
                  const SizedBox(height: 10),
                  _signUpWith(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff109F2E),
            Color(0xff51C569),
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(logotaxi),
            ),
          ),
          Container(
            height: 80,
            width: 340,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff109F2E).withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(3, 3),
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
            ),
            child: TabSignUp(
              itemTabbarPressed: (int value) {
                _cubit.updateIndexTab(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return BlocBuilder<SignInCubit, SignInState>(
      bloc: _cubit,
      buildWhen: (previous, current) => previous.indexTab != current.indexTab,
      builder: (context, state) {
        if (state.indexTab == 0) {
          return Container(
            width: 340,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff109F2E).withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _emailFieldSignUp(),
                    const SizedBox(height: 15),
                    _phoneNumberFieldSignUp(),
                    const SizedBox(height: 15),
                    _signUpButton(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            width: 340,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff109F2E).withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Login with your Phone Number', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Corbel Bold",
                    ),),
                    const SizedBox(height: 15),
                    _phoneNumberFieldSignIn(),
                    const SizedBox(height: 15),
                    _signInButton(),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _emailFieldSignUp() {
    return BlocBuilder<SignInCubit, SignInState>(builder: (context, state) {
      return Container(
        height: 55,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xff34495E).withOpacity(0.5),
              width: 1,
            )),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'name@example.com',
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return ("Enter Email");
            } else if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value) ==
                false) {
              return ("Invalid Email");
            }
            return null;
          },
          onChanged: (value) => context.read<SignInCubit>().emailChanged(value),
        ),
      );
    });
  }

  Widget _phoneNumberFieldSignUp() {
    return Row(
      children: [
        Container(
          height: 55,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xff34495E).withOpacity(0.5),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 20,
                  width: 25,
                  child: Image.asset(vietnam),
                ),
              ),
              const Expanded(
                child: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.arrow_drop_down_sharp),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 25),
        BlocBuilder<SignInCubit, SignInState>(builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(5),
            height: 55,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xff34495E).withOpacity(0.5),
                  width: 1,
                )),
            child: Row(
              children: [
                const Text(
                  " +84",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phoneNumberTextFieldSignUp,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      counterText: '',
                      hintText: 'PhoneNumber',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter PhoneNumber");
                      } else if (RegExp(r'(^[0-9]{9}$)').hasMatch(value) ==
                          false) {
                        return ("Invalid PhoneNumber");
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        context.read<SignInCubit>().phoneNumberChanged(value),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _signUpButton() {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff109F2E).withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff109F2E),
                Color(0xff51C569),
              ],
            ),
          ),
          child: InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VerificationScreen(
                        phoneNumber: phoneNumberTextFieldSignUp.text),
                  ),
                );
              }
            },
            child: const Center(
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'OpenSans-Bold',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _signUpWith() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: const Color(0xff707070)),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(facebook),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: const Color(0xff707070)),
                ),
                child: Center(
                  child: Image.asset(
                    google,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: const Color(0xff707070)),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(insta),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: const Color(0xff707070)),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(faceid),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'By signing in you agree to our  ',
                style: TextStyle(
                  fontFamily: "Campton",
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                'Teams of use',
                style: TextStyle(
                  fontFamily: "Campton",
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _phoneNumberFieldSignIn() {
    return Row(
      children: [
        Container(
          height: 55,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xff34495E).withOpacity(0.5),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 20,
                  width: 25,
                  child: Image.asset(vietnam),
                ),
              ),
              const Expanded(
                child: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.arrow_drop_down_sharp),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 25),
        BlocBuilder<SignInCubit, SignInState>(builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(5),
            height: 55,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xff34495E).withOpacity(0.5),
                  width: 1,
                )),
            child: Row(
              children: [
                const Text(
                  " +84",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phoneNumberTextFieldSignIn,
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15),
                      counterText: '',
                      hintText: 'PhoneNumber',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter PhoneNumber");
                      } else if (RegExp(r'(^[0-9]{9}$)').hasMatch(value) ==
                          false) {
                        return ("Invalid PhoneNumber");
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        context.read<SignInCubit>().phoneNumberChanged(value),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _signInButton() {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff109F2E).withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff109F2E),
                Color(0xff51C569),
              ],
            ),
          ),
          child: InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VerificationScreen(
                        phoneNumber: phoneNumberTextFieldSignIn.text),
                  ),
                );
              }
            },
            child: const Center(
              child: Text(
                'SIGN IN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'OpenSans-Bold',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}

class TabSignUp extends StatefulWidget {
  final ValueChanged<int> itemTabbarPressed;

  const TabSignUp({Key? key, required this.itemTabbarPressed})
      : super(key: key);

  @override
  State<TabSignUp> createState() => _TabSignUpState();
}

class _TabSignUpState extends State<TabSignUp> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (value) {
        widget.itemTabbarPressed(value);
      },
      labelPadding: EdgeInsets.zero,
      indicatorColor: const Color(0xff109F2E),
      controller: _tabController,
      tabs: const [
        Tab(
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xff109F2E),
              fontSize: 22,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Color(0xff109F2E),
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}

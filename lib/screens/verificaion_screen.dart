import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../cubit/sign_in/sign_in_screen.dart';
import '../form/image.dart';
import 'contact_screen.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const VerificationScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

  FirebaseAuth fireBaseAuth = FirebaseAuth.instance;
  String _verificationIDReceived = "";
  String verificationIDInput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _otp(),
            _otpTutorial(),
            _formOTP(),
            const SizedBox(height: 30),
            _signInButton(),
          ],
        ),
      ),
    );
  }

  Widget _otp() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 200,
      width: double.infinity,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop(
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
            child: Image.asset(back),
          ),
          const SizedBox(height: 25),
          const Text(
            'Phone Verificaion',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontFamily: "Corbel Bold",
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Enter your OTP code here',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: "Corbel Bold",
            ),
          ),
        ],
      ),
    );
  }

  Widget _otpTutorial() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Text(
            'Enter the 6 digit code we just sent to \n ',
            style: TextStyle(
              fontFamily: 'Corbel Bold',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Text(
              '+84${widget.phoneNumber}',
              style: const TextStyle(
                fontFamily: 'Corbel Bold',
                fontSize: 16,
                color: Color(0xff109F2E),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _formOTP() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff34495E).withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              autofocus: true,
              maxLength: 1,
              controller: otp1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                hintText: '-',
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff34495E).withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              autofocus: true,
              maxLength: 1,
              controller: otp2,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                hintText: '-',
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff34495E).withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              autofocus: true,
              maxLength: 1,
              controller: otp3,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                hintText: '-',
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff34495E).withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              autofocus: true,
              maxLength: 1,
              controller: otp4,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                hintText: '-',
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff34495E).withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              autofocus: true,
              maxLength: 1,
              controller: otp5,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                hintText: '-',
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff34495E).withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              autofocus: true,
              maxLength: 1,
              controller: otp6,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                hintText: '-',
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
        ],
      );
    });
  }

  Widget _signInButton() {
    return Builder(builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: InkWell(
          onTap: () {
            setState(() {
              verificationIDInput = otp1.text +
                  otp2.text +
                  otp3.text +
                  otp4.text +
                  otp5.text +
                  otp6.text;
            });
            verifyCode();
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff109F2E).withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(3, 3),
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
        ),
      );
    });
  }

  void verifyNumber() {
    fireBaseAuth.verifyPhoneNumber(
        phoneNumber: '+84${widget.phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await fireBaseAuth
              .signInWithCredential(credential)
              .then((value) => {});
        },
        verificationFailed: (FirebaseAuthException exception) {
        },
        codeSent: (String verificationID, int? resentToken) {
          setState(() {
            _verificationIDReceived = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationIDReceived = verificationID;
          });
        },
        timeout: const Duration(seconds: 60));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyNumber();
  }

  void verifyCode() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationIDReceived,
        smsCode: verificationIDInput,
      );
      await fireBaseAuth.signInWithCredential(credential).then((value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ContactScreen(),
          ),
        );
      });
    } catch (e) {
      var snackBar = const SnackBar(
        content: Text('Invalid OTP'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

}

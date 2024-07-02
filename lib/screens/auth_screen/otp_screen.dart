import 'package:flutter/material.dart';
import 'package:black_coffer_2/screens/places.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: _otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter OTP Number",
                  suffixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: _otpController.text.toString());
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlacesScreen(),
                          )));
                } catch (e) {
                  print(e);
                }
              },
              child: const Text("OTP Verified"))
        ],
      ),
    );
  }
}

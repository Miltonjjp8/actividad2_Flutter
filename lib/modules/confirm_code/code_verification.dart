import 'package:flutter/material.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  final TextEditingController _code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/user.png', width: 200, height: 200),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Codigo de verificacion',
              labelStyle: TextStyle(color: Colors.black),
            ),
            keyboardType: TextInputType.number,
            controller: _code,
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/new_password');
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                  'Enviar Codigo'), // Corrige el texto a "Iniciar sesión"
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final TextEditingController _email = TextEditingController();

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
              hintText: 'Correo electronico',
              label: Text('Correo electronico'),
              labelStyle: TextStyle(color: Colors.black),
            ),
            keyboardType: TextInputType.emailAddress,
            controller: _email,
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/code_verification');
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

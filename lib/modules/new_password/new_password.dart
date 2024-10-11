import 'package:flutter/material.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({super.key});

  @override
  State<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  bool _isObscure = true;
  bool _isObscureRepeat = true;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/user.png', width: 200, height: 200),
          const SizedBox(height: 16),
          // Campo para ingresar la contraseña
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Contraseña',
              labelText: 'Contraseña',
              labelStyle: TextStyle(color: Colors.black),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            controller: _passwordController,
            obscureText: _isObscure,
          ),
          const SizedBox(height: 16),
          // Campo para repetir la contraseña
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Repetir contraseña',
              labelText: 'Repetir contraseña',
              labelStyle: TextStyle(color: Colors.black),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscureRepeat = !_isObscureRepeat;
                  });
                },
                icon: Icon(
                  _isObscureRepeat ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            controller: _repeatPasswordController,
            obscureText: _isObscureRepeat,
          ),
          const SizedBox(height: 16),
          // Mostrar mensaje de error si las contraseñas no coinciden
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          const SizedBox(height: 16),
          // Botón para guardar la contraseña
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                _validatePasswords();
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('Guardar'),
            ),
          ),
        ],
      ),
    );
  }

  void _validatePasswords() {
    // Validar que las contraseñas sean iguales
    if (_passwordController.text != _repeatPasswordController.text) {
      setState(() {
        _errorMessage = 'Las contraseñas no coinciden';
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
      // Aquí puedes añadir la lógica para guardar la nueva contraseña
      print('Contraseña guardada: ${_passwordController.text}');
    }
  }
}

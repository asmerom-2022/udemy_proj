import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/constants/constants.dart';

import '../controller/login_controller.dart';
import '../providers/isObuscre_provider.dart';
import '../widgets/email_password_field.dart';

class RegistrationPage extends ConsumerWidget {
  RegistrationPage({super.key});

  final _formKey = GlobalKey<FormState>();
  bool isObscured = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

    var isObscured = ref.watch(isObscureProvider);

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: bgColor,
      // appBar: const CustomAppBar(
      //   title: 'Register',
      //   isCenterTile: true,
      //   fontSize: 20,
      // ),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 64),
              EmailPasswordFields(
                hint: 'email',
                controller: emailController,
                validator: (email) {
                  var isValid = EmailValidator.validate(email!);
                  if (isValid) return null;
                  return 'invalid email';
                },
              ),
              EmailPasswordFields(
                controller: passwordController,
                obscureText: isObscured,
                hint: 'password',
                validator: (String? password) {
                  if (password == null || password.isEmpty) {
                    return 'Enter valid password';
                  }
                  return null;
                },
                icon: IconButton(
                    icon: Icon(
                      !isObscured
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () => ref
                        .read(isObscureProvider.notifier)
                        .state = !isObscured),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                    var isValid = _formKey.currentState?.validate() ?? false;
                    if (isValid) {
                      await ref.read(loginControllerProvider.notifier).signUp(
                          emailController.text, passwordController.text);
                      print(
                          'create is ${emailController.text + passwordController.text}');
                    }
                  },
                  child: const Text('Create new'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

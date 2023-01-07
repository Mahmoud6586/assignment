import 'package:assignment/screens/messages_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return false;
    }
    _form.currentState!.save();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 0.06 * size.height,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 0.06 * size.height,
              ),
              Form(
                key: _form,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 6.0,
                            ),
                            border: InputBorder.none,
                            labelText: 'Email or Phone',
                            prefixIcon: Icon(
                              Icons.fingerprint,
                              color: Colors.black,
                            ),
                          ),
                          validator: (value) {
                            if (!EmailValidator.validate(value!)) {
                              return 'Please enter a valid email address';
                            }
                            if (value.isEmpty) {
                              return 'This field can\'t be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.03 * size.height,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6.0,
                            ),
                            border: InputBorder.none,
                            labelText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                                onPressed: _toggle,
                                icon: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.black,
                                )),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.03 * size.height,
              ),
              GestureDetector(
                onTap: () {
                  // Forget password function
                },
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 0.04 * size.height,
              ),
              SizedBox(
                width: double.infinity,
                height: 0.08 * size.height,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_saveForm()) {
                      login(emailController.text, passwordController.text);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 0.01 * size.width,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 0.06 * size.height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New here?',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 0.01 * size.width,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Implement Register function
                    },
                    child: const Text(
                      'Creat an account',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse('https://build1.saviway.com/auth/login');

    try {
      final response = await http.get(url, headers: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MessagesScreen()));
      }
    } catch (error) {
      print(error);
    }
  }
}

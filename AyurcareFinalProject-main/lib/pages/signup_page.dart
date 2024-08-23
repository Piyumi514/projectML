// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:ayurcare/db/models/user_model.dart';
import 'package:ayurcare/db/repository/user_repo.dart';
import 'package:ayurcare/pages/submit_page.dart';
import 'package:flutter/material.dart';

import '../util/auth_service.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignupPage(),
      ),
    );

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _errorMessage = '';
  bool _isLoading = false;
  String? _fullNameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;
  final userRepository = UserRepository();

  Future<void> _submitForm() async {
    setState(() {
      _fullNameError = _validateFullName(_fullNameController.text);
      _emailError = _validateEmail(_emailController.text);
      _passwordError = _validatePassword(_passwordController.text);
      _confirmPasswordError =
          _validateConfirmPassword(_confirmPasswordController.text);
    });

    if (_fullNameError != null ||
        _emailError != null ||
        _passwordError != null ||
        _confirmPasswordError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors')),
      );
      return;
    }
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });
    try {
      Users user = Users(
        fullName: _fullNameController.value.text,
        email: _emailController.value.text,
        password: _passwordController.value.text,
      );

      try {
        await userRepository.addUser(user);
        await AuthService().registerWithEmailAndPassword(
            _emailController.value.text, _passwordController.value.text);
        print('User created/updated successfully');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyPage()),
        );
      } catch (e) {
        print('Error creating/updating user: $e');
        var snackBar = SnackBar(
          content: Text(e.toString()),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to register, try again!';
      });
    } finally {
      setState(() {
        _isLoading = false; // Hide loader when register is complete
      });
    }

    // If all fields are filled correctly, you can perform signup logic here
    // For demonstration, I'm just printing the values
    print('Full Name: ${_fullNameController.text}');
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
    print('Confirm Password: ${_confirmPasswordController.text}');

    // Navigate to the next screen or perform other actions after signup
  }

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be 6 characters long';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/ac.png', // Assuming 'logo.png' is your logo file path
                fit: BoxFit.contain,
                height: 250,
                width: 120,
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 25, 155, 31),
                  Color.fromARGB(255, 19, 48, 20)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 170,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    height: 170,
                    width: width,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/bg.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color.fromRGBO(5, 146, 29, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromRGBO(196, 135, 198, .3)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(196, 135, 198, .3),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Full Name",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 103, 102, 102)),
                            errorText: _fullNameError,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 103, 102, 102)),
                            errorText: _emailError,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 103, 102, 102)),
                            errorText: _passwordError,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm Password",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 103, 102, 102)),
                            errorText: _confirmPasswordError,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                    padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom:
                            20), // Add padding to left, right, and bottom sides

                    child: MaterialButton(
                      onPressed: _submitForm,
                      color: const Color.fromRGBO(4, 54, 35, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 50,
                      minWidth: 2,
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

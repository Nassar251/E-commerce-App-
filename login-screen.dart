import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shpping_app/body.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/cap_1.png',
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Colors.white, Colors.deepOrange]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 15, top: 20, end: 15),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value) {
                              if (kDebugMode) {
                                print(value);
                              }
                            },
                            onChanged: (value) {
                              if (kDebugMode) {
                                print(value);
                              }
                            },
                            validator: (value) => (value==null || value.isEmpty) ? 'Enter an email' : null,
                            decoration: const InputDecoration(
                              labelText: 'E-Mail',
                              border: OutlineInputBorder(),
                              prefix: Icon(Icons.email,
                                color: Colors.deepOrange,),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 15, top: 40, bottom: 20, end: 15),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefix: Icon(Icons.lock,
                                color: Colors.deepOrange,),
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                              ),
                            ),
                            validator: (value) => (value==null || value.isEmpty) ? 'password must be not empty' : null,

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Colors.deepOrange,
                                Colors.deepOrange
                              ]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: MaterialButton(
                              // child: TextButton.styleFrom(
                              //   padding: const EdgeInsets.all(10.0),
                              //   textStyle: const TextStyle(fontSize: 20),
                              // ),
                              onPressed: () {
                                if (formKey.currentState!.validate())
                                {
                                  if (kDebugMode) {
                                    print(emailController.text);
                                  }
                                  if (kDebugMode) {
                                    print(passwordController.text);
                                  }
                                }
                                if (kDebugMode) {
                                  print(emailController.text);
                                }
                                if (kDebugMode) {
                                  print(passwordController.text);
                                }
                              },
                              child: InkWell(
                                onTap: (){
                                  navigateTo(context, const BodyApp());
                                },
                                child: const Text(
                                  'L O G I N',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Text('don\'t have account ?')],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Sign UP',
                          style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

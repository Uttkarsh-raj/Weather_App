import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:weather/repository/weather_repo.dart';
import 'package:weather/view/home/widgets/glass_container.dart';
// Generated in the configuring steps
import 'package:weather/amplifyconfiguration.dart';

class SignUpLoginPage extends StatefulWidget {
  @override
  _SignUpLoginPageState createState() => _SignUpLoginPageState();
}

class _SignUpLoginPageState extends State<SignUpLoginPage> {
  bool isSignInTab = true;
  String name = "", email = "", pass = "";

  void awsFunctions() async {
    await AwsAmplify().configureAmplify();
    var getUser = await AwsAmplify().getCurrentUser();
    if (getUser == null) {
      print("Sign in");
    } else {
      print(getUser);
    }
  }

  @override
  void initState() {
    awsFunctions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade700, Colors.purple.shade400],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    isSignInTab ? 'Sign In' : 'Sign Up',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: size.height * 0.2),
                  Center(
                    child: GlassContainer(
                      height: size.height * 0.55,
                      width: size.width * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedContainer(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Name',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(15),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                            ),
                          ),
                          if (!isSignInTab) SizedBox(height: 20),
                          if (!isSignInTab)
                            RoundedContainer(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'email',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                              ),
                            ),
                          SizedBox(height: 20),
                          RoundedContainer(
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(15),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  pass = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Add your authentication logic here
                              print('Button pressed');
                              if (isSignInTab) {
                                AwsAmplify().signInUser(name, pass);
                                setState(() {});
                              } else {
                                AwsAmplify().signUpUser(
                                    username: name,
                                    password: pass,
                                    email: email);
                              }
                            },
                            child: Text(isSignInTab ? 'Sign In' : 'Sign Up'),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isSignInTab = !isSignInTab;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  isSignInTab
                                      ? 'Create an account'
                                      : 'Already have an account? Sign in',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
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
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final Widget child;

  RoundedContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

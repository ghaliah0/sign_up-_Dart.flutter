import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 67, 126, 67)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
////////////
///
///
///
/// 
/// 
/// 

bool isSecured = true;

Map<String, User> users = {
  "bassam@gmail.com": User(email: 'bassam@gmail.com', password: '1234'),
  "anas@gmail.com": User(email: 'anas@gmail.com', password: 'a123'),
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 46, 46),
        title: Text(
          "Welcome back!",
          style: TextStyle(fontSize: 22,color:Colors.lightGreen,fontWeight: FontWeight.bold),
        ),
        centerTitle: true, 
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/login.png',
              width: 200,
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                
                children: [
                 
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text('Enter Email'),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.lightGreen, width: 1.0),
                 
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isSecured,
                    decoration: InputDecoration(
                      label: Text('Enter Password'),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSecured = !isSecured;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.lightGreen, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: isSecured,
                    decoration: InputDecoration(
                      label: Text('Confirm Password'),
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSecured = !isSecured;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.lightGreen, width: 1.0),
                        
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      User? user = users[emailController.text];
                      if (user != null &&
                          user.email == emailController.text &&
                          user.password == passwordController.text) {
                        print('Logged in successfully');
                      } else {
                        print('Email or password is incorrect');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromARGB(255, 111, 135, 112),
                          boxShadow: [
                               BoxShadow(
        color: Colors.black26, 
        blurRadius: 6, 
        offset: Offset(0, 4), 
      ),
                          ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(color: Color.fromARGB(189, 0, 0, 0), fontSize: 20),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.login,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String email;
  final String password;

  User({required this.email, required this.password});
}

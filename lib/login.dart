import 'package:flutter/material.dart';

import 'homePage.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String name="";

  bool changeButton =false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
        child: Column(
          children:[
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20),
              child: Image.asset("assets/images/log.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Welcome $name",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 30),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username"
                    ),
                    controller: _usernameController,
                    onChanged: (value){
                      name=value;
                      setState(() {

                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (){
                password=_passwordController.text.toString();
                if(name.isEmpty)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: Container(
                      padding: EdgeInsets.all(16),
                          height: 90,
                          decoration: const BoxDecoration(
                            color: Color(0xFFC72C41),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Text("Please enter username"),
                    )
                    ),
                  );
                }

                else if(password.isEmpty)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(
                            "Please enter password"
                        ))
                    );
                  }
                else
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const homepage();
                    }));
                  }

              },
              child: AnimatedContainer(
                  height: 45,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple,
                ),
                duration: const Duration(seconds: 1),
                child: const Text(
                    "Login",
                    style: TextStyle(
                    fontSize: 20,
                        color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
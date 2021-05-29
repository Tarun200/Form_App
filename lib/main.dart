import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amberAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Login form",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              fontFamily: "Oswald-Light",
            ),
          ),
          //backgroundColor: Colors.amberAccent,
        ),
        body: MyForm() ,
      ),
    );
  }
}
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible=false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your Username",
                        labelText: "Username",
                        icon: Icon(
                          Icons.verified_user,
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Valid Username';
                        }
                        return null;
                      },
                    ),


                SizedBox(
                  height: 30,
                ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Password",
                      labelText:"Password",

                      icon: Icon(
                        Icons.password,
                      ),
                      suffixIcon: InkWell(
                        child: Icon(
                          Icons.visibility_off_rounded,
                        ),
                        onTap: (){
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },


                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Valid Password';
                      }
                      return null;
                    },
                   obscureText: !_passwordVisible,
                  ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter your Email",
                    labelText:"Email",
                    icon: Icon(
                      Icons.mail_outlined,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Valid MailId';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter your Date of birth",
                    labelText:"DOB",
                    icon: Icon(
                      Icons.date_range,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Valid DOB';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),

                OutlineButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate())
                        {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      "Data being processed",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 30,
                                      fontFamily: "Oswald-Light",
                                    ),
                                  ),
                              ),
                          );
                        }
                    },
                    shape: StadiumBorder(),
                    borderSide: BorderSide(
                      color: Colors.amberAccent,
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontFamily: "Oswald-Light",
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    ),

              ],
            ),
          ),
    );
  }
}


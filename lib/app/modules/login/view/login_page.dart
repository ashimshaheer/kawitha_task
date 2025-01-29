import 'package:flutter/material.dart';
import 'package:kawika_machinetest/app/modules/login/view_model/login_provider.dart';
import 'package:kawika_machinetest/utils/common_widgets.dart';
import 'package:kawika_machinetest/utils/responsive.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Consumer<LoginProvider>(builder: (context, obj, _) {
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CommonTextWidget(
                  color: Colors.black,
                  text: 'Login',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 40,
                ),
                CommonTextFormField(
                  bgColor: Color(0xffF4F4F4),
                  hintText: 'Username',
                  keyboardType: TextInputType.emailAddress,
                  controller: obj.userController,
                  prefixIcon: Icon(Icons.email),
                  validator: (p0) {
                    if (p0!.isEmpty || p0 == '') {
                      return 'email is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CommonTextFormField(
                  bgColor: Color(0xffF4F4F4),
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  controller: obj.passwordController,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                  validator: (p0) {
                    if (p0!.isEmpty || p0 == '') {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: Responsive.height * 6,
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        obj.login(context: context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: CommonTextWidget(
                      color: Colors.white,
                      text: 'Login',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

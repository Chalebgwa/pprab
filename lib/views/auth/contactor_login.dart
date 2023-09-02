import 'package:flutter/material.dart';
import 'package:pprab/constants.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:responsive_ui/responsive_ui.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroungcolor,
      body: Responsive(
        children: [
          Div(
            divison: const Division(
              colL: 6,
              colM: 0,
              colS: 0,
            ),
            child: Container(
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Div(
            divison: const Division(
              colL: 6,
              colM: 12,
              colS: 12,
            ),
            child: SizedBox(
              height: size.height,
              child: const LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 13,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                'assets/logo1.png',

                height: 600,

                //scale: ,

                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 150, left: 150, top: 170),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(),
                const Padding(padding: EdgeInsets.only(bottom: 100)),
                const TextInput(
                  label: 'Email',
                  // value: form.email.value,
                  //errorText: form.email.error,
                  // onChanged: form.validateEmail,
                  placeholder: 'Johndoe@gmail.com',
                ),
                const SizedBox(
                  height: 50,
                ),
                const Div(
                  divison: Division(
                    colL: 12,
                    colM: 12,
                    colS: 12,
                  ),
                  child: TextInput(
                    label: 'Password',
                    // value: form.password.value,
                    // errorText: form.password.error,
                    // onChanged: form.validatePassword,
                    placeholder: '*************',
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Keep me signed in',
                      style: labelstyle,
                    ),
                    Text(
                      'Forgot password?',
                      style: labelstyleEmph,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FillButton(
                      onPressed: () async {
                        // if (form.isValid) {
                        //   final success = await form.postUsers();
                        //   if (success && mounted) {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(
                        //         content: Text('Sucess'),
                        //       ),
                        //     );
                        //   } else {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(
                        //         content: Text('Failed'),
                        //       ),
                        //     );
                        //   }
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Form is invalid'),
                        //     ),
                        //   );
                        // }
                      },
                      text: 'LOGIN',
                    ),
                    OutlineButton(
                      onPressed: () {
                        setState(() {
                          //  currentPage = 0;
                        });
                      },
                      text: 'Back',
                    ),
                  ],
                ),
                const Divider(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: faintlabel,
                    ),
                    Text(
                      'Register',
                      style: labelstyleEmph,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

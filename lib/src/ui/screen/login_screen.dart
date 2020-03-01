import 'package:flutter/material.dart';
import 'package:krappr/src/bloc/login_bloc.dart';
import 'package:krappr/src/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  LoginBloc bloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LOGIN),
      ),  
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(top: 25.0)),
            loginButton(bloc),
            signUpButton(bloc),
            loadingIndicator(bloc)
          ],
        ),
      ),
    );
  }
}

Widget loadingIndicator(LoginBloc bloc) => StreamBuilder<bool>(
      stream: bloc.loading,
      builder: (context, snap) {
        return Container(
          child:
              (snap.hasData && snap.data) ? CircularProgressIndicator() : null,
        );
      },
    );

Widget emailField(LoginBloc bloc) => StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snap) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
              labelText: EMAIL,
              hintText: ExampleEMAIL,
              errorText: snap.error),
        );
      },
    );

Widget passwordField(LoginBloc bloc) => StreamBuilder<String>(
    stream: bloc.password,
    builder: (context, snap) {
      return TextField(
        obscureText: true,
        onChanged: bloc.changePassword,
        decoration: InputDecoration(
            labelText: PASSWORD,
            hintText: ExamplePASSWORD,
            errorText: snap.error),
      );
    });

Widget loginButton(LoginBloc bloc) => StreamBuilder<bool>(
      stream: bloc.submitValid,
      builder: (context, snap) {
        return RaisedButton(
          onPressed: () async {
            await login(snap, bloc, context);
          },
          child: Text(
            LOGIN,
            style: Theme.of(context).textTheme.button,
          ),
          color: Theme.of(context).primaryColor,
        );
      },
    );

Widget signUpButton(LoginBloc bloc) => StreamBuilder<bool>(
      stream: bloc.submitValid,
      builder: (context, snap) {
        return RaisedButton(
          onPressed: () async {
            await signUp(snap, bloc, context);
          },
          child: Text(
            "Sign up",
            style: Theme.of(context).textTheme.button,
          ),
          color: Theme.of(context).primaryColor,
        );
      },
    );

Future<void> signUp(snap, LoginBloc bloc, context) async {
  print(snap);
  if (snap.hasData) {
    var successful = await bloc.signUp();
    if (!successful) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("That username and password combination is unavailable."),
      ));
    }
  }
}

Future<void> login(snap, LoginBloc bloc, context) async {
  if (snap.hasData) {
    var successful = await bloc.login();
    if (!successful) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Invalid email or password"),
      ));
    }
  }
}

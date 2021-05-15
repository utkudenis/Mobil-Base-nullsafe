import 'package:flutter/material.dart';

import 'login_fresh.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginFresh buildLoginFresh() {
    List<LoginFreshTypeLoginModel> listLogin = [
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            // develop what they want the facebook to do when the user clicks
          },
          logo: TypeLogo.facebook),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            // develop what they want the Google to do when the user clicks
          },
          logo: TypeLogo.google),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            print("APPLE");
            // develop what they want the Apple to do when the user clicks
          },
          logo: TypeLogo.apple),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            Navigator.of(_buildContext).push(MaterialPageRoute(
              builder: (_buildContext) => widgetLoginFreshUserAndPassword(),
            ));
          },
          logo: TypeLogo.userPassword),
    ];

    return LoginFresh(
      pathLogo: 'assets/logos/logo.png',
      isExploreApp: true,
      functionExploreApp: () {
        // develop what they want the ExploreApp to do when the user clicks
      },
      isFooter: false,
      widgetFooter: this.widgetFooter(),
      typeLoginModel: listLogin,
      isSignUp: true,
      widgetSignUp: this.widgetLoginFreshSignUp(),
    );
  }


   Widget widgetLoginFreshUserAndPassword() {  
    return LoginFreshUserAndPassword(  
              callLogin: (BuildContext _context, Function isRequest,  
                  String user, String password) {  
                isRequest(true);  
  
                Future.delayed(Duration(seconds: 2), () {  
                  print('-------------- function call----------------');  
                  print(user);  
                  print(password);  
                  print('-------------- end call----------------');  
  
                  isRequest(false);  
                });  
              },  
              logo: 'assets/logos/logo_head.png',  
              isFooter: false,  
              widgetFooter: this.widgetFooter(),  
              isResetPassword: true,  
              widgetResetPassword: this.widgetResetPassword(),  
              isSignUp: true,  
              signUp: this.widgetLoginFreshSignUp(),  
            );  
  }  

    Widget widgetResetPassword() {  
    return LoginFreshResetPassword(  
      logo: 'assets/logos/logo_head.png',  
      funResetPassword: (BuildContext _context, Function isRequest, String email) {  
        isRequest(true);  
  
        Future.delayed(Duration(seconds: 2), () {  
          print('-------------- function call----------------');  
          print(email);  
          print('-------------- end call----------------');  
          isRequest(false);  
  
        });  
      },  
  
      isFooter: false,  
      widgetFooter: this.widgetFooter(),  
    );  
  }  
  
  Widget widgetFooter() {  
    return LoginFreshFooter(  
      logo: 'assets/logos/logo_footer.png',  
      text: 'Power by',  
      funFooterLogin: () {  
        // develop what they want the footer to do when the user clicks  
  },  
    );  
  }  
  
  Widget widgetLoginFreshSignUp() {  
    return LoginFreshSignUp(  
      isFooter: false,  
        widgetFooter: this.widgetFooter(),  
        logo: 'assets/logos/logo_head.png',  
        funSignUp: (BuildContext _context, Function isRequest,  
            SignUpModel signUpModel) {  
          isRequest(true);  
  
          print(signUpModel.email);  
          print(signUpModel.password);  
          print(signUpModel.repeatPassword);  
          print(signUpModel.surname);  
          print(signUpModel.name);  
  
          isRequest(false);  
        });  
  }  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: buildLoginFresh(),
        ));
  }
}

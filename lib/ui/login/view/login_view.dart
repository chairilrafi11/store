import 'package:chairil/core/app/app.dart';
import 'package:chairil/ui/login/cubit/login_cubit.dart';
import 'package:chairil/ui/store_detail/store_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/util.dart';
import '../../component/component.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late String phoneNumber, password;
  bool isHiddenPassword = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? validatepass(value) {
    if (value!.isEmpty) {
      return "Password tidak boleh kosong";
    } else if (value.length < 6) {
      return "Minimal 6 Karakter";
    } else if (value.length > 15) {
      return "Maksimal 15 Karakter";
    } else {
      return null;
    }
  }

  void _tooglePasswordView() {
    isHiddenPassword = !isHiddenPassword;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorPalette.white,
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 5,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Chairil ',
                        style: TextStyle(
                            // fontFamily: Constant.avenirRegular,
                            color: ColorPalette.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.screenHeight / 16),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 15,
                      ),
                      _textFieldPhoneNumber(),
                      const SizedBox(
                        height: 20,
                      ),
                      _textFieldPassword(),
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 10),
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          child: GestureDetector(
                            child: Component.textBold(
                              'Lupa Kata Sandi?',
                              colors: ColorPalette.primary
                            )
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        height: SizeConfig.screenHeight / 20,
                        width: SizeConfig.screenWidth,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ColorPalette.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                          ),
                          onPressed: () {
                            context.read<LoginCubit>().onLogin(_phoneNumberController.text, _passwordController.text);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.screenHeight / 60
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Component.textDefault(
                              'App ver ${CoreVariable.appsVersionAndroid} : 1274981',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }

  Widget _textFieldPhoneNumber() {
    return TextFormField(
      controller: _phoneNumberController,
      style: TextStyle(
          fontSize: SizeConfig.screenHeight / 60, color: ColorPalette.primary),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      cursorColor: ColorPalette.primary,
      inputFormatters: [
        LengthLimitingTextInputFormatter(16),
        FilteringTextInputFormatter.deny(
          RegExp(
              r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        ),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return 'masukkan username';
        }
        if (value.length < 8) {
          return 'data tidak lengkap';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child: Icon(Icons.person, color: ColorPalette.primary),
        ),
        hintText: 'xxxxx',
        hintStyle: TextStyle(
          color: ColorPalette.primary,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: ColorPalette.primary),
        labelText: 'Username',
        fillColor: ColorPalette.primary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorPalette.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorPalette.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorPalette.primary),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return TextFormField(
      controller: _passwordController,
      style: TextStyle(
          fontSize: SizeConfig.screenHeight / 60, color: ColorPalette.primary),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: isHiddenPassword,
      cursorColor: ColorPalette.primary,
      inputFormatters: [
        LengthLimitingTextInputFormatter(20),
        FilteringTextInputFormatter.deny(
          RegExp(
              r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        ),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return 'masukkan password';
        }
        if (value.length < 8) {
          return 'data tidak lengkap';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child: Icon(Icons.lock, color: ColorPalette.primary),
        ),
        suffixIcon: IconButton(
            icon: Icon(
              isHiddenPassword ? Icons.visibility : Icons.visibility_off,
              color: ColorPalette.primary,
            ),
            onPressed: _tooglePasswordView),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: ColorPalette.primary,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: ColorPalette.primary),
        labelText: 'Password',
        fillColor: ColorPalette.primary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorPalette.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorPalette.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorPalette.primary),
        ),
      ),
    );
  }
}

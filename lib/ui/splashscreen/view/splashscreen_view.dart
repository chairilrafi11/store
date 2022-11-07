import 'package:chairil/core/app/app.dart';
import 'package:chairil/ui/splashscreen/cubit/splashscreen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/util.dart';
import '../../component/component.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => SplashscreenCubit(),
      child: BlocBuilder<SplashscreenCubit, SplashscreenState>(
        builder: (context, state) {
          return const Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorPalette.white,
            body: Center(
              child: Text(
                'Splashscreen',
                style: TextStyle(
                  // fontFamily: Constant.avenirRegular,
                  color: ColorPalette.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              ),
            ),
          );
        },
      )
    );
  }
}

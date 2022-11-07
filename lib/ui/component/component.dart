import 'package:chairil/core/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:nav_router/nav_router.dart';
import 'package:chairil/core/util/size_config.dart';
import 'package:flutter/material.dart';

class Component {

  static Text textBold(String content, {Color colors = Colors.black87,
    double fontSize = 15,
    int maxLines = 2,
    TextAlign textAlign = TextAlign.start}) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: colors,
        fontFamily: Constant.avenirRegular,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Text textDefault(
    String content,
    {Color colors = Colors.black54,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 2,
    TextAlign textAlign = TextAlign.start}) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        color: colors,
        fontFamily: Constant.avenirRegular,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static void dialogLoading() {
    showDialog(
      context: navGK.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10),
                const CupertinoActivityIndicator(),
                const SizedBox(height: 10),
                Text(
                  "Mohon Tunggu",
                  style: TextStyle(
                    color: ColorPalette.primary,
                    fontSize: SizeConfig.blockSizeHorizontal * 4),
                )
              ],
            )
          ),
        );
      },
    );
  }

  static info(String message) {
    return showDialog(
      context: navGK.currentContext!,
      barrierDismissible: true,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: const EdgeInsets.only(top: 10.0),
          content: Container(
            padding: const EdgeInsets.only(top: 10),
            width: 300.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Component.textBold("Tidak dapat masuk", fontSize: 17),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Component.textDefault(
                        message,
                        textAlign: TextAlign.center,
                        maxLines: 10
                      ),
                    )
                  ],
                ),
                // const SizedBox(height: 20,),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //   child: Component.button(
                //     label: "Mengerti", 
                //     onPressed: (){
                //       Navigator.of(navGK.currentContext!).pop();
                //     }
                //   ),
                // ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        );
      }
    );
  }

}
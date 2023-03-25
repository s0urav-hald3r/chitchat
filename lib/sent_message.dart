import 'package:chitchat/app_constants.dart';
import 'package:chitchat/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SentMessage extends StatelessWidget {
  final String? message;
  const SentMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth! * 0.7),
          decoration: BoxDecoration(
              color: AppConstants.greenColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15))),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(right: 20, bottom: 10),
          child: Text(
            message!,
            style: GoogleFonts.poppins(
              color: AppConstants.whiteColor,
              letterSpacing: 01,
              fontSize: SizeConfig.screenWidth! * 0.035,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

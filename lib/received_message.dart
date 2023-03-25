import 'package:chitchat/app_constants.dart';
import 'package:chitchat/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceivedMessage extends StatelessWidget {
  final String? message;
  const ReceivedMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth! * 0.7),
          decoration: BoxDecoration(
              color: AppConstants.greyColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15))),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            message!,
            style: GoogleFonts.poppins(
              color: AppConstants.blackColor,
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

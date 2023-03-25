import 'package:chitchat/app_constants.dart';
import 'package:chitchat/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageArea extends StatelessWidget {
  const MessageArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [ReceivedMessage(), SentMessage()],
    ));
  }
}

class SentMessage extends StatelessWidget {
  const SentMessage({Key? key}) : super(key: key);

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
            'Hi there, How are you!',
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

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    super.key,
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
            'Hi there, How are you!',
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

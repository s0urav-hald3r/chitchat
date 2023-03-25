import 'package:chitchat/app_constants.dart';
import 'package:chitchat/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBox extends StatelessWidget {
  MessageBox({super.key});

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! * 0.065,
      margin: EdgeInsets.only(
          left: 20, right: 20, bottom: SizeConfig.safeAreaBottom!),
      decoration: BoxDecoration(
          border: Border.all(color: AppConstants.greenColor),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              cursorColor: AppConstants.greenColor,
              autofocus: false,
              controller: messageController,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                  fontSize: SizeConfig.screenWidth! * 0.04,
                  letterSpacing: 01,
                  fontWeight: FontWeight.w500,
                  color: AppConstants.blackColor),
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                    height: 0, fontSize: 0, color: Colors.white),
                hintText: 'Type a message',
                hintStyle: GoogleFonts.poppins(
                  color: AppConstants.blackColor,
                  letterSpacing: 01,
                  fontSize: SizeConfig.screenWidth! * 0.04,
                  fontWeight: FontWeight.w500,
                ),
                counterText: '',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 20),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: SizeConfig.screenWidth! * 0.15,
              height: SizeConfig.screenHeight! * 0.065,
              margin: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                  color: AppConstants.greenColor,
                  border: Border.all(color: AppConstants.greenColor),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Icon(
                  Icons.send_rounded,
                  color: AppConstants.whiteColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

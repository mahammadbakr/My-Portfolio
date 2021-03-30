import 'package:flutter/material.dart';

mixin AppAssets {
  //images
  static final String back = 'images/back.png';
  static final String bgTop = 'images/bgTop.png';
  static final String me = 'images/favicon.png';

  //icons
  // static final String briefcase = 'icons/briefcase.png';
  // static final String call = 'icons/call.png';
  // static final String coding = 'icons/coding.png';
  // static final String coffee = 'icons/coffee.png';
  // static final String design = 'icons/design.png';
  // static final String DAA = 'icons/double-up-arrow.png';
  // static final String email = 'icons/email.png';
  // static final String facebook = 'icons/facebook.png';
  // static final String github = 'icons/github.png';
  // static final String happy = 'icons/happy.png';
  // static final String linkedIn = 'icons/linkedIn.png';
  // static final String list = 'icons/list.png';
  // static final String menu = 'icons/menu.png';
  // static final String pencil = 'icons/pencil.png';
  // static final String pin = 'icons/pin.png';
  // static final String twitter = 'icons/twitter.png';

}

mixin AppStyles {
  static final TextStyle title = TextStyle(
    color: AppColors.black.withOpacity(.8),
    fontSize: 35,
    fontWeight: FontWeight.w700,
  );
}

mixin AppColors {
  static final mainColor = Color(0xffd7385e);
  static final black = Colors.black87;
  static final blackBg = Color(0xff323232);
  static final greyLight = Colors.grey[100];
}

mixin AppLinks {
  static final String mail = 'mahammadbakr77@gmail.com';
  static final String phone = '(+964) 750 228 9291';
  static final String location = 'Erbil, Kurdistan, Iraq';
  static final String github = 'https://github.com/mahammadbakr';
  static final String linkedin = 'https://www.linkedin.com/in/mahammadbakr77';
  static final String twitter = 'https://twitter.com/mahammadbakr77';
  static final String facebook = 'https://www.facebook.com/mahammad.bakr';
  static final String cv =
      'https://drive.google.com/file/d/17X4tIQ8kPnfzyNE4eLCr7UgKnRtREQCy/view?usp=sharing';
}

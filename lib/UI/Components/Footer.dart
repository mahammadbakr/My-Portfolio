import 'package:flutter/material.dart';
import 'package:my_portfolio/Helper/Responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/projects.dart';
import '../../Constants.dart';

import 'Icon.dart';

class Footer extends StatelessWidget {
  final String _getInTouch =
      "You have an idea, I am here to turn your dream into real digital solution.";
 final String _description =
      " My Name is Mohammed Bakr, I’m Mid Level Developer, I Develop Mobile Applications using Flutter And Dart,Also i develop Native Android Applications with Java,I Planning to be MERN Full Stack Developer, I’ve been Experienced in Development Field Since Last years of my High School. One of my Biggest Hobbies is Writing Codes And Handling Errors.\n"
      "I Have long experience in development area, And i worked in some companies with long experience working as freelancer... ";

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        color: AppColors.blackBg,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 30,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 20,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(width: 7.5),
                          Text(
                            'Contact Me',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _getInTouch,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Email Address',
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        AppLinks.mail,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        AppLinks.phone,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Location',
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        AppLinks.location,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 20,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(width: 7.5),
                          Text(
                            'ABOUT ME',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _description,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 20,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(width: 7.5),
                          Text(
                            'Social Networks',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(children: _socialNetworks()),
                      const SizedBox(height: 20),

                      RaisedButton(
                        onPressed: _downloadCV,
                        color: AppColors.mainColor,
                        textColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Text('Download CV'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Divider(
              color: AppColors.greyLight.withOpacity(.75),
              thickness: .5,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Developed By Mohammed©${DateTime.now().year}    Using',
                      style: TextStyle(
                        color: AppColors.greyLight.withOpacity(.75),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Image.network("https://symbols.getvecta.com/stencil_80/73_flutter-icon.e47c886ff7.png",height: 20,)
                  ],
                ),
                Text(
                  '©COPYRIGHT ',
                  style: TextStyle(
                    color: AppColors.greyLight.withOpacity(.75),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
      mobileScreen: Container(
        color: AppColors.blackBg,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 30,
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 20,
                      color: AppColors.mainColor,
                    ),
                    const SizedBox(width: 7.5),
                    Text(
                      'Contact Me',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  _getInTouch,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Email Address',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  AppLinks.mail,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  AppLinks.phone,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Location',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  AppLinks.location,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            // Aout me
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 20,
                      color: AppColors.mainColor,
                    ),
                    const SizedBox(width: 7.5),
                    Text(
                      'ABOUT ME',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  _description,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // My projects
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 20,
                      color: AppColors.mainColor,
                    ),
                    const SizedBox(width: 7.5),
                    Text(
                      'Social Networks',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(children: _socialNetworks()),
                const SizedBox(height: 20),

                RaisedButton(
                  onPressed: _downloadCV,
                  color: AppColors.mainColor,
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 20),
                  child: Text('Download CV'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Divider(
              color: AppColors.greyLight.withOpacity(.75),
              thickness: .5,
            ),
            const SizedBox(height: 20),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _socialNetworks(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Developed By Mohammed©${DateTime.now().year}   Using',
                  style: TextStyle(
                    color: AppColors.greyLight.withOpacity(.75),
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.network("https://symbols.getvecta.com/stencil_80/73_flutter-icon.e47c886ff7.png",height: 20,)
              ],
            ),
            Text(
              '©COPYRIGHT ',
              style: TextStyle(
                color: AppColors.greyLight.withOpacity(.75),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }


  void _downloadCV() {
    launch(AppLinks.cv);
  }

  List<Widget> _socialNetworks() => [
    InkWell(
      onTap: () async {
        launch(AppLinks.github);
      },
      child: AppIcon("https://cdn0.iconfinder.com/data/icons/octicons/1024/mark-github-512.png"),
    ),
    const SizedBox(width: 20),
    InkWell(
      onTap: () {
        launch(AppLinks.linkedin);
      },
      child: AppIcon("https://freepikpsd.com/wp-content/uploads/2019/10/linked-in-icon-png-6-Transparent-Images.png"),
    ),
    const SizedBox(width: 20),
    InkWell(
      onTap: () {
        launch(AppLinks.twitter);
      },
      child: AppIcon("https://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png"),
    ),
    const SizedBox(width: 20),
    InkWell(
      onTap: () {
        launch(AppLinks.facebook);
      },
      child: AppIcon("https://lh3.googleusercontent.com/proxy/TzZOrpwf5xIAOrgnRBj1Uk7OnidZSulBhw4eeDo_8q5RXxtBjk2uhGIrgTLDdP8tgUEoQbceYU2vOMGkt60bmT42bKtgbq4eX-U-G9h3WCmT6yePrA"),
    ),
  ];
}

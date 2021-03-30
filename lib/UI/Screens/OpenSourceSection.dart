import 'package:flutter/material.dart';
import 'package:my_portfolio/Helper/Responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constants.dart';
import '../Components/Icon.dart';

class OpenSourceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 100,
        ),
        child: Column(
          children: [
            Text('Open Source Projects', style: AppStyles.title),
            Container(width: 100, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: __buildOpenProject(
                      context,
                      'Shine Beyond',
                      'Shine Beyond Package is a Flutter package that Used to make various type of animated designs For your List & Grid Views data when fetches and loading, One of the Advantages of using this Packages is You don\'t have to take a long time to organize and create.',
                      "https://gitlab.com/mahammadbakr77/shine-beyond/-/raw/main/assets/rotation.gif",
                      () {
                    launch("https://gitlab.com/mahammadbakr77/shine-beyond");
                  }),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: __buildOpenProject(
                      context,
                      'SlinkShot Clone',
                      'One of the applications i cloned, it is a social gaming platform for both android and IOS application,Which used to posting short video for gamers and streamers. ',
                      "https://gitlab.com/mahammadbakr77/slinkshot-clone/-/raw/master/assets/images/logo.jpg",
                      () {
                    launch("https://gitlab.com/mahammadbakr77/slinkshot-clone");
                  }),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: __buildOpenProject(
                      context,
                      'SlinkShot Clone Backend',
                      'The previous slinkshot app backend, i used node js and express js with Mongo db for database, it contain a RESTFULL Api and Crud as well ',
                      "https://gitlab.com/mahammadbakr77/slinkshot-clone/-/raw/master/assets/images/logo.jpg",
                      () {
                    launch("https://gitlab.com/mahammadbakr77/slinkshot-clone-backend");
                  }),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: __buildOpenProject(
                      context,
                      'Mobile-Technologies-Test',
                      'This Project Done for a Company which the app Contain Sql-lite data saving,Saving Images in path,High Validating rules and more.  ',
                      "https://gitlab.com/mahammadbakr77/flutternewtest/-/raw/master/assets/images/mobile-technologies.gif",
                      () {
                    launch("https://gitlab.com/mahammadbakr77/flutternewtest");
                  }),
                )
              ],
            ),
          ],
        ),
      ),
      mobileScreen: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            Text(
              'Open Source Projects',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            Container(width: 75, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 50),
            __buildOpenProject(
                context,
                'Shine Beyond',
                'Shine Beyond Package is a Flutter package that Used to make various type of animated designs For your List & Grid Views data when fetches and loading, One of the Advantages of using this Packages is You don\'t have to take a long time to organize and create.',
                "https://gitlab.com/mahammadbakr77/shine-beyond/-/raw/main/assets/rotation.gif",
                () {
              launch("https://gitlab.com/mahammadbakr77/shine-beyond");
            }),
            const SizedBox(height: 10),
            __buildOpenProject(
                context,
                'SlinkShot Clone',
                'One of the applications i cloned, it is a social gaming platform for both android and IOS application,Which used to posting short video for gamers and streamers. ',
                "https://gitlab.com/mahammadbakr77/slinkshot-clone/-/raw/master/assets/images/logo.jpg",
                () {
              launch("https://gitlab.com/mahammadbakr77/slinkshot-clone");
            }),
            const SizedBox(height: 10),
            __buildOpenProject(
                context,
                'SlinkShot Clone Backend',
                'The previous slinkshot app backend, i used node js and express js with Mongo db for database, it contain a RESTFULL Api and Crud as well ',
                "https://gitlab.com/mahammadbakr77/slinkshot-clone/-/raw/master/assets/images/logo.jpg",
                () {
              launch("https://gitlab.com/mahammadbakr77/slinkshot-clone-backend");
            }),
            const SizedBox(height: 10),
            __buildOpenProject(
                context,
                'Mobile-Technologies-Test',
                'This Project Done for a Company which the app Contain Sql-lite data saving,Saving Images in path,High Validating rules and more.  ',
                "https://gitlab.com/mahammadbakr77/flutternewtest/-/raw/master/assets/images/mobile-technologies.gif",
                () {
              launch("https://gitlab.com/mahammadbakr77/flutternewtest");
            }),
          ],
        ),
      ),
    );
  }

  Widget __buildOpenProject(BuildContext context, String title,
      String description, String image, Function function) {
    return GestureDetector(
      onTap: function,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Image.network(
                image,
                height: MediaQuery.of(context).size.height / 4,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}

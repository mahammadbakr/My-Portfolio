import 'package:flutter/material.dart';
import 'package:my_portfolio/Helper/Responsive.dart';

import '../../data/projects.dart';
import 'Icon.dart';

class Experiences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        height: 400,
        color: Colors.black.withOpacity(.7),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _buildStatistic(
              context,"https://cdn2.iconfinder.com/data/icons/font-awesome/1792/briefcase-512.png", '5+', 'Years of Experience'),
          _buildStatistic(context, "https://image.flaticon.com/icons/png/512/23/23772.png", '${PROJECTS.length}+',
              'Projects Done'),
          _buildStatistic(context,"https://icon-library.com/images/happy-icon-png/happy-icon-png-13.jpg", '50+', 'Happy Clients'),
        ]),
      ),
      mobileScreen: Container(
        color: Colors.black54,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            _buildStatistic(
                context, "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/briefcase-512.png", '5+', 'Years of Experience'),
            const SizedBox(height: 50),
            _buildStatistic(context, 'https://image.flaticon.com/icons/png/512/23/23772.png', '${PROJECTS.length}+',
                'Projects Done'),
            const SizedBox(height: 50),
            _buildStatistic(context, "https://icon-library.com/images/happy-icon-png/happy-icon-png-13.jpg", '50+', 'Happy Clients'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistic(
      BuildContext context, String icon, String total, String description) {
    return ResponsiveWidget(
      desktopScreen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(icon, size: 50),
          const SizedBox(height: 5),
          Text(
            total,
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      mobileScreen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(icon, size: 40),
          const SizedBox(height: 5),
          Text(
            total,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_portfolio/Helper/Responsive.dart';

import '../../Constants.dart';
import '../Components/Icon.dart';

class PlanningSection extends StatelessWidget {
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
            Text('My Planning', style: AppStyles.title),
            Container(width: 100, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: __buildPlan(context,"https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/pencil-512.png", 'Requirement gathering',
                      'Starting with researching and discovering the requirements of the system from users, customers, and other stakeholders'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: __buildPlan(context,"https://freepikpsd.com/wp-content/uploads/2019/10/design-icon-png-Transparent-Images.png", 'Prototyping',
                      'It is is an early sample, model, or release of a product built to test a concept or process, Which previously will show for the customer. '),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: __buildPlan(context, "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/code-512.png", 'Developing',
                      'It is also a process of planning a for new business system or replacing an existing system Also start coding and combining everything together.'),
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
              'My Planning',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            Container(width: 75, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 50),
            __buildPlan(context, "https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/pencil-512.png", 'Requirement gathering',
                'Starting with researching and discovering the requirements of the system from users, customers, and other stakeholders'),
            const SizedBox(height: 10),
            __buildPlan(context, "https://freepikpsd.com/wp-content/uploads/2019/10/design-icon-png-Transparent-Images.png", 'Prototyping',
                'It is is an early sample, model, or release of a product built to test a concept or process, Which previously will show for the customer. '),
            const SizedBox(height: 10),
            __buildPlan(context, "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/code-512.png", 'Developing',
                'It is also a process of planning a for new business system or replacing an existing system Also start coding and combining everything together.'),
          ],
        ),
      ),
    );
  }

  Widget __buildPlan(
      BuildContext context, String iconPath, String title, String description) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(iconPath, color: AppColors.black, size: 40),
            const SizedBox(height: 20),
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
            )
          ],
        ),
      ),
    );
  }
}

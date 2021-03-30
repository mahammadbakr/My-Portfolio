import 'package:flutter/material.dart';
import 'package:my_portfolio/Helper/Responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/skills.dart';
import '../../Constants.dart';


class AboutMeSection extends StatelessWidget {
  final String _avatar = AppAssets.me;
  final String _description =
      " My Name is Mohammed Bakr, I’m Mid Level Developer, I Develop Mobile Applications using Flutter And Dart,Also i develop Native Android Applications with Java,I Planning to be MERN Full Stack Developer, I’ve been Experienced in Development Field Since Last years of my High School. One of my Biggest Hobbies is Writing Codes And Handling Errors.\n"
      "I Have long experience in development area, And i worked in some companies with long experience working as freelancer... ";

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
            vertical: 100,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                      color: AppColors.greyLight,
                      child: Image.asset(
                        _avatar,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABOUT ME',
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _description,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: Colors.black.withOpacity(.7),
                                fontSize: 20,
                              ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            RaisedButton(
                              onPressed: () {},
                              color: AppColors.mainColor,
                              textColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: Text('HIRE ME NOW'),
                            ),
                            const SizedBox(width: 20),
                            RaisedButton(
                              onPressed: _downloadCV,
                              color: AppColors.black,
                              textColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: Text('VIEW RESUME'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Text('MY SKILLS', style: AppStyles.title),
              Container(width: 100, height: 2, color: AppColors.mainColor),
              const SizedBox(height: 3),
              Container(width: 75, height: 2, color: AppColors.mainColor),
              const SizedBox(height: 50),
              Wrap(
                spacing: 15,
                runSpacing: 10,
                runAlignment: WrapAlignment.spaceBetween,
                children: SKILLS.map(_buildSkill).toList(),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Container(
                  color: AppColors.greyLight,
                  child: Image.asset(
                    _avatar,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'ABOUT ME',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _description,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 14,
                    ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {},
                color: AppColors.mainColor,
                textColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Text('HIRE ME NOW'),
              ),
              const SizedBox(height: 20),
              RaisedButton(
                onPressed: _downloadCV,
                color: AppColors.black,
                textColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text('VIEW RESUME'),
              ),
              const SizedBox(height: 50),
              Text('MY SKILLS', style: AppStyles.title),
              Container(width: 75, height: 2, color: AppColors.mainColor),
              const SizedBox(height: 3),
              Container(width: 50, height: 2, color: AppColors.mainColor),
              const SizedBox(height: 25),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                children: SKILLS.map(_buildSkill).toList(),
              ),
            ],
          ),
        ),
      );

  void _downloadCV() {
    launch(AppLinks.cv);
  }

  Widget _buildSkill(Skill skill) => Chip(label: Text(skill.name));
}

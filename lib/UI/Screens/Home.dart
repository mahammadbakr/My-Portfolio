import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/Helper/Responsive.dart';

import 'package:url_launcher/url_launcher.dart';

import 'AboutMeSection.dart';
import 'ContactUsSection.dart';
import '../Components/Footer.dart';
import '../Components/Header.dart';
import '../Components/Icon.dart';
import 'MyProjectSection.dart';
import '../Components/Experiences.dart';
import 'OpenSourceSection.dart';
import 'PlanningSection.dart';
import '../../Constants.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _headerGlobalKey = GlobalKey();
  final _aboutMeGlobaleKey = GlobalKey();
  final _experiencesGlobaleKey = GlobalKey();
  final _planningGlobaleKye = GlobalKey();
  final _myProjectsGlobaleKey = GlobalKey();
  final _openSourceGlobaleKey = GlobalKey();
  final _contactUsGlobaleKey = GlobalKey();

  final _scrollController = ScrollController();

  final _fabStream = StreamController<bool>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _fabStream.sink.add(_scrollController.offset > 500);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.bgTop),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                key: _headerGlobalKey,
                titleSpacing: 0,
                toolbarHeight: 100,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.back),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black87,
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .15,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                      width: 40,
                      height: 40,
                      color: AppColors.mainColor,
                      child: Image.asset(AppAssets.me),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Header(),
                ),
                actions: [
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: _scrollToAboutMe,
                        highlightColor: Colors.white60,
                        child: Text(
                          'About Me',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToExaminations,
                        child: Text(
                          'Experience',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToPlanning,
                        child: Text(
                          'Planning',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToMyProjects,
                        child: Text(
                          'My Projects',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 20),
                      RaisedButton(
                        onPressed: _scrollToContactUs,
                        color: AppColors.mainColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        child: Text(
                          'Contact Me',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .15),
                ],
              ),
              ..._slivers(),
            ],
          ),
        ),
        floatingActionButton: _buildFloatingActionButton(),
      ),
      mobileScreen: Scaffold(
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.asset(
                      AppAssets.me,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: _scrollToAboutMe,
                  title: Text(
                    'About Me',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToExaminations,
                  title: Text(
                    'Experience',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToPlanning,
                  title: Text(
                    'Planning',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToMyProjects,
                  title: Text(
                    'My Projects',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                const SizedBox(height: 20),
                ListTile(
                  title: RaisedButton(
                    onPressed: _scrollToContactUs,
                    color: AppColors.mainColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    child: Text(
                      'Contact Me',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        launch(AppLinks.github);
                      },
                      child: AppIcon(
                       "https://cdn0.iconfinder.com/data/icons/octicons/1024/mark-github-512.png",
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        launch(AppLinks.linkedin);
                      },
                      child: AppIcon(
                        "https://freepikpsd.com/wp-content/uploads/2019/10/linked-in-icon-png-6-Transparent-Images.png",
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        launch(AppLinks.twitter);
                      },
                      child: AppIcon(
                        "https://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png",
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        launch(AppLinks.facebook);
                      },
                      child: AppIcon(
                       "https://lh3.googleusercontent.com/proxy/TzZOrpwf5xIAOrgnRBj1Uk7OnidZSulBhw4eeDo_8q5RXxtBjk2uhGIrgTLDdP8tgUEoQbceYU2vOMGkt60bmT42bKtgbq4eX-U-G9h3WCmT6yePrA",
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.bgTop),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                key: _headerGlobalKey,
                titleSpacing: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: Align(
                  child: Builder(
                    builder: (ctx) => InkWell(
                      onTap: () {
                        Scaffold.of(ctx).openDrawer();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Container(
                          width: 40,
                          height: 40,
                          color: AppColors.mainColor,
                          child: Image.asset(AppAssets.me),
                        ),
                      ),
                    ),
                  ),
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.back),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black87,
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(350),
                  child: Header(),
                ),
              ),
              ..._slivers(),
            ],
          ),
        ),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  List<Widget> _slivers() => [
        SliverToBoxAdapter(
          key: _aboutMeGlobaleKey,
          child: AboutMeSection(),
        ),
        SliverToBoxAdapter(
          key: _experiencesGlobaleKey,
          child: Experiences(),
        ),
        SliverToBoxAdapter(
          key: _planningGlobaleKye,
          child: PlanningSection(),
        ),
        SliverToBoxAdapter(
          key: _myProjectsGlobaleKey,
          child: MyProjectSection(),
        ),
        SliverToBoxAdapter(
          key: _openSourceGlobaleKey,
          child: OpenSourceSection(),
        ),
        SliverToBoxAdapter(
          key: _contactUsGlobaleKey,
          child: ContactUsSection(),
        ),
        SliverToBoxAdapter(
          child: Footer(),
        ),
      ];

  Widget _buildFloatingActionButton() {
    return StreamBuilder<bool>(
      stream: _fabStream.stream,
      builder: (_, data) {
        final bool show = data.hasData && data.data;
        return AnimatedOpacity(
          opacity: show ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: FloatingActionButton(
            onPressed: show
                ? _scrollToHeader
                : null, // make sure user cannot click when button hidden
            mini: true,
            child: AppIcon("https://d29fhpw069ctt2.cloudfront.net/icon/image/39098/preview.png", size: 20),
          ),
        );
      },
    );
  }

  void _scrollToHeader() {
    Scrollable.ensureVisible(
      _headerGlobalKey.currentContext,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToAboutMe() {
    Scrollable.ensureVisible(
      _aboutMeGlobaleKey.currentContext,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToExaminations() {
    Scrollable.ensureVisible(
      _experiencesGlobaleKey.currentContext,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToPlanning() {
    Scrollable.ensureVisible(
      _planningGlobaleKye.currentContext,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToMyProjects() {
    Scrollable.ensureVisible(
      _myProjectsGlobaleKey.currentContext,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToContactUs() {
    Scrollable.ensureVisible(
      _contactUsGlobaleKey.currentContext,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _fabStream.close();
    super.dispose();
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_portfolio/Helper/Responsive.dart';

import 'package:mailto/mailto.dart';
import 'package:my_portfolio/UI/Components/Icon.dart';

import '../../Constants.dart';

import '../../utils/extensions.dart';

class ContactUsSection extends StatefulWidget {
  @override
  _ContactUsSectionState createState() => _ContactUsSectionState();
}

class _ContactUsSectionState extends State<ContactUsSection> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        color: AppColors.greyLight,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 100,
        ),
        child: Column(
          children: [
            Text('Contact Me', style: AppStyles.title),
            Container(width: 100, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildContactInfo(
                       "https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-email-512.png",
                        'Email:',
                        AppLinks.mail,
                      ),
                      const SizedBox(height: 20),
                      _buildContactInfo(
                        "https://cdn1.iconfinder.com/data/icons/free-98-icons/32/call-512.png",
                        'Phone:',
                        AppLinks.phone,
                      ),
                      const SizedBox(height: 20),
                      _buildContactInfo(
                       "https://cdn2.iconfinder.com/data/icons/pittogrammi/142/94-512.png",
                        'Location:',
                        AppLinks.location,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _buildContactForm(context),
                ),
              ],
            )
          ],
        ),
      ),
      mobileScreen: Container(
        color: AppColors.greyLight,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 100,
        ),
        child: Column(
          children: [
            Text(
              'Contact Me',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            Container(width: 75, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.mainColor),
            const SizedBox(height: 50),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContactInfo(
                      "https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-email-512.png",
                      'Email:',
                      AppLinks.mail,
                    ),
                    const SizedBox(height: 20),
                    _buildContactInfo(
                     "https://cdn1.iconfinder.com/data/icons/free-98-icons/32/call-512.png",
                      'Phone:',
                      AppLinks.phone,
                    ),
                    const SizedBox(height: 20),
                    _buildContactInfo(
                     "https://cdn2.iconfinder.com/data/icons/pittogrammi/142/94-512.png",
                      'Location:',
                      AppLinks.location,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                _buildContactForm(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(String imagePath, String title, String content) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcon(imagePath, color: AppColors.black.withOpacity(.7), size: 20),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                content,
                style: TextStyle(color: AppColors.black.withOpacity(.7)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Have Something To Write?',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 25),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,

                      validator: (text) {
                        return (text.isValidName())
                            ? null
                            : 'Please insert valid name!';
                      },
                      decoration: InputDecoration(
                        hintText: 'Your Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      validator: (text) {
                        return (text.isValidEmail)
                            ? null
                            : 'Please insert valid email!';
                      },
                      decoration: InputDecoration(
                        hintText: 'Your Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _contentController,

                minLines: 3,
                maxLines: 10,
                validator: (text) {
                  return (text.isValidName(minLength: 10))
                      ? null
                      : 'Please insert valid message!, at least 10 characters';
                },
                decoration: InputDecoration(
                  hintText: 'Your Message',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              RaisedButton(
                color: AppColors.mainColor,
                textColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                onPressed: () async{
                 await  _sendMail(context);
                },
                child: Text('Send'),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> _sendMail(BuildContext context) async {
    bool isValidForm = _formKey.currentState.validate();
    if (!isValidForm) return;

    warningAlert(context: context, label: "Thank you", content: "Thank you for your Message we appreciate it... ");
    setState(() {
      _nameController.clear();
      _emailController.clear();
      _contentController.clear();
    });


    // final mailto = Mailto(
    //   to: [AppLinks.mail],
    //   subject: _nameController.text.trim(),
    //   body: _contentController.text.trim(),
    // );
    //
    // final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
    // String renderHtml(Mailto mailto) =>
    //     '''<html><head><title>mailto example</title></head><body><a href="$mailto">Open mail client</a></body></html>''';
    // await for (HttpRequest request in server) {
    //   request.response
    //     ..statusCode = HttpStatus.ok
    //     ..headers.contentType = ContentType.html
    //     ..write(renderHtml(mailto));
    //   await request.response.close();
    // }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}



warningAlert({BuildContext context, String label, String content }) {
  return showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        ),
        child: Container(
          height: 250,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white70,
                  child: Image.network("https://pngimg.com/uploads/thank_you/thank_you_PNG66.png",width: 90,height: 90,color: AppColors.mainColor,),
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.greyLight,
                  child: SizedBox.expand(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(label,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(content,
                                style: TextStyle(
                                  color: Colors.black87,
                                    fontSize: 16

                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          RaisedButton(
                            color: Colors.white,
                            child: Text('Okay'),
                            onPressed: ()=> {
                              Navigator.of(context).pop()
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
  );
}
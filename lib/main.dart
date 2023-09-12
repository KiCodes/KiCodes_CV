import 'package:flutter/material.dart';
import 'package:kicodes_cv/constants/custom_text.dart';
import 'package:kicodes_cv/constants/my_strings.dart';
import 'package:kicodes_cv/constants/user_profile.dart';
import 'package:kicodes_cv/edit_screen.dart';
import 'package:kicodes_cv/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyStrings.title,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _fullNameController;
  late TextEditingController _roleController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _slackController;
  late TextEditingController _gitHubController;
  late TextEditingController _bioController;
  String role = MyStrings.role;
  late String fullName;
  late String phone;
  String email = MyStrings.email;
  String slackName = MyStrings.slackName;
  String gitHubHandle = MyStrings.slackName;
  String bio = MyStrings.bio;
  List<String> technicalSkillsList = MyStrings.skills;
  late UserProfile userProfile;

  @override
  void initState() {
    super.initState();
    fullName = MyStrings.title;
    phone = MyStrings.phone;
    userProfile = UserProfile(
      fullName: fullName,
      role: role,
      phone: phone,
      email: email,
      slackName: slackName,
      gitHubHandle: gitHubHandle,
      bio: bio,
      technicalSkillsList: technicalSkillsList,
    );
    _fullNameController = TextEditingController(text: userProfile.fullName);
    _roleController = TextEditingController(text: userProfile.role);
    _phoneController = TextEditingController(text: userProfile.phone);
    _emailController = TextEditingController(text: userProfile.email);
    _slackController = TextEditingController(text: userProfile.slackName);
    _gitHubController = TextEditingController(text: userProfile.slackName);
    _bioController = TextEditingController(text: userProfile.bio);
    technicalSkillsList = userProfile.technicalSkillsList;
  }

  void navigateToEditProfile(UserProfile userProfile) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          userProfile: userProfile,
          onSaveCallback: (updatedProfile) {
            setState(() {
              userProfile = updatedProfile;
              _fullNameController.text = updatedProfile.fullName;
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _roleController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _slackController.dispose();
    _gitHubController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: CustomText(
          label: '${_fullNameController.text}\'s CV',
        ),
        actions: [
          IconButton(
              onPressed: () {
                userProfile = UserProfile(
                  fullName: _fullNameController.text,
                  role: _roleController.text,
                  phone: _phoneController.text,
                  email: _emailController.text,
                  slackName: _slackController.text,
                  gitHubHandle: _gitHubController.text,
                  bio: _bioController.text,
                  technicalSkillsList: technicalSkillsList,
                );

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      userProfile: userProfile,
                      onSaveCallback: (UpdatedUserProfile) {
                        setState(() {
                          _bioController.text = UpdatedUserProfile.bio;
                          _fullNameController.text = UpdatedUserProfile.fullName;
                          _gitHubController.text = UpdatedUserProfile.gitHubHandle;
                          _slackController.text = UpdatedUserProfile.slackName;
                          _emailController.text = UpdatedUserProfile.email;
                          _phoneController.text = UpdatedUserProfile.phone;
                          _roleController.text = UpdatedUserProfile.role;
                          technicalSkillsList = UpdatedUserProfile.technicalSkillsList;
                        });
                      },
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.edit,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Container(
                width: mediaQuery.width * 0.35,
                height: mediaQuery.height,
                decoration: BoxDecoration(color: Colors.black),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //slack
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/slack_icon.png',
                                  height: 20,
                                ),
                                CustomText(
                                  label: 'SLACK:',
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            ),
                            height: 30,
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4)),
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: CustomText(
                                label: _slackController.text,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                    //github
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/github.png',
                                  height: 20,
                                ),
                                CustomText(
                                  label: MyStrings.gitHubHome,
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            ),
                            height: 30,
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4)),
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: CustomText(
                                label: _gitHubController.text,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                    //role
                    Container(
                      child: CustomText(label: MyStrings.roleLabel),
                      height: 30,
                      alignment: Alignment.topCenter,
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.4)),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomText(
                          label: _roleController.text,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //contact
                    Container(
                      child: CustomText(label: MyStrings.contactLabel),
                      margin: EdgeInsets.only(bottom: 10),
                      height: 30,
                      alignment: Alignment.topCenter,
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.4)),
                    ),
                    //phone email
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(7, 2, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              label: MyStrings.phoneLabel,
                              fontSize: 17,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: CustomText(
                                label: _phoneController.text,
                                fontSize: 16,
                              ),
                            ),
                            CustomText(
                              label: MyStrings.emailLabel,
                              fontSize: 17,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: CustomText(
                                label: _emailController.text,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: mediaQuery.width * 0.65,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(right: 10, left: 10),
                              height: 30,
                              width: mediaQuery.width,
                              color: Colors.black.withOpacity(0.4),
                              child: CustomText(
                                label: MyStrings.bioLabel,
                                fontSize: 18,
                                color: Colors.black,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomText(
                              label: bio,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        height: 30,
                        width: mediaQuery.width,
                        color: Colors.black.withOpacity(0.4),
                        child: CustomText(
                          label: MyStrings.techSkillsLabel,
                          fontSize: 18,
                          color: Colors.black,
                        )),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: technicalSkillsList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                technicalSkillsList[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              contentPadding:
                                  EdgeInsets.only(left: 10, right: 10),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.4),
                              thickness: 1,
                              height: 0.2,
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

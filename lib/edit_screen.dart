import 'package:flutter/material.dart';
import 'package:kicodes_cv/constants/custom_text.dart';
import 'package:kicodes_cv/constants/my_strings.dart';
import 'package:kicodes_cv/constants/user_profile.dart';

class EditProfilePage extends StatefulWidget {
  final UserProfile userProfile;

  final Function(UserProfile) onSaveCallback;

  EditProfilePage({required this.userProfile, required this.onSaveCallback});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _slackController = TextEditingController();
  TextEditingController _gitHubController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  List<String> _technicalSkillsList = [];

  @override
  void initState() {
    super.initState();

    // Initialize text controllers with user profile data.
    _fullNameController.text = widget.userProfile.fullName;
    _roleController.text = widget.userProfile.role;
    _phoneController.text = widget.userProfile.phone;
    _emailController.text = widget.userProfile.email;
    _slackController.text = widget.userProfile.slackName;
    _gitHubController.text = widget.userProfile.gitHubHandle;
    _bioController.text = widget.userProfile.bio;

    // Initialize the technical skills list.
    _technicalSkillsList = List.from(widget.userProfile.technicalSkillsList);
  }

  void addSkill(String skill) {
    setState(() {
      _technicalSkillsList.add(skill);
    });
  }

  Future<void> _showSkillInputDialog() async {
    String newSkill = '';
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(
            label: MyStrings.addNewSkill,
            color: Colors.white,
          ),
          content: TextField(
            onChanged: (value) {
              newSkill =
                  value; // Update the newSkill variable when the user types.
            },
            decoration: InputDecoration(
                labelText: MyStrings.skillName,
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyan, width: 2)),
                labelStyle: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                )),
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Colors.red),),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog.
              },
            ),
            TextButton(
              child: Text('Add', style: TextStyle(color: Colors.green)),
              onPressed: () {
                if (newSkill.isNotEmpty) {
                  addSkill(newSkill);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: CustomText(label: MyStrings.successList, color:  Colors.white,fontWeight: FontWeight.w300, fontSize: 13,),
                      duration: Duration(seconds: 3),
                    ),
                  );

                  Navigator.of(context).pop(); // Close the dialog.
                }
              },
            ),
          ],
          backgroundColor: Colors.black,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            MyStrings.editCV,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 15,
              ),
              SaveButton(fullNameController: _fullNameController, roleController: _roleController, phoneController: _phoneController, emailController: _emailController, slackController: _slackController, gitHubController: _gitHubController, bioController: _bioController, technicalSkillsList: _technicalSkillsList, widget: widget),
              SizedBox(
                height: 15,
              ),
              //fullname
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: MyStrings.fullNameLabel,
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              //role
              TextField(
                controller: _roleController,
                decoration: InputDecoration(
                  labelText: MyStrings.roleLabel,
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              //phone
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: MyStrings.phoneLabel,
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              //email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: MyStrings.emailLabel,
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              //SLACK
              TextField(
                controller: _slackController,
                decoration: InputDecoration(
                  labelText: MyStrings.slackLabel,
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              //'GITHUB HANDLE:'
              TextField(
                controller: _gitHubController,
                decoration: InputDecoration(
                  labelText: MyStrings.githubLabel,
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              //bio
              TextField(
                controller: _bioController,
                decoration: InputDecoration(
                  labelText: MyStrings.bioLabel,
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              //technical skills
              CustomText(label: MyStrings.techSkillsLabel),
              TextButton(
                onPressed: () {
                  _showSkillInputDialog();
                },
                child: Text(
                  MyStrings.addNewSkill,
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              ReorderableListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemCount: _technicalSkillsList.length,
                itemBuilder: (context, index) {
                  final skill = _technicalSkillsList[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29.0),
                      side: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        strokeAlign: 2
                      )
                    ),
                    key: Key(skill),
                    color: Colors.transparent,
                    child: ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.drag_handle,
                            color: Colors.blue,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                label: skill,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                _technicalSkillsList.removeAt(index);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: CustomText(
                                      label: MyStrings.rmvLbl,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final skill = _technicalSkillsList.removeAt(oldIndex);
                    _technicalSkillsList.insert(newIndex, skill);
                  });
                },
              ),
              SaveButton(fullNameController: _fullNameController, roleController: _roleController, phoneController: _phoneController, emailController: _emailController, slackController: _slackController, gitHubController: _gitHubController, bioController: _bioController, technicalSkillsList: _technicalSkillsList, widget: widget),
            ],
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required TextEditingController fullNameController,
    required TextEditingController roleController,
    required TextEditingController phoneController,
    required TextEditingController emailController,
    required TextEditingController slackController,
    required TextEditingController gitHubController,
    required TextEditingController bioController,
    required List<String> technicalSkillsList,
    required this.widget,
  }) : _fullNameController = fullNameController, _roleController = roleController, _phoneController = phoneController, _emailController = emailController, _slackController = slackController, _gitHubController = gitHubController, _bioController = bioController, _technicalSkillsList = technicalSkillsList;

  final TextEditingController _fullNameController;
  final TextEditingController _roleController;
  final TextEditingController _phoneController;
  final TextEditingController _emailController;
  final TextEditingController _slackController;
  final TextEditingController _gitHubController;
  final TextEditingController _bioController;
  final List<String> _technicalSkillsList;
  final EditProfilePage widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final updatedUserProfile = UserProfile(
          fullName: _fullNameController.text,
          role: _roleController.text,
          phone: _phoneController.text,
          email: _emailController.text,
          slackName: _slackController.text,
          gitHubHandle: _gitHubController.text,
          bio: _bioController.text,
          technicalSkillsList: _technicalSkillsList,
        );

        widget.onSaveCallback(updatedUserProfile);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: CustomText(label: MyStrings.success, color: Colors.white, fontWeight: FontWeight.w300, fontSize: 13,),
            duration: Duration(seconds: 3),
          ),
        );

        Navigator.pop(context);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.green)
      ),
      child: Text(MyStrings.save, style: TextStyle(color: Colors.white),),
    );
  }
}

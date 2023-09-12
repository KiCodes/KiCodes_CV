class UserProfile {
  String fullName;
  String role;
  String phone;
  String email;
  String slackName;
  String gitHubHandle;
  String bio;
  List<String> technicalSkillsList;

  UserProfile({
    required this.fullName,
    required this.role,
    required this.phone,
    required this.email,
    required this.slackName,
    required this.gitHubHandle,
    required this.bio,
    required this.technicalSkillsList,
  });
}

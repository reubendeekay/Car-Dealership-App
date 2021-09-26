class UserModel {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final String imageUrl;
  final DateTime dateOfBirth;
  final bool isAdmin;
  final String nationalId;
  final String userId;
  final String jobTitle;

  const UserModel({
    this.userId,
    this.fullName,
    this.email,
    this.password,
    this.phoneNumber,
    this.imageUrl,
    this.isAdmin,
    this.nationalId,
    this.dateOfBirth,
    this.jobTitle,
  });
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.id,
    this.userRole,
    this.birthDate,
    this.address,
  });

  String firstName;
  String lastName;
  String phone;
  String email;
  String id;
  String userRole;
  DateTime birthDate;
  Map address;

  factory User.fromMap(Map<dynamic, dynamic> value, String id) {
    return User(
      firstName: value['firstName'],
      lastName: value['lastName'],
      phone: value['phone'],
      email: value['email'],
      userRole: value['userRole'],
      birthDate: value['birthDate'],
      address: value['address'],
    );
  }

  fromMap(Map<dynamic, dynamic> value) {
    return User(
      firstName: value['firstName'],
      lastName: value['lastName'],
      phone: value['phone'],
      email: value['email'],
      userRole: value['userRole'],
      birthDate: value['birthDate'],
      address: value['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'userRole': userRole,
      'birthDate': birthDate,
      'address': address,
    };
  }

  Map<String, dynamic> toMapUpdate(User user, Map<String, dynamic> address) {
    Map<String, dynamic> data = {};

    if (user.firstName != null) {
      data.addAll({'firstName': user.firstName});
    }
    if (user.lastName != null) {
      data.addAll({'lastName': user.lastName});
    }
    if (user.phone != null) {
      data.addAll({'phone': user.phone});
    }
    if (user.email != null) {
      data.addAll({'email': user.email});
    }
    if (user.userRole != null) {
      data.addAll({'userRole': user.userRole});
    }
    if (user.birthDate != null) {
      data.addAll({'birthDate': user.birthDate});
    }
    if (address != null) {
      data.addAll({'address': address});
    }
    return data;
  }
}

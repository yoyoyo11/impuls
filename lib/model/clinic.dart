class Clinic {
  Clinic(
      {this.id,
      this.address,
      this.email,
      this.phone,
      this.manager,
      this.name,
      this.phone2,
      this.notes});
  final String id;
  final Map address;
  final String email;
  final String phone;
  final String manager;
  final String name;
  final String phone2;
  final String notes;

  factory Clinic.fromMap(Map<dynamic, dynamic> value, String id) {
    if (value == null) {
      return null;
    }
    final String id = value['id'];
    if (id == null) {
      return null;
    }
    // final Map address = value['address'];
    // if (address == null) {
    //   return null;
    // }
    final String email = value['email'];
    if (email == null) {
      return null;
    }
    final String phone = value['phone'];
    if (phone == null) {
      return null;
    }
    final String manager = value['manager'];
    if (manager == null) {
      return null;
    }
    final String name = value['name'];
    if (name == null) {
      return null;
    }
    final String phone2 = value['phone2'];
    if (phone2 == null) {
      return null;
    }
    final String notes = value['notes'];
    if (notes == null) {
      return null;
    }
    return Clinic(
      id: value['id'],
      address: value['address'],
      email: value['email'],
      phone: value['phone'],
      manager: value['manager'],
      name: value['name'],
      phone2: value['phone2'],
      notes: value['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'email': email,
      'phone': phone,
      'manager': manager,
      'name': name,
      'phone2': phone2,
      'notes': notes,
    };
  }
}

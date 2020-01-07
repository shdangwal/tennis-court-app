class Student {
  final int id;
  final String name;
  final int phone;

  Student({
    this.id,
    this.name,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }

  @override
  String toString() {
    return 'Student{id: $id, name: $name, phone: $phone}';
  }
}

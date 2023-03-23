


class Student {
  int rollNo;
  String name;

  Student({
    required this.rollNo,
    required this.name,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    rollNo: json["rollNo"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "rollNo": rollNo,
    "name": name,
  };


  @override
  String toString() {
    // TODO: implement toString
    return """
    id: $rollNo,
    name: $name
    ----------------------------------
    """;
  }
}
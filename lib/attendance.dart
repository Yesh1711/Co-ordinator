class UserFields{
  static final String name = 'Name';
  static final String date = 'Date';

  static List<String> getFields() => [name, date];
}

class User{
  final String name;
  final String date;

  const User({
    required this.name,
    required this.date,
});
  Map<String, dynamic> toJson() => {
    UserFields.name: name,
    UserFields.date: date,
  };
}
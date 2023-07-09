class Contact {
  String name;
  String email;
  String phoneNumber;
  bool isFavourite;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.isFavourite= false,
  });
}

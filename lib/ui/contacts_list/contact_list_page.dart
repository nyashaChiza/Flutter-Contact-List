import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import '../../data/contact.dart';

class ContactsListPage extends StatefulWidget {
  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  late final List<Contact> _contacts;

  @override
  void initState() {
    super.initState();
    _contacts = List.generate(50, (index) {
      return Contact(
        name: faker.person.name(),
        phoneNumber: faker.randomGenerator.integer(1000000).toString(),
        email: faker.internet.email(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_contacts[index].name),
            subtitle: Text(_contacts[index].email),
            trailing: IconButton(
              icon: Icon(
                _contacts[index].isFavourite ? Icons.star : Icons.star_border,
                color:
                    _contacts[index].isFavourite ? Colors.amber : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _contacts[index].isFavourite = !_contacts[index].isFavourite;
                  _contacts.sort((a, b) {
                    if (a.isFavourite) {
                      return -1;
                    } else if (b.isFavourite) {
                      return 1;
                    } else {
                      return 0;
                    }
                  });
                });
              },
            ),
          );
        },
      ),
    );
  }
}
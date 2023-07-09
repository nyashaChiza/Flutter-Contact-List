import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    key: key,
    @required List<Contact> contacts,
  })  : _contacts = contacts,
        super(key: key);
  final List<Contact> _contacts;
  @overide
  Widget Build(BuildContext context) {
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
  }
}

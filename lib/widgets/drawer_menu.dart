import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String image = faker.image
        .image(width: 150, height: 150, keywords: ['people'], random: true)
        .toString();

    return Drawer(
      backgroundColor: const Color(0xffEFD593),
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 12.0,
                  child: ClipRRect(
                    child: Image.network(image),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_today,
              size: 30.0,
            ),
            title: const Text(
              'Book',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 30.0,
            ),
            title: const Text(
              'Jobs',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.work,
              size: 30.0,
            ),
            title: const Text(
              'History',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              // Todo: Navigate to user appointment history
            },
          ),
          const Expanded(child: SizedBox()),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 30.0,
            ),
            title: const Text(
              'Account',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              // Todo: Navigate to account screen
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              size: 30.0,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}

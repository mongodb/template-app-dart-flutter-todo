// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:flutter_todo/realm/app_services.dart';

class TodoAppBar extends StatelessWidget with PreferredSizeWidget {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppServices>(context);

    Future<void> logOut() async {
      await app.logOutUser();
      Navigator.pushNamed(context, '/login');
    }

    return AppBar(
        title: const Text('Realm Flutter Todo'),
        automaticallyImplyLeading: false,
        actions: app.currentUser != null
            ? <Widget>[
                IconButton(
                  icon: const Icon(Icons.logout),
                  tooltip: 'Log Out Icon',
                  onPressed: logOut,
                ),
              ]
            : null);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

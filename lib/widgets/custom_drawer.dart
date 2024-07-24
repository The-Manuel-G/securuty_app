import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Undercover App',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            leading: Icon(Icons.warning),
            title: Text('Emergency'),
            onTap: () {
              Navigator.pushNamed(context, '/emergency');
            },
          ),
          ListTile(
            leading: Icon(Icons.games),
            title: Text('Card Game'),
            onTap: () {
              Navigator.pushNamed(context, '/card_game');
            },
          ),
        ],
      ),
    );
  }
}

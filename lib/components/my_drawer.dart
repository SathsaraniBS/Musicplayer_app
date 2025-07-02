import 'package:flutter/material.dart';
import 'package:musical_instrument_app/pages/setting_page.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // home title
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: Text(
                "H O M E",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              leading: Icon(Icons.home),
              onTap: () => Navigator.pop(context),
                // handle HOME tap
              
            ),
          ),

          // settings title
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 0),
            child: ListTile(
              title: Text(
                "S E T T I N G S",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              leading: Icon(Icons.settings),
              onTap: () {

                //pop  drawer
                Navigator.pop(context);

                //navigate to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingPage(),
                  ),
                  );

              } 
            ),
          ),
        ],
      ),
    );
  }
}
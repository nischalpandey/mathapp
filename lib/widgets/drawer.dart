import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

final imgurl =
    "https://yt3.ggpht.com/7P9Lgi-zGzr_uN3OYe2IWZOuR1MjH8qHEvemrTPs7CP7R1RF14J5H2vkXHkuQYwE1gfJ1KAVxg=s88-c-k-c0x00ffffff-no-rj";

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgurl),
                ),
                accountName: Text("Nischal"),
                accountEmail: Text("nischalpandey@gamil.com")),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/sub");
            },
            leading: Icon(Icons.shop_2),
            title: Text("Subscription"),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/contact");
            },
            leading: Icon(Icons.contact_page),
            title: Text("Contact"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"),
          ),
        ],
      ),
    );
  }
}

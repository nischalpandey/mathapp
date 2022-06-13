import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/Screens/contact.dart';
import 'package:math/Screens/exc.dart';
import 'package:math/utils/routes.dart';

import 'package:math/widgets/drawer.dart';
import 'package:math/utils/artical.dart';
import 'package:http/http.dart' as http;

import 'package:html/dom.dart' as dom;

import 'package:flutter/services.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future getdata() async {
    final url = Uri.parse(
        "http://www.khullakitab.com/sukunda-pustak-bhawan/solutions/grade-11/mathematics/5/solutions");
    final respone = await http.get(url);

    dom.Document html = dom.Document.html(respone.body);
    final titles = html
        .querySelectorAll(
            '.sidebar-offcanvas.sidebar-nav.no-margin > ul > li > h3 > a')
        .map((element) => element.innerHtml.trim())
        .toList();

    final urls = html
        .querySelectorAll(
            '.sidebar-offcanvas.sidebar-nav.no-margin > ul > li > h3 > a')
        .map(
            (element) => 'https://kullakitab.com/${element.attributes['href']}')
        .toList();
    // ignore: unused_local_variable
    final exc = html
        .querySelectorAll(
            '.sidebar-offcanvas.sidebar-nav.no-margin > ul > li > h3 > a')
        .map(
            (element) => 'https://kullakitab.com/${element.attributes['href']}')
        .toList();

    // ignore: avoid_print
    print("count:${titles.length}");
    setState(() {
      articles = List.generate(titles.length,
          (index) => Article(url: urls[index], title: titles[index]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Math App",
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              // Navigation bar
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark
              // Status bar
              ),
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("About"),
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.contact);
                    },
                  ),
                  PopupMenuItem(child: Text("Lisences")),
                ];
              },
            )
          ],
          title: Text("Mero Math"),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        drawerEdgeDragWidth: 30,
        drawerEnableOpenDragGesture: true,
        drawer: Mydrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Text(
                "Chapters:",
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (articles.isEmpty)
              Expanded(
                child: Center(
                  child: const CircularProgressIndicator(),
                ),
              )
            else
              //Text("Hello")

              Expanded(
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final article = articles[index];

                    if (index.isOdd) {
                      return Divider();
                    }

                    final id = index ~/ 2 + 1;

                    return Card(
                      elevation: 0.3,
                      child: ListTile(
                          leading: CircleAvatar(child: Text("${id}")),
                          title: Text(
                            article.title,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homedetails(
                                        link: article.url,
                                        chapter: article.title,
                                      )))),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

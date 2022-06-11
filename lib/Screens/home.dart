import 'dart:async';
import 'package:flutter/material.dart';

import 'package:math/artical.dart';
import 'package:http/http.dart' as http;

import 'package:html/dom.dart' as dom;
import 'package:fluttertoast/fluttertoast.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Math App"),
        ),
        drawer: Drawer(
            backgroundColor: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text("Welcome to math app"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/contact");
                    },
                    child: Text("Click"))
              ],
            )),
        body: articles.isEmpty
            ? Center(
                child: const CircularProgressIndicator(),
              )
            :
            //Text("Hello")

            ListView.builder(
                itemCount: articles.length,
                padding: EdgeInsets.only(top: 16.0),
                itemBuilder: (context, index) {
                  final article = articles[index];

                  if (index.isOdd) {
                    return Divider();
                  }

                  final id = index ~/ 2 + 1;

                  return ListTile(
                    leading: CircleAvatar(child: Text("${id}")),
                    title: Text(
                      article.title,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => Fluttertoast.showToast(msg: '${article.url}'),
                  );
                },
              ),
      ),
    );
  }
}

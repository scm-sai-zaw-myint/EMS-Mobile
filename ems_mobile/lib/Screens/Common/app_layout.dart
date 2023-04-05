// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  String title;
  Widget content;
  BottomNavigationBar? bar;
  bool? noBottomBar;
  AppLayout({super.key, this.noBottomBar, required this.title, required this.content});

  BottomAppBar? _bottomAppBar(){
    bool check = noBottomBar??true;
    return check ? BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: <Widget>[
              IconButton(onPressed: () {
              }, icon: const Icon(Icons.dashboard)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.list)),
              const SizedBox(width: 30,),
              IconButton(onPressed: (){}, icon: const Icon(Icons.list)),
              IconButton(onPressed: (){}, icon: Image.asset("assets/images/profile.png", width: 23,))
            ]
          ),
      ):null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
      floatingActionButton: noBottomBar??true ? FloatingActionButton(onPressed: (){},
      child: const Icon(Icons.dashboard),
      ):null,
      bottomNavigationBar: _bottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

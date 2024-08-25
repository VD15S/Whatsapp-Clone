import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Pages/chatpage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 140, 126),
        title: Text(
          "Whatsapp Clone",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          PopupMenuButton<String>(
              iconColor: Colors.white,
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(child: Text("New Group"), value: "New group"),
                  PopupMenuItem(
                      child: Text("New Broadcast"), value: "New Broadcast"),
                  PopupMenuItem(
                      child: Text("Whatsap Web"), value: "Whatsap Web"),
                  PopupMenuItem(
                      child: Text("Starred Messages"),
                      value: "Starred Messages"),
                  PopupMenuItem(child: Text("Settings"), value: "Settings")
                ];
              })
        ],
        bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
              Tab(
                child: Text("CHATS", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text("STATUS", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text("CALLS", style: TextStyle(color: Colors.white)),
              ),
            ]),
      ),
      body: TabBarView(controller: _controller, children: [
        Text("Camera"),
        ChatPage(),
        Text("Status"),
        Text("Calls")
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call API Test"),
        backgroundColor: Colors.green,
      ),
      body: GridView.count(
        // // itemCount: users.length,
        // // itemBuilder: (context, index) {
        // //   final user = users[index];
        // //   final userTitle = user['name']['title'];
        // //   final userFirst = user['name']['first'];
        // //   final userLast = user['name']['last'];
        // //   final userFullName = '$userTitle $userFirst $userLast';
        // //   final email = user['email'];
        // //   final avatarUrl = user['picture']['thumbnail'];
        //   return ListTile(
        //     leading: ClipRRect(
        //       borderRadius: BorderRadius.circular(100),
        //       child: Image.network(avatarUrl),
        //     ),
        //     title: Text(userFullName),
        //     subtitle: Text(email),

        //   );
        // },
        //),
        crossAxisCount: 3,
        children: List.generate(5, (index) {
          return Container(
            child: Card(
              color: Colors.red,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUser,
        backgroundColor: Colors.green,
        child: const Icon(Icons.supervised_user_circle),
      ),
    );
  }

  void fetchUser() async {
    print("fetching user data");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
  }
}

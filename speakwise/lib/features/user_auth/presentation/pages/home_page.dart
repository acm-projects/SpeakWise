import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("HomePage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _createData(UserModel(
                  username: "Henry",
                  age: 21,
                  adress: "London",
                ));
              },
              child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Create Data",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            StreamBuilder<List<UserModel>>(
              stream: _readData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.isEmpty) {
                  return const Center(child: Text("No Data Yet"));
                }
                final users = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: users.map((user) {
                      return ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            _deleteData(user.id!);
                          },
                          child: const Icon(Icons.delete),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            _updateData(UserModel(
                              id: user.id,
                              username: "John Wick",
                              adress: "United States of America",
                            ));
                          },
                          child: const Icon(Icons.update),
                        ),
                        title: Text(user.username!),
                        subtitle: Text(user.adress!),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/login");
                Fluttertoast.showToast(
                  msg: "Successfully signed out",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // any list updated to this stream will be automatically updated
  Stream<List<UserModel>> _readData() {
    final userCollection = FirebaseFirestore.instance.collection("users");
    return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs
        .map((doc) => UserModel.fromSnapshot(doc))
        .toList());
  }

  void _createData(UserModel userModel) async {
    final userCollection = FirebaseFirestore.instance.collection("users");
    String id = userCollection.doc().id;
    final newUser = userModel.copyWith(id: id).toJson();
    await userCollection.doc(id).set(newUser);
  }

  void _updateData(UserModel userModel) async {
    final userCollection = FirebaseFirestore.instance.collection("users");
    final newData = userModel.toJson();
    await userCollection.doc(userModel.id).update(newData);
  }

  void _deleteData(String id) async {
    final userCollection = FirebaseFirestore.instance.collection("users");
    await userCollection.doc(id).delete();
  }
}

class UserModel {
  final String? username;
  final String? adress;
  final int? age;
  final String? id;

  UserModel({this.id, this.username, this.adress, this.age});

  UserModel copyWith({
    String? id,
    String? username,
    String? adress,
    int? age,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      adress: adress ?? this.adress,
      age: age ?? this.age,
    );
  }

  static UserModel fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      username: data['username'],
      adress: data['adress'],
      age: data['age'],
      id: snapshot.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "age": age,
      "id": id,
      "adress": adress,
    };
  }


  

}

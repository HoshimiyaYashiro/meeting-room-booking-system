import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wuthering Waves Character Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Phoebe_Profile.webp'),
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      'Phoebe',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent[700],
                        fontFamily: 'Baron Neue',
                      ),
                      textAlign: TextAlign.right,
                      
                    ),
                    Text(
                      'Acolyte of the Order',
                      style: TextStyle(fontSize: 14, color: Colors.amberAccent[700]),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyProfileCard extends StatelessWidget {
  const MyProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/Phoebe_Avatar.jpg'),
          ),
          Text('Phoebe', style: TextStyle(fontSize: 24)),
          Text('Acolyte of the Order', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

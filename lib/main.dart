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
      debugShowCheckedModeBanner: false,
      title: 'Project Food Recipe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Food Recipe'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                // print here
              },
            )
          ],
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Column(
              children: [
                TextHeader(),
                ImageSection(
                    image: 'assets/images/food.png',
                    playImage: 'assets/images/play.png'),
                StarRating(ratings: '4,5', reviews: '(300 Reviews)'),
                ProfileFollow(
                  profileImage: 'assets/images/profile.png',
                  username: 'Jackson Ezekiel',
                  location: 'Sawyer, Jacksonville',
                  followButton: 'Follow',
                )
              ],
            )));
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Text(
        'How to make french toast',
        softWrap: true,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image, required this.playImage});

  final String image;
  final String playImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            image,
            width: 400.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ),
        Image.asset(
          playImage,
          width: 50.0,
          height: 50.0,
        )
      ],
    );
  }
}

class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.ratings, required this.reviews});

  final String ratings;
  final String reviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(children: [
        const Icon(
          Icons.star,
          color: Colors.orangeAccent,
          size: 14,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(ratings,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              )),
        ),
        Text(reviews,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            )),
      ]),
    );
  }
}

class ProfileFollow extends StatelessWidget {
  const ProfileFollow(
      {super.key,
      required this.profileImage,
      required this.username,
      required this.location,
      required this.followButton});

  final String profileImage;
  final String username;
  final String location;
  final String followButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(profileImage),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(username,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 16.0, color: Colors.red),
                          Text(
                            location,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // print here
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: Colors.red.shade700,
                  minimumSize: const Size(50.0, 45.0),
                ),
                child: Text(followButton,
                    style: const TextStyle(color: Colors.white)),
              )
            ],
          )
        ],
      ),
    );
  }
}

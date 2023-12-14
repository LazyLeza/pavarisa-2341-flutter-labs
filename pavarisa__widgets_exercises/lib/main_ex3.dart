import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class PetName extends StatelessWidget {
  final String name;
  final String imageUrl; // Add the image URL parameter
  const PetName(this.name, this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 199, 167, 129),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                name,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 10), // Add spacing between text and image
          Image.network(
            imageUrl,
            width: 90, // Adjust width as needed
            height: 90, // Adjust height as needed
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Pet App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Pet App'),
          backgroundColor:
              Theme.of(context).colorScheme.tertiary, // Change color as needed
          centerTitle: true,
        ),
        body: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PetName('Bird', 'https://i.redd.it/skp4oigfw3u01.jpg'),
              PetName('Dog',
                  'https://th.bing.com/th/id/OIP.Xz0EqBxG4a10yKT7ARbsGgHaEc?rs=1&pid=ImgDetMain'),
              PetName('Cat',
                  'https://www.newshub.co.nz/home/lifestyle/2019/08/the-top-five-cat-memes-of-all-time-rated/_jcr_content/par/video/image.dynimg.1280.q75.jpg/v1565234972425/KNOWYOURMEME-sad-cat-crying-1120.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}

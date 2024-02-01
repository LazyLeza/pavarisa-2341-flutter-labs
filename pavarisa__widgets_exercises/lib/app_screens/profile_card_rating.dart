import 'package:flutter/material.dart';

class ProfileCardRating extends StatelessWidget {
  const ProfileCardRating({Key? key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return PortraitProfileCard();
    } else {
      return LandscapeProfileCard();
    }
  }
}

class PortraitProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Celeb'),
        backgroundColor: Colors.orange[400],
      ),
      // title: const Text('My Favorite Celeb'),
      body: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.orange[50],
          // ignore: prefer_const_constructors
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                flex: 1,
                child: ContactImage(
                  imageUrl:
                      "https://img.kapook.com/u/2021/jutharat/a1/zdd41_1.jpg",
                  name: "Ann",
                ),
              ),
              ContactInfo(
                addName: "Ann's place",
                addInfo: "Bangkok, Thailand, 10250",
                phone: "(086) 906 2366",
                email: "maryann_soyao@yahoo.com",
              ),
              Rating(defaultColor: Colors.black, ratingColor: Colors.orange),
            ],
          )),
    );
  }
}

class LandscapeProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.orange[50],
      child: const Row(
        children: [
          // Left half for ContactImage
          Expanded(
            flex: 1,
            child: ContactImage(
              imageUrl: "https://img.kapook.com/u/2021/jutharat/a1/zdd41_1.jpg",
              name: "Ann",
            ),
          ),

          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top half for ContactInfo
                Expanded(
                  flex: 3,
                  child: ContactInfo(
                    addName: "Ann's place",
                    addInfo: "Bangkok, Thailand, 10250",
                    phone: "(086) 906 2366",
                    email: "maryann_soyao@yahoo.com",
                  ),
                ),
                // Bottom half for Rating
                Expanded(
                  flex: 1,
                  child: Rating(
                      defaultColor: Colors.black, ratingColor: Colors.orange),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactImage extends StatelessWidget {
  final String imageUrl;
  final String name;

  const ContactImage({Key? key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: const Alignment(0.6, 0.6),
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 250,
          ),
          Positioned(
            bottom: 50,
            left: 200,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black45,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final String addName;
  final String addInfo;
  final String phone;
  final String email;

  const ContactInfo({
    Key? key,
    required this.addName,
    required this.addInfo,
    required this.phone,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(addName,
                  style: const TextStyle(fontWeight: FontWeight.w400)),
              subtitle: Text(addInfo,
                  style: const TextStyle(fontWeight: FontWeight.w300)),
              leading: Icon(
                Icons.apartment,
                color: Colors.brown[400],
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(phone,
                  style: const TextStyle(fontWeight: FontWeight.w400)),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.brown[400],
              ),
            ),
            ListTile(
              title: Text(email,
                  style: const TextStyle(fontWeight: FontWeight.w400)),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.brown[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Rating extends StatelessWidget {
  final Color defaultColor;
  final Color ratingColor;

  const Rating({required this.defaultColor, required this.ratingColor});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      margin: isPortrait ? const EdgeInsets.all(40) : const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => Icon(
            Icons.star,
            color: ratingColor,
            size: 30,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../components/LabelText.dart';

class InstagramCard extends StatelessWidget {
  const InstagramCard(
      {super.key,
      required this.userProfileImage,
      required this.feedImage,
      required this.favoriteCount,
      required this.description,
      required this.title});
  final String userProfileImage;
  final String feedImage;
  final String favoriteCount;
  final String description;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: CircleAvatar(
                  radius: 15.0,
                  child: Image(
                      image: NetworkImage(userProfileImage),
                      height: 30,
                      width: 30,
                      fit: BoxFit.fill),
                ),
              ),
              LabelText(label: title, variant: 'content'),
              const Icon(
                Icons.more_vert,
                size: 30.0,
                color: Colors.white,
              )
            ],
          ),
        ),
        Image(
          image: NetworkImage(feedImage),
          height: 300,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.messenger_outline,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.message,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              LabelText(label: favoriteCount, variant: 'secondarySubTitle'),
              LabelText(label: description, variant: 'content')
            ],
          ),
        ),
      ],
    );
  }
}

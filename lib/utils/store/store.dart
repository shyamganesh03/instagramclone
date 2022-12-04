import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Feeds {
  Feeds({
    required this.userProfileImage,
    required this.feedImage,
    required this.favoriteCount,
    required this.description,
    required this.title,
  });
  final String userProfileImage;
  final String feedImage;
  final String favoriteCount;
  final String description;
  final String title;
}

class UserDetails {
  UserDetails({
    required this.userName,
    required this.userId,
    required this.feeds,
    required this.savedFeeds,
    required this.favoriteFeeds,
  });
  final String userName;
  final String userId;
  final List feeds;
  final List savedFeeds;
  final List favoriteFeeds;
}

class StoreController extends GetxController {
  final user = <UserDetails>[].obs;
  final allFeeds = <Feeds>{}.obs;
  getUser(userId) async {
    try {
      final response = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .snapshots();
      UserDetails(
          userName: 'response',
          userId: 'response',
          feeds: ['response'],
          savedFeeds: ['response'],
          favoriteFeeds: ['response']);
    } catch (error) {}
  }

  updateUser(
    requestBody,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user[0].userId)
          .set(requestBody);
    } catch (error) {}
  }

  getAllFeeds() async {
    try {
      final response = FirebaseFirestore.instance
          .collection('AllFeeds')
          .doc('feeds')
          .snapshots();
      Feeds(
        userProfileImage: '',
        description: '',
        favoriteCount: '',
        feedImage: '',
        title: '',
      );
    } catch (error) {}
  }
}

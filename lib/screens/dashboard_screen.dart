import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagramclone/utils/auth.dart';
import '../utils/store/store.dart';
import '../utils/colors.dart';
import '../components/InstagramCard.dart';
import '../components/LabelText.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  ThemeColor color = ThemeColor();
  final Auth auth = Auth();
  final StoreController storeController = Get.put(StoreController());
  @override
  void initState() {
    super.initState();
    var currentUser = auth.getCurrentAuthenticator();
    storeController.getUser(currentUser.email);
    storeController.getAllFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.backgroundSurface,
      appBar: AppBar(
        backgroundColor: color.backgroundSurface,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 22,
              width: 22,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  border: Border.all(color: Colors.white)),
              child: const Icon(
                Icons.add,
                size: 20.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: const Icon(Icons.power_settings_new_sharp),
                iconSize: 22.0,
                onPressed: () => auth.signOut(),
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LabelText(label: 'Instagram', variant: 'secondaryTitle'),
            ],
          ),
        ),
        leadingWidth: 110.0,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: storeController.allFeeds.length,
              itemBuilder: (BuildContext context, int index) => Container())),
    );
  }
}

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newtest/utils/color.dart';
import 'package:newtest/view/page1/flashcard.dart';

class Chatpage extends StatelessWidget {
  const Chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> Chat = [
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took.",
      "Lorem Ipsum is simply dummy ",
      "Lorem Ipsum is simply dummy ",
      "Lorem Ipsum is simply dummy ",
      "Lorem Ipsum is simply dummy "
    ];
    var dsize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: dsize.height * .1,
              width: dsize.width * .1,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/chat.png"))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "JOHN DOE",
                  style: TextStyle(color: balckcol, fontSize: 20),
                ),
                Text(
                  "online",
                  style: TextStyle(color: primarycolor, fontSize: 15),
                ),
              ],
            )
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        leading: IconButton(
            onPressed: () {
              Get.to(() => flashcard());
            },
            icon: Icon(Icons.close)),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: Chat.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Align(
          alignment:
              (index + 1).isOdd ? Alignment.centerRight : Alignment.centerLeft,
          child: Row(
            children: [
              index.isOdd
                  ? Container(
                      height: dsize.height * .1,
                      width: dsize.width * .1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("images/chat.png"))),
                    )
                  : SizedBox(),
              Expanded(
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: (index + 1).isOdd ? sendcard : reccard,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${Chat[index]}",
                      style: TextStyle(
                          color: (index + 1).isEven ? sendcard : reccard),
                    ),
                  ),
                ),
              ),
              index.isEven
                  ? Container(
                      height: dsize.height * .1,
                      width: dsize.width * .1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "images/thanos-pal-cFbNlpRZKi0-unsplash.jpg"))),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [Icons.keyboard, Icons.arrow_forward_ios_outlined],
        activeIndex: 0,
        onTap: (p0) {
          print(p0);
          if (p0 == 0) {
            SystemChannels.textInput.invokeMethod("TextInput.show");
          }
        },
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primarycolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        child: Image.asset("images/chat.png"),
        onPressed: () {},
      ),
    );
  }
}

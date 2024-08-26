import 'package:carousel_slider/carousel_slider.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:get/get.dart';
import 'package:newtest/controller/flashcontroller/Flash%20controller.dart';
import 'package:newtest/view/page2/chat.dart';

import '../../utils/color.dart';

class flashcard extends StatelessWidget {
  const flashcard({super.key});

  @override
  Widget build(BuildContext context) {
    var dsize = MediaQuery.of(context).size;
    List<String> words = ["name1", "name2", "name3"];
    List<String> wordsm = ["meaning1", "meaning2", "meaning3"];
    List<String> wordsp = [
      "pronunciation1",
      "pronunciation2",
      "pronunciation3"
    ];

    List<FlipCardController> flipControllers = List.generate(
      words.length,
      (index) => FlipCardController(),
    );

    CarouselSliderController carouselController = CarouselSliderController();
    var controller = Get.put(FlashController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: dsize.height * .2,
        centerTitle: true,
        leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape:
                  CircleBorder(side: BorderSide(color: textcolorw, width: 4)),
              padding: EdgeInsets.all(20),
              backgroundColor: primarycolor,
            ),
            onPressed: () {},
            child: Icon(
              Icons.arrow_back_ios,
              color: textcolorw,
            )),
        backgroundColor: primarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(180, 80),
          ),
        ),
        title: Text(
          "Flash Card",
          style: TextStyle(color: textcolorw),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: dsize.height * .05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Everyday Phrases",
                style: TextStyle(
                    color: balckcol, fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                width: 30,
              ),
              Obx(
                () => DashedCircularProgressBar(
                  child: Center(
                      child: Text(
                          "${controller.currentindex.value}/${words.length}")),
                  corners: StrokeCap.butt,
                  foregroundColor: primarycolor,
                  backgroundColor: greycol,
                  height: 50,
                  width: 50,
                  progress: 5,
                  maxProgress: 15,
                ),
              )
            ],
          ),
          SizedBox(
            height: dsize.height * .05,
          ),
          Expanded(
            child: CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: wordsp.length,
              itemBuilder: (context, index, realIndex) {
                return FlipCard(
                  frontWidget: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: dsize.height * .05,
                          ),
                          Text(
                            '${words[index]}',
                            style: TextStyle(fontSize: 28, color: textcolorw),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.speaker_2,
                                color: textcolorw,
                              ),
                              Text(
                                '${wordsp[index]}',
                                style:
                                    TextStyle(fontSize: 28, color: textcolorw),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: textcolorw,
                                borderRadius: BorderRadius.circular(15)),
                            child: IconButton(
                                onPressed: () {
                                  flipControllers[index].flipcard();
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: balckcol,
                                )),
                          ),
                          SizedBox(
                            height: dsize.height * .05,
                          )
                        ],
                      )),
                  backWidget: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${wordsm[index]}',
                              style: TextStyle(fontSize: 25, color: textcolorw),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: textcolorw,
                                  borderRadius: BorderRadius.circular(15)),
                              child: IconButton(
                                  onPressed: () {
                                    flipControllers[index].flipcard();
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: balckcol,
                                  )),
                            ),
                          ],
                        ),
                      )),
                  controller: flipControllers[index],
                  rotateSide: RotateSide.right,
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  controller.currentindex.value = index + 1;
                },
                height: 400.0,
                enlargeCenterPage: true,
                autoPlay: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  child: Text(
                    "Previous",
                    style: TextStyle(color: primarycolor),
                  ),
                  onPressed: () {
                    carouselController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                ),
                MaterialButton(
                  child: Text(
                    "next page",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Get.to(() => Chatpage());
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                ),
                MaterialButton(
                  child: Text(
                    "Next",
                    style: TextStyle(color: primarycolor),
                  ),
                  onPressed: () {
                    carouselController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

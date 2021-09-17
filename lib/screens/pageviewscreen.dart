import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/myData/cachehelper.dart';
import 'package:shop_app2/screens/login/loginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    List titles = [
      "Sign up for best online App  ",
      "Best quality with good offers ",
      "You will buy every thing online here "
    ];
    List images = [
      "https://image.freepik.com/free-psd/blank-screen-smart-phone-mockup-with-online-shopping_1150-38968.jpg",
      "https://image.freepik.com/free-vector/season-sale_62951-24.jpg",
      "https://image.freepik.com/free-photo/woman-red-hat-black-trousers-light-blouse-laughs-poses-with-packages-after-shopping_197531-17593.jpg"
    ];

    return PageView.builder(
      controller: pageController,
      //itemCount: 0,
      itemBuilder: (context, index) {
        return Scaffold(
          appBar: AppBar(title: Text("Salla"),),
          body: Container(decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.deepPurple[800],
                  Colors.deepPurple[700],
                  Colors.deepPurple[600],
                  Colors.deepPurple[400],
                ],
              )
          ),
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${titles[index]} ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  //Image(image: AssetImage("${images[index]}")) ,
                  Image(image: NetworkImage("${images[index]}")),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(controller: pageController, count: 3),
                      Spacer(),
                      Container(
                        height: 50,
                        width: 90,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.deepOrange),
                            ),
                            onPressed: () {
                              if (index < 2) {
                                pageController.nextPage(
                                    duration: Duration(microseconds: 400),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              } else {
                                CacheHelper.saveData(key: "onBoarding", value: true) .then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                }) ;
                              }
                            },
                            child: Text("Next..")),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

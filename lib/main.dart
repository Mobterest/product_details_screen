import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  List details = [
    "Immersive listening",
    "Hear every detail",
    "Distortionless playback",
    "Active Noise Cancellation",
    "Personalized Spatial Audio with dynamic head tracking"
  ];
  String displayImage = "assets/headphone1.png";
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Details',
      theme: ThemeData(
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: GoogleFonts.poppins().fontFamily),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: CircularRevealAnimation(
                    animation: animation,
                    centerOffset: const Offset(130, 100),
                    child: Bounceable(
                        onTap: () {
                          setState(() {
                            displayImage =
                                (displayImage == "assets/headphone1.png")
                                    ? "assets/headphone2.png"
                                    : "assets/headphone1.png";
                          });
                        },
                        child: Image.asset(displayImage)),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Accessories",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const Text(
                "Airpods Max",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.purple,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(details.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "⚈ ${details[index]}",
                    ),
                  );
                }),
              ),
              const Spacer(),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price"),
                        Text(
                          "\$549.00",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.bottomRight,
                    height: 50,
                    width: 170,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

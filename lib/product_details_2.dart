import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class ProductDetails2 extends StatefulWidget {
  const ProductDetails2({super.key});

  @override
  State<ProductDetails2> createState() => _ProductDetails2State();
}

class _ProductDetails2State extends State<ProductDetails2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFC0CB),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFC0CB),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.pink.withOpacity(0.1),
                    radius: 100,
                  ),
                ),
                Center(
                  child: ShakeWidget(
                      duration: const Duration(seconds: 15),
                      shakeConstant: ShakeSlowConstant2(),
                      autoPlay: true,
                      enableWebMouseHover: true,
                      child: Image.asset(
                        "assets/coke.png",
                        height: 300,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Coca-Cola bottle",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                              .animate()
                              .fade(duration: 500.ms)
                              .scale(delay: 500.ms),
                          const Spacer(),
                          const Text(
                            "\$ 2.50",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                      Text(
                        loremIpsum(words: 40),
                        style: const TextStyle(wordSpacing: 1),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Divider(
                          thickness: 1.0,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.info_outline,
                          size: 30,
                        ),
                        title: const Text("About product"),
                        subtitle: const Text("Average 330 ML"),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              size: 30,
                            )),
                      ),
                      Row(
                        children: [
                          const ItemCounter(),
                          const Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: const StadiumBorder()),
                              onPressed: () {},
                              child: const Text("Add to cart"))
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class ItemCounter extends StatefulWidget {
  const ItemCounter({super.key});

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int _initialValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: ItemCount(
        initialValue: _initialValue,
        minValue: 0,
        maxValue: 10,
        decimalPlaces: 0,
        color: Colors.red,
        textStyle: const TextStyle(fontSize: 16),
        buttonSizeHeight: 30,
        buttonSizeWidth: 35,
        onChanged: (value) {
          setState(() {
            _initialValue = value as int;
          });
        },
      ),
    );
  }
}


// https://pub.dev/packages/flutter_custom_clippers
// https://pub.dev/packages/flutter_animate
// https://pub.dev/packages/flutter_shakemywidget
// https://pixabay.com/images/search/coke%20bottle/
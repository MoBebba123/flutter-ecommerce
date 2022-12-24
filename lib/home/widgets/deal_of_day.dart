import 'package:ecommerce/constants/global_variables.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  _DealOfDayState createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              GlobalVariables.carouselImages[2],
              height: 235,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$100',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'Apple Iphone 11',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: GlobalVariables.carouselImages.map((i) {
              return Builder(
                  builder: (BuildContext context) => Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            i,
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                        ),
                      ));
            }).toList(),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      width: sizeWidth,
      height: sizeHeight * 0.16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: sizeHeight * 0.02,
          ),
          Container(
            height: sizeHeight * 0.1,
            margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.04),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.only(right: sizeWidth * 0.05),
                  height: sizeHeight * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: sizeHeight * 0.07,
                        width: sizeHeight * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image(
                              image: AssetImage('assets/icons/schools.png'),
                              height: sizeHeight * 0.04),
                        ),
                      ),
                      Text('Schools',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: sizeWidth * 0.05),
                  height: sizeHeight * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: sizeHeight * 0.07,
                        width: sizeHeight * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image(
                              image: AssetImage('assets/icons/design.png'),
                              height: sizeHeight * 0.04),
                        ),
                      ),
                      Text('Design',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: sizeWidth * 0.05),
                  height: sizeHeight * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: sizeHeight * 0.07,
                        width: sizeHeight * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image(
                              image: AssetImage('assets/icons/gym.png'),
                              height: sizeHeight * 0.04),
                        ),
                      ),
                      Text('Gym',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: sizeWidth * 0.05),
                  height: sizeHeight * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: sizeHeight * 0.07,
                        width: sizeHeight * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image(
                              image: AssetImage('assets/icons/business.png'),
                              height: sizeHeight * 0.04),
                        ),
                      ),
                      Text('Business',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

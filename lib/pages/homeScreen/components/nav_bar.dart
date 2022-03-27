import 'package:flutter/material.dart';
import 'package:todo_fitness/pages/authentication/signIn/sign_in_screen.dart';
import 'package:todo_fitness/pages/profile/profile_screen.dart';
import 'package:todo_fitness/utils/constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool? _visible = false;
  bool? search = false;

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(
                height: sizeHeight * 0.08,
              ),
              Container(
                height: sizeHeight * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _visible = true;
                          print('maska');
                        });
                      },
                      child: Container(
                        child: Image(
                          image: AssetImage('assets/icons/menu.png'),
                          height: sizeHeight * 0.027,
                          width: sizeHeight * 0.027,
                        ),
                      ),
                    ),
                    Container(
                      width: sizeWidth * 0.8,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IgnorePointer(
                            ignoring: search!,
                            child: AnimatedOpacity(
                              opacity: search! ? 1 : 0,
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                width: sizeWidth * 0.6,
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: primaryColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      hintText: 'Search',
                                      hintStyle: TextStyle(fontSize: 12)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  search == false
                                      ? search = true
                                      : search = false;
                                });
                              },
                              child: search == false
                                  ? Image(
                                      image:
                                          AssetImage('assets/icons/search.png'),
                                      height: sizeHeight * 0.027,
                                      width: sizeHeight * 0.027,
                                    )
                                  : Image(
                                      image:
                                          AssetImage('assets/icons/close.png'),
                                      height: sizeHeight * 0.022,
                                      width: sizeHeight * 0.022,
                                    ),
                            ),
                          ),
                          Container(
                            child: Image(
                              image:
                                  AssetImage('assets/icons/notification.png'),
                              height: sizeHeight * 0.027,
                              width: sizeHeight * 0.027,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: sizeHeight * 0.02,
              ),
              Container(
                height: sizeHeight * 0.1,
                width: sizeWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey there, Younss',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 23),
                    ),
                    SizedBox(
                      height: sizeHeight * 0.01,
                    ),
                    Text(
                      'Orginize your plans for the day',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 17),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        //Nav Bar Drop Menu
        AnimatedPositioned(
          top: _visible! ? -5.0 : -200.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          child: Container(
            margin: EdgeInsets.only(top: sizeHeight * 0.06),
            height: sizeHeight * 0.1,
            width: sizeWidth * 0.88,
            color: bgColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _visible = false;
                    });
                  },
                  child: Container(
                    child: Image(
                      image: AssetImage('assets/icons/close.png'),
                      height: sizeHeight * 0.021,
                      width: sizeHeight * 0.021,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _visible = false;
                    });
                  },
                  child: Container(
                    child: Image(
                      image: AssetImage('assets/icons/settings.png'),
                      height: sizeHeight * 0.027,
                      width: sizeHeight * 0.027,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _visible = false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    });
                  },
                  child: Container(
                    child: Image(
                      image: AssetImage('assets/icons/profile.png'),
                      height: sizeHeight * 0.027,
                      width: sizeHeight * 0.027,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _visible = false;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    });
                  },
                  child: Container(
                    child: Image(
                      image: AssetImage('assets/icons/logout.png'),
                      height: sizeHeight * 0.027,
                      width: sizeHeight * 0.027,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

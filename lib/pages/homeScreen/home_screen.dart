import 'package:flutter/material.dart';
import 'package:todo_fitness/pages/addTask/add_task.dart';
import 'package:todo_fitness/pages/homeScreen/components/categories.dart';
import 'package:todo_fitness/pages/homeScreen/components/nav_bar.dart';
import 'package:todo_fitness/pages/homeScreen/components/task.dart';
import 'package:todo_fitness/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.06),
        height: sizeHeight,
        width: sizeWidth,
        child: Column(
          children: [
            NavBar(),
            Categories(),
            Task(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (contxt) => AddTask()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: sizeHeight * 0.06,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '+ Add a new task',
                    style: TextStyle(
                        wordSpacing: 2, fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List? task = [
    {'title': 'Hit Gym', 'time': '6am - 7am', 'done': false},
    {'title': 'Read Book', 'time': '7am - 7am', 'done': false},
    {'title': 'Go for mass/pray', 'time': '12pm - 1pm', 'done': false},
    {'title': 'Visite Denstist', 'time': '1pm - 2pm', 'done': false},
  ];
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: sizeHeight * 0.03,
        ),
        Text(
          "Today's Task",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        Container(
          height: sizeHeight * 0.4,
          width: sizeWidth,
          padding: EdgeInsets.only(top: sizeHeight * 0.03),
          child: ListView.builder(
              itemCount: task!.length,
              itemBuilder: (context, index) {
                return Container(
                  height: sizeHeight * 0.08,
                  margin: EdgeInsets.only(bottom: sizeHeight * 0.01),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Checkbox(
                          checkColor: Colors.white,
                          value: task![index]['done'],
                          onChanged: (bool? value) {
                            setState(() {
                              task![index]['done'] == true
                                  ? task![index]['done'] = false
                                  : task![index]['done'] = true;
                            });
                          }),
                      Container(
                        margin: EdgeInsets.only(left: sizeHeight * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task![index]['title'],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  decoration: task![index]['done'] == true
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            Text(
                              task![index]['time'],
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

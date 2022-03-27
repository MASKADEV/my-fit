import 'package:flutter/material.dart';
import 'package:todo_fitness/utils/colors.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController add_task = TextEditingController();
  TextEditingController start_time = TextEditingController();
  TextEditingController end_time = TextEditingController();
  TextEditingController repeat = TextEditingController();

  List repeatDays = [
    {'day': 'S', 'checked': false},
    {'day': 'M', 'checked': false},
    {'day': 'T', 'checked': false},
    {'day': 'W', 'checked': false},
    {'day': 'T', 'checked': false},
    {'day': 'F', 'checked': false},
    {'day': 'S', 'checked': false},
  ];
  @override
  void dispose() {
    add_task.clear();
    start_time.clear();
    end_time.clear();
    repeat.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.06),
          width: sizeWidth,
          height: sizeHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sizeHeight * 0.1,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  child: Image(
                    image: AssetImage('assets/icons/back.png'),
                    height: sizeHeight * 0.03,
                  ),
                ),
              ),
              SizedBox(
                height: sizeHeight * 0.03,
              ),
              Text(
                'Add Task',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: sizeHeight * 0.03,
              ),
              Container(
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: sizeHeight * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Label',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: sizeHeight * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[100]),
                            height: sizeHeight * 0.06,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Add Task',
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizeHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: sizeHeight * 0.1,
                          width: sizeWidth * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: sizeHeight * 0.01,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[100]),
                                height: sizeHeight * 0.06,
                                child: TextFormField(
                                  controller: start_time,
                                  decoration: InputDecoration(
                                    hintText: 'Start Time',
                                    hintStyle: TextStyle(
                                        color: Colors.grey[500], fontSize: 14),
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );

                                    if (pickedTime != null) {
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
                                      String formattedTime = DateFormat('HH:mm')
                                          .format(parsedTime);
                                      setState(() {
                                        start_time.text = formattedTime;
                                      });
                                    } else {}
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: sizeHeight * 0.1,
                          width: sizeWidth * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: sizeHeight * 0.01,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[100]),
                                height: sizeHeight * 0.06,
                                child: TextFormField(
                                  controller: end_time,
                                  decoration: InputDecoration(
                                    hintText: 'End Task',
                                    hintStyle: TextStyle(
                                        color: Colors.grey[500], fontSize: 14),
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );

                                    if (pickedTime != null) {
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
                                      String formattedTime = DateFormat('HH:mm')
                                          .format(parsedTime);
                                      setState(() {
                                        end_time.text = formattedTime;
                                      });
                                    } else {}
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHeight * 0.03,
                    ),
                    Container(
                      height: sizeHeight * 0.11,
                      width: sizeWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Repeat',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: sizeHeight * 0.02,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 20),
                              height: sizeHeight * 0.05,
                              width: sizeWidth,
                              child: ListView.builder(
                                  shrinkWrap: false,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: repeatDays.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          repeatDays[index]['checked'] == true
                                              ? repeatDays[index]['checked'] =
                                                  false
                                              : repeatDays[index]['checked'] =
                                                  true;
                                          print(repeatDays[index]['checked']);
                                        });
                                      },
                                      child: Container(
                                        height: sizeHeight * 0.1,
                                        width: sizeWidth * 0.1,
                                        margin: EdgeInsets.only(right: 7),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: repeatDays[index]
                                                        ['checked'] ==
                                                    false
                                                ? Colors.grey[100]
                                                : Colors.blue[600]),
                                        child: Center(
                                          child: Text(
                                            repeatDays[index]['day'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: repeatDays[index]
                                                            ['checked'] ==
                                                        true
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    );
                                  }))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizeHeight * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: sizeHeight * 0.2),
                        height: sizeHeight * 0.06,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            '+ Add a new task',
                            style: TextStyle(
                                wordSpacing: 2,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

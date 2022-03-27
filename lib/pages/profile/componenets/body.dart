import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var birthdayController = TextEditingController();

  @override
  void initState() {
    nameController.text = 'Youness Sidki';
    emailController.text = 'sidkiyouness@gmail.com';
    birthdayController.text = '08/01/1999';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.06),
      child: Column(
        children: [
          SizedBox(
            height: sizeHeight * 0.1,
          ),
          //NavBar
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    child: Image(
                      image: AssetImage('assets/icons/back.png'),
                      height: sizeHeight * 0.03,
                    ),
                  ),
                ),
                Text(
                  'Profile Data',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: sizeWidth * 0.06,
                )
              ],
            ),
          ),
          SizedBox(
            height: sizeHeight * 0.07,
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: Image(
                      image: NetworkImage(
                          'https://media-exp1.licdn.com/dms/image/C4D03AQFm4xkCvaSNRA/profile-displayphoto-shrink_800_800/0/1605697221724?e=1654128000&v=beta&t=akwkplAByY4Eb5Ih5r98kPtO-l1XKTLBnjNYl4wQ97I')),
                  height: sizeHeight * 0.1,
                ),
              ),
              GestureDetector(
                onTap: () => print('change Camera'),
                child: Container(
                  margin: EdgeInsets.only(
                      top: sizeHeight * 0.074, left: sizeWidth * 0.14),
                  child: Image(
                    image: AssetImage('assets/icons/camera.png'),
                    height: sizeHeight * 0.04,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizeHeight * 0.07,
          ),
          Form(
              child: Column(
            children: [
              InputText(
                label: 'Your Name',
                hintText: 'Enter yout Name',
                value: nameController.text,
                inputController: nameController,
              ),
              SizedBox(
                height: sizeHeight * 0.01,
              ),
              InputText(
                label: 'Your Email',
                hintText: 'Enter yout Email',
                value: emailController.text,
                inputController: emailController,
              ),
              SizedBox(
                height: sizeHeight * 0.01,
              ),
              InputText(
                label: 'Date of Birth',
                hintText: 'Enter yout Name',
                value: birthdayController.text,
                inputController: birthdayController,
              ),
              SizedBox(
                height: sizeHeight * 0.01,
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class InputText extends StatefulWidget {
  final label;
  final hintText;
  final value;
  final inputController;
  const InputText(
      {Key? key, this.label, this.hintText, this.value, this.inputController})
      : super(key: key);

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(color: Colors.grey[400]),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Color(0xffF1F3FD),
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: widget.inputController,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: 12),
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

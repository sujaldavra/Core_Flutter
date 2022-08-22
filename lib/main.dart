import 'package:flutter/material.dart';
import 'dart:math';
void main()
{
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OTP(),
    ),
  );
}
class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);
  @override
  _ProjectsState createState() => _ProjectsState();
}
class _ProjectsState extends State<OTP> {
  Random r1 = Random();
  int length = 0;
  List l1 = ["0","0","0","0","0","0"];
  TextEditingController lengthControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width,),
          const Text("OTP Generator", style: TextStyle( color: Color(0xFFF6DB87), fontSize:
          40, fontWeight: FontWeight.w400),),
          Container(
            width: MediaQuery.of(context).size.width*0.65,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFFCF6BA), width: 1.5) ),
            ),
            child: TextField(
              controller: lengthControler,
              keyboardType: TextInputType.number,
              maxLength: 1,
              onChanged: (val){
                length = int.parse(val);
              },
              style: const TextStyle( color: Color(0xFFFCF6BA), fontSize: 25, fontWeight:
              FontWeight.w500),
              decoration: InputDecoration(
                counterText: "",
                hintText: "Enter OTP Length.",
                hintStyle: TextStyle( color: const Color(0xFFFCF6BA).withOpacity(0.35),
                    fontSize: 16, fontWeight: FontWeight.w400),
                alignLabelWithHint: true,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFCF6BA),
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFCF6BA),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
          Buttons(
            texts: "Generate OTP",
            width: MediaQuery.of(context).size.width*0.7,
            height: MediaQuery.of(context).size.height*0.07,
            onTap: (){
              l1.clear();
              setState(() {
                if(length > 0) {
                  for (int i = 0; i < length; i++) {
                    l1.add(r1.nextInt(9).toString());
                  }
                }
                else
                {
                  l1 = ["0","0","0","0","0","0"];
                  length = 0;
                  ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:
                  Text("Enter Valid Length!"),),);
                }
              });
            },
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: l1.map((e) => Text(e, style: const TextStyle(color: Colors.black, fontSize:
              30, fontWeight: FontWeight.w600 ),)).toList(),
            ),
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height*0.1,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE8B8),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Buttons(
            texts: "Reset",
            width: MediaQuery.of(context).size.width*0.45,
            height: MediaQuery.of(context).size.height*0.06,
            onTap: (){
              setState(() {
                l1 = ["0","0","0","0","0","0"];
                lengthControler.clear();
                length = 0;
              });
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFF15172B),
    );
  }
  Buttons({ required String texts, width, height, onTap,}){
    return InkWell(
        onTap: onTap,
//splashColor: Colors.amber,
        borderRadius: BorderRadius.circular(30),
        child: Ink(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFCF6BA).withOpacity(0.35),
                blurRadius: 4,
                spreadRadius: 2,
                offset: const Offset(0,2),
              )
            ],
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [
                  Color(0xFFFFE8B8),
                  Color(0xFFF6DB87)
                ]
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(texts, style: const TextStyle(color: Color(0xFF15172B), fontSize: 28,
                fontWeight: FontWeight.w500),),
            width: width,
            height: height,
          ),
        )
    );
  }
}
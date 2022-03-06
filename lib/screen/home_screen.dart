import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screen/chat_screen.dart';
import 'package:line_icons/line_icons.dart';

/// Home screen.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100.0),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Friends',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.white
                      ),
                    ),
                    Icon(LineIcons.plusCircle, color: Colors.white)
                  ],
                )
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _makeAvatar("assets/images/avatar1.png", "Amir"),
                    const SizedBox(width: 30.0),
                    _makeAvatar("assets/images/avatar2.png", "Paul"),
                    const SizedBox(width: 30.0),
                    _makeAvatar("assets/images/avatar3.png", "Liam"),
                    const SizedBox(width: 30.0),
                    _makeAvatar("assets/images/avatar4.png", "Liz"),
                    const SizedBox(width: 30.0),
                    _makeAvatar("assets/images/avatar5.png", "Kerry"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            Container(
              width: size.width,
              height: 800,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
              ),
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    _makeMessageEl("assets/images/avatar6.png", "Connor Haris", "2m", size.width, context),
                    const SizedBox(height: 30.0),
                    _makeMessageEl("assets/images/avatar7.png", "Ethan Grant", "8m", size.width, context),
                    const SizedBox(height: 30.0),
                    _makeMessageEl("assets/images/avatar8.png", "Becky Walker", "1h", size.width, context),
                    const SizedBox(height: 30.0),
                    _makeMessageEl("assets/images/avatar2.png", "Paul Sutton", "2h", size.width, context),
                    const SizedBox(height: 30.0),
                    _makeMessageEl("assets/images/avatar3.png", "Liam Thomas", "2h", size.width, context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* --- Widgets --- */

Widget _makeAvatar(String img, String name) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Image.asset(img, width: 50.0),
      ),
      const SizedBox(height: 7.0),
      Text(
        name,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14.0
        ),
      )
    ],
  );
}

Widget _makeMessageEl(String img, String name, String time, double width, dynamic context) {
  double _total = width-60.0;
  double _center = _total*0.7;
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()),
      );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(img, width: 50.0),
        ),
        Container(
          width: _center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                "message overview is here.message overview is here.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey
                ),
              ),
            ],
          ),
        ),
        Text(
          time,
          style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey
          ),
        )
      ],
    ),
  );
}

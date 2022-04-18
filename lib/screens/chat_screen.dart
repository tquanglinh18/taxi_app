import 'package:flutter/material.dart';
import 'package:taxi_application/screens/contact_screen.dart';

import '../form/image.dart';

final _messageList = [
  Message(
    text: 'I am looking for you',
    timeRead: 'Read 16:26',
    isMe: true,
  ),
  Message(
    text: 'Coming in 15 minutes',
    timeRead: ' ',
    isMe: false,
  ),
  Message(
    text: 'I can\'t wait. Please come fast and make sure you '
        'are coming from the street side',
    timeRead: 'Read 16:26',
    isMe: true,
  ),
  Message(
    text: 'Sure, see you then!',
    timeRead: ' ',
    isMe: false,
  ),
];

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _user(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        "Tuesday 20:21",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xff858E99),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _messageList.length,
                        itemBuilder: (context, index) {
                          return MessageItem(
                            text: _messageList[index].text,
                            timeRead: _messageList[index].timeRead,
                            isMe: _messageList[index].isMe,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              _messageInput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _user() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 180,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff109F2E),
            Color(0xff51C569),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(
                builder: (context) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (context) => const ContactScreen(),
                        ),
                      );
                    },
                    child: Image.asset(back),
                  );
                }
              ),
              const SizedBox(height: 25),
              const Text(
                'Chris Martin',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 70,
                width: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://3.bp.blogspot.com/-8mNBHPVwP_U/Wk9O0jrNVSI/AAAAAAAAAZs/A45all5dRAMkKIHbIXRg0mbYIY79rZcTQCLcBGAs/s1600/gao-tay.jp',
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.local_phone,
                  color: Color(0xff109F2E),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _messageInput(){
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xff34495E).withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.insert_emoticon),),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color(0xff34495E),
                  )
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mic),
                  hintText: 'Type your message...',
                  border: InputBorder.none,
                ),),
            ),
          ),
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.send))
        ],
      ),
    );
  }
}

class FirstMyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(20, 0); //A
    path.quadraticBezierTo(0, 0, 0, 20); //B
    path.lineTo(0, size.height - 20); //C
    path.quadraticBezierTo(0, size.height, 20, size.height); //D
    path.lineTo(size.width - 25, size.height); //E
    path.quadraticBezierTo(
        size.width - 20, size.height, size.width - 15, size.height - 5); //M
    path.quadraticBezierTo(
        size.width - 10, size.height, size.width, size.height); //V
    path.quadraticBezierTo(size.width - 10, size.height - 10, size.width - 10,
        size.height - 20); //N
    path.lineTo(size.width - 10, 20); //G
    path.quadraticBezierTo(size.width - 10, 0, size.width - 30, 0); //H
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class SecondMyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);
    path.lineTo(size.width, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 20, size.height);
    path.lineTo(25, size.height); //E
    path.quadraticBezierTo(20, size.height, 10, size.height - 8);
    path.quadraticBezierTo(20, size.height - 5, 0, size.height);
    path.quadraticBezierTo(10, size.height - 10, 10, size.height - 20);
    path.lineTo(10, size.height - 20);
    path.lineTo(10, 20);
    path.quadraticBezierTo(10, 0, 30, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class MessageItem extends StatelessWidget {
  final String text;
  final String timeRead;
  final bool isMe;
  const MessageItem({
    Key? key,
    required this.text,
    required this.timeRead,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMe ? const EdgeInsets.only(left: 90) : const EdgeInsets.only(right: 90),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          ClipPath(
            clipper: isMe ? FirstMyCustomClipper() : SecondMyCustomClipper(),
            child: Container(
              padding: isMe
                  ? const EdgeInsets.fromLTRB(15, 10, 20, 10)
                  : const EdgeInsets.fromLTRB(20, 10, 15, 10),
              color: isMe ? const Color(0xff34495E) : const Color(0xff109F2E),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              timeRead,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xff858E99),
              ),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final String timeRead;
  final bool isMe;
  Message(
      {
      required this.isMe,
      required this.text,
      required this.timeRead});
}



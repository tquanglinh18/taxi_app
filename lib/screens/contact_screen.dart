import 'package:flutter/material.dart';
import 'package:taxi_application/cubit/sign_in/sign_in_screen.dart';
import 'package:taxi_application/form/image.dart';
import 'package:taxi_application/screens/chat_screen.dart';

final _userContactList = [
  Contacts(
    avt:
        'https://everest.org.vn/wp-content/uploads/2021/06/logan-weaver-Isle-8YpbIQ-unsplash.jpg',
    name: 'Adriane',
    time: "Now",
  ),
  Contacts(
    avt:
        'https://image-us.24h.com.vn/upload/3-2020/images/2020-08-05/Mau-Nga-Phap-mang-ve-phuong-Tay-kieu-ky-khien-thanh-nien-chau-a-say-tu-cai-nhin-dau-70519542_2373214056229678_6062910787529657394_n-1596615283-588-width1080height1350.jpg',
    name: 'Eva',
    time: "12:14",

  ),
  Contacts(
    avt:
        'https://3.bp.blogspot.com/-8mNBHPVwP_U/Wk9O0jrNVSI/AAAAAAAAAZs/A45all5dRAMkKIHbIXRg0mbYIY79rZcTQCLcBGAs/s1600/gao-tay.jpg',
    name: 'Ivone',
    time: "12:14",
  ),
  Contacts(
    avt:
        'https://image-us.24h.com.vn/upload/3-2020/images/2020-08-05/Mau-Nga-Phap-mang-ve-phuong-Tay-kieu-ky-khien-thanh-nien-chau-a-say-tu-cai-nhin-dau-70519542_2373214056229678_6062910787529657394_n-1596615283-588-width1080height1350.jpg',
    name: 'Eva',
    time: '12:15',
  ),
  Contacts(
    avt:
        'https://kenh14cdn.com/XzvpRab8gPLiPBLgjXL3trNSY05FR/Image/2015/09/vi-sao-nguoi-chau-au-trong-quyen-ru-hon-khi-tre-nhung-lai-nhanh-gia-hon-so-voi-chau-a_3fc75af6f9.jpg',
    name: 'Lisa',
    time: ' ',
  ),
  Contacts(
    avt:
        'https://everest.org.vn/wp-content/uploads/2021/06/logan-weaver-Isle-8YpbIQ-unsplash.jpg',
    name: 'Ivone',
    time: ' ',
  ),
  Contacts(
    avt:
        'https://3.bp.blogspot.com/-8mNBHPVwP_U/Wk9O0jrNVSI/AAAAAAAAAZs/A45all5dRAMkKIHbIXRg0mbYIY79rZcTQCLcBGAs/s1600/gao-tay.jpg',
    name: 'Ivone',
    time: ' ',
  ),
];

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    _contactWidget(),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ChatScreen(),
                          ),
                        );
                      },
                      child: _userContactWidget(),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contactWidget() {
    return Container(
        padding: const EdgeInsets.all(20),
        height: 150,
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
      child: Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: Image.asset(back),),
              const Center(
                child: Text(
                  'CONTACTS',
                  style: TextStyle(
                      fontFamily: "OpenSans-Bold",
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontFamily: "SFProText-Rugular",
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userContactWidget() {
    return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _userContactList.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContactWidget(
                      avt: _userContactList[index].avt,
                      name: _userContactList[index].name,
                      time: _userContactList[index].time,
                  ),
                  Container(height: 1,
                    color: const Color(0xff34495E).withOpacity(0.2),)
                ],
              );
            },
          ),
        );

  }
}

class ContactWidget extends StatelessWidget {
  final String avt;
  final String name;
  final String time;
  // final DateTime time;
  const ContactWidget({Key? key, required this.avt, required this.name, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundImage: NetworkImage(avt),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "OpenSans-Bold",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "OpenSans-Bold",
              color: Color(0xff2BAF46),
            ),
          ),
        ],
      ),
    );
  }
}

class Contacts {
  final String avt;
  final String name;
  final String time;
  // final DateTime? time;
  Contacts({required this.avt, required this.name, required this.time});
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wecare/components/appointment_cards.dart';
import 'package:wecare/utils/config.dart';
import 'package:wecare/screens/appointment_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.rainbow,
      "category": "Over Coming Depression",
    },
    {
      "icon": FontAwesomeIcons.shield,
      "category": "Tackling Stress",
    },
    {
      "icon": FontAwesomeIcons.bomb,
      "category": "Anger Management",
    },
    {
      "icon": FontAwesomeIcons.solidFaceDizzy,
      "category": "Dealing Anxiety",
    },
    {
      "icon": FontAwesomeIcons.bed,
      "category": "Better Sleep",
    },
    {
      "icon": FontAwesomeIcons.faceSmile,
      "category": "Being More HAppy",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'Prakhar Shukla', //hard core the user's name at first
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/ProPic.png'),
                    ),
                  ),
                ],
              ),
              Config.spaceMedium,
              //category listing
              const Text(
                'Your Conserns',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              //building the category list
              SizedBox(
                height: Config.heightSize * 0.06,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(
                    medCat.length,
                    (index) {
                      return Card(
                        margin: const EdgeInsets.only(right: 10),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FaIcon(
                                medCat[index]['icon'],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                medCat[index]['category'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Config.spaceSmall,
              const Text(
                'Appointment Today',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              AppointmentCard(),
            ],
          ),
        ),
      ),
    );
  }
}

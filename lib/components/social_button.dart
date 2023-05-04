import 'package:flutter/material.dart';
import 'package:wecare/utils/config.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.social,
  }) : super(key: key);

  final String social;

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return OutlinedButton(
      //style is done to avoid the screen rendering issue
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10),
        side: const BorderSide(width: 1.01, color: Colors.black),
      ),
      onPressed: () {},
      child: SizedBox(
        width: Config.screenWidth! * 0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'assets/$social.png',
              width: 40,
              height: 40,
            ),
            Text(
              social.toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

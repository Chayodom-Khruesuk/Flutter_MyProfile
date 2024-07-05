import 'package:flutter/material.dart';
import 'package:flutter_profile/widgets/card_profile.dart';
import 'package:url_launcher/url_launcher.dart';

_launchFacebook() async {
  var url = Uri.parse("https://www.facebook.com/ChayodomKhrueasuk/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchGithup() async {
  var url = Uri.parse("https://github.com/Chayodom-Khruesuk");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchEmail() async {
  var mail = Uri.parse("mailto:chayodom.kx@gmail.com");
  if (await canLaunchUrl(mail)) {
    await launchUrl(mail);
  } else {
    throw 'Could not launch $mail';
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(6, 40, 92, 0.979),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              Colors.black,
              Colors.black12,
              Colors.black26,
              Colors.black38
            ])),
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 80),
          child: Center(
            child: Column(
              children: <Widget>[
                const CircleAvatar(
                  minRadius: 50,
                  maxRadius: 100,
                  backgroundColor: Color.fromARGB(255, 209, 169, 58),
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                const Text(
                  "Chayodom Khruesuk",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Mobile Developer",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueGrey,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 230,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                CardProfile(
                    text: 'Telephone',
                    icon: Icons.phone_android,
                    onPressed: () async {
                      Uri phoneno = Uri.parse("tel:0661370896");
                      if (await launchUrl(phoneno)) {
                        await launchUrl(phoneno);
                      } else {
                        throw ('Could not $phoneno');
                      }
                    }),
                const CardProfile(
                    text: 'Facebook',
                    icon: Icons.facebook_outlined,
                    onPressed: _launchFacebook),
                const CardProfile(
                    text: 'Githup',
                    icon: Icons.admin_panel_settings,
                    onPressed: _launchGithup),
                const CardProfile(
                    text: 'Email', icon: Icons.mail, onPressed: _launchEmail),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

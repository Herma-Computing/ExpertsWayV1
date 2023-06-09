// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:learncoding/main.dart';
import 'package:learncoding/ui/pages/help.dart';
import 'package:learncoding/api/google_signin_api.dart';
import 'package:learncoding/utils/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/box_icons_icons.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String? name;
  String? image;
  String? title;
  bool lightmode = true;
  @override
  void initState() {
    getValue();
    super.initState();
  }

  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name')!;
    image = prefs.getString('image')!;
    setState(() {});
  }

  logout() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    await pre.remove('name');
    await pre.remove('image');
    pre.clear();
    GoogleSignInApi.logout();

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const RestartWidget(child: (MyApp()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, left: 5, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.grey,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Settings',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Red Hat Display",
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(100)),
                  child: TextButton(
                    child: const Icon(
                      Icons.logout,
                      color: Colors.blue,
                      size: 16,
                    ),
                    onPressed: () {
                      logout();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              buildImage(),
              Positioned(
                bottom: 0,
                right: 4,
                child: buildAddPhoto(Colors.blue),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  name ?? "John Doe",
                  style: const TextStyle(
                    fontFamily: 'Red Hat Display',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text("$name@gmail.com", //tobechanged
                      style: const TextStyle(
                        fontFamily: 'Red Hat Display',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
            height: 2,
            color: Colors.grey[200],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    _container(BoxIcons.bx_user, 'Edit Profile', null,
                        Icons.arrow_forward_ios, true, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Help()),
                      );
                    }),
                    _container(BoxIcons.bx_lock, 'Security', null,
                        Icons.arrow_forward_ios, true, () {}),
                    _container(
                        Icons.language,
                        'Language',
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              "English(US)",
                              style: TextStyle(
                                fontFamily: 'Red Hat Display',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[900],
                              ),
                            )),
                        Icons.arrow_forward_ios,
                        true, () {
                      lightmode = !lightmode;
                    }),
                    _container(
                        Icons.cleaning_services,
                        lightmode ? 'Dark Mode' : 'Light Mode',
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            trackColor: const Color.fromARGB(255, 86, 85, 85),
                            activeColor:
                                const Color.fromARGB(255, 197, 232, 247),
                            thumbColor:
                                lightmode ? Colors.blue : Colors.grey[900],
                            value: lightmode,
                            onChanged: (bool value) {
                              setState(() {
                                lightmode = value;
                              });
                              setState(() {});
                            },
                          ),
                        ),
                        null,
                        false, () {
                      if (kDebugMode) {
                        print("object");
                      }
                    }),
                    _container(
                        Icons.notifications_none_rounded,
                        'Notifications',
                        null,
                        Icons.arrow_forward_ios,
                        true,
                        () {}),
                    _container(Icons.privacy_tip_outlined, 'Privacy Policy',
                        null, Icons.arrow_forward_ios, true, () {}),
                    _container(BoxIcons.bx_help_circle, 'Help', null,
                        Icons.arrow_forward_ios, true, () {}),
                    _container(BoxIcons.bx_share_alt, 'Invite Friends', null,
                        Icons.arrow_forward_ios, true, () {}),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _container(IconData leading, title, Widget? info, IconData? trailing,
      bool splash, VoidCallback tapped) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  offset: Offset(1, 1),
                  color: Color.fromARGB(54, 188, 187, 187))
            ],
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                tapped;
              },
              highlightColor: splash
                  ? const Color.fromARGB(132, 135, 208, 245)
                  : Colors.transparent,
              splashColor: splash
                  ? const Color.fromARGB(61, 231, 231, 231)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(radius),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 10),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          leading,
                          color: maincolor,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Red Hat Display',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[900],
                        ),
                      ) //15
                    ],
                  ),
                  Row(
                    children: [
                      info ?? Container(),
                      const SizedBox(
                        width: 10,
                      ),
                      trailing == null
                          ? Container()
                          : Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: Icon(
                                trailing,
                                color: Colors.grey[900],
                                size: 20,
                              ),
                            )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget buildImage() {
    NetworkImage imagebuild = NetworkImage(image.toString());
    ImageProvider<Object> alternativeImage =
        const AssetImage('assets/images/video.jpg');
    return CircleAvatar(
      radius: 45,
      foregroundImage: image != null ? imagebuild : alternativeImage,
      child: const Material(
        color: Color.fromARGB(0, 231, 6, 6), //
      ),
    );
  }

  Widget buildAddPhoto(Color color) {
    IconThemeData icon = Theme.of(context).iconTheme;
    return ClipOval(
      child: Container(
        padding: const EdgeInsets.all(5),
        color: color,
        child: InkWell(
            onTap: () {},
            child: Icon(
              Icons.mode_edit_outline_outlined,
              color: icon.color,
              size: 17,
            )),
      ),
    );
  }
}

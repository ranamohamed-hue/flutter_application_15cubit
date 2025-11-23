import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/chat_app/login.dart';
import 'package:video_player/video_player.dart';

class Splash_login extends StatefulWidget {
  const Splash_login({super.key});

  @override
  State<Splash_login> createState() => Splash_loginState();
}

class Splash_loginState extends State<Splash_login> {
  late VideoPlayerController _logo;

  @override
  void initState() {
    super.initState();
    _logo = VideoPlayerController.asset('lib/assets/logo.mp4')
      ..initialize().then((_) {
        _logo.play();
        _logo.setLooping(false);
        setState(() {});
      });
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Login(),
          transitionDuration: Duration(seconds: 3),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _logo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _logo.value.isInitialized
              ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _logo.value.size.width,
                    height: _logo.value.size.height,
                    child: VideoPlayer(_logo),
                  ),
                ),
              )
              : Container(
                color: Colors.purple,
                child: Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
    );
  }
}

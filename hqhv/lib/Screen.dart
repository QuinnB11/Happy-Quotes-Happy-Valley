import 'package:flutter/material.dart';
import 'package:hqhv/QuoteScreen.dart';
import 'package:hqhv/notification_api.dart';
import 'package:share/share.dart';

class Screen extends StatefulWidget {
  Screen();

  @override
  ScreenState createState() => ScreenState();

}


class ScreenState extends State<Screen> {
Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Align(
             child: Container(decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.blue,
              ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            ),
             ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                children: [
                  Container(
                padding: EdgeInsets.only(bottom: 200),
                child: FloatingActionButton.extended(
                label: Text(
                  'Schedule Notification',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  ), // <-- Text
                backgroundColor: Colors.white,
                icon: Icon( // <-- Icon
                  Icons.alarm,
                  size: 24.0,
                  color: Colors.black,
                ),
                onPressed: () { NotificationAPI.showScheduledNotification(
                  title: "New Quote",
                  body: "Hey, come check out the daily quote!",
                  payload: 'quote.abs',
                  scheduledDate: DateTime.now().add(Duration(seconds: 86400)),
                );
                final snackBar = SnackBar(
                  content: Text(
                    "Scheduled quote for the next day!",
                    style: TextStyle(fontSize: 24),
                  ),
                  backgroundColor: Colors.red,
                );
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(snackBar);
                    }
                  )
                ),
                IconButton(
                      padding: EdgeInsets.only(bottom: 200),
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Share.share(
                            'Here\'s the new daily quote: ${QuoteScreen()}',
                            subject: "A new motivation quote"
                            );
                      },
                    ),

                ],
              )
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: QuoteScreen()
                ),
              ),
            //   Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     height: 365,
            //     color: Colors.transparent,
            //     child: SvgPicture.asset(
            //       '/assets/Profile_mountain.svg',
            //       height: 488,
            //       width: 466,
            //     ),
            //   )
            // ),
          ],
      )
    );
  }
}
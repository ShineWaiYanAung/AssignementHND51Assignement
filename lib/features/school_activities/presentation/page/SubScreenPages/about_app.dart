import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    final height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset("AppImages/BackIcon/backButton.png"),
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: const Text(
          "About App",
          style: TextStyle(
            fontFamily: 'PrimaryFont',
            color: Color(0xFF6489EB),
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            SizedBox(
              width: widht *0.6,
              height: height *0.4,
              child: Lottie.asset('AppImages/lottie/developer.json'),),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  buildDeveloperInfro('App Creator','Shine Wai Yan Aung'),
                  const SizedBox(height: 40,),
                  buildDeveloperInfro('Contact','09790785178'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 50,
                    horizontal: 50),
                width: widht,
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: (){
                          showQRDialog(context, "Developer's Telegram Account", "AppImages/SocialIcon/telegramQr.jpg");
                        },
                        child: SizedBox(

                          width :100,
                          child: Image.asset(
                              "AppImages/SocialIcon/telegramIcon.png"),
                        )),
                    InkWell(
                      onTap: (){
                        showQRDialog(context, "Developer's Viber Account",   "AppImages/SocialIcon/viberQr.png");

                      },
                      child: Image.asset(
                          width :80,
                          "AppImages/SocialIcon/viberIcon.png"),
                    )
                  ],
                ),
              ),
            )


          ],
        ),
      ),

    );
  }

  Row buildDeveloperInfro(String title,String subtitle) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width :120,
          child: Text(title,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
        ),
        Text(subtitle, style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          color: Colors.white,

        ),)

      ],
    );
  }

  void showQRDialog(BuildContext context, String title, String path) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows the dialog to be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                path, // Replace with your QR code image URL or asset

              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

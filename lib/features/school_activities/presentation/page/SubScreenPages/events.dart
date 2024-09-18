import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/widget/Components/up_bar_widget.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  final String title;
  const Events({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(

          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          children: [
            UpBarWidget(changesControl: false),
            SizedBox(
              height: 60,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 90),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "AppImages/Event/iotShow.png",
                    ),
                    fit: BoxFit.fill),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    spreadRadius: 2
                  )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Events: Wednesday, 21 August 2024, 11:55 PM",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
            ),


          ],
        ),
      ),
    );
  }
}

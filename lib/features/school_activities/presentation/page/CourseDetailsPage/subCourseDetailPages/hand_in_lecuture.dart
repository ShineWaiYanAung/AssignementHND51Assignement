import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HandInLecture extends StatelessWidget {
  const HandInLecture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 15),

          ///HandInText
          Container(
            color: Theme.of(context).primaryColor,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Hand In",
                    style: TextStyle(
                        color: Theme.of(context).focusColor,
                        fontFamily: 'SecondaryFont',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(

                              color: Colors.black12,
                              spreadRadius: 2,
                              offset: Offset(2,
                                  2), // Even shadow in both horizontal and vertical directions
                              blurRadius: 2,
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "APDP  Part  One  Assignment",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "PrimaryFont",
                                fontSize: 12,
                                letterSpacing: 2,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text("3days Remaining",style: TextStyle(
                                color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
                                fontSize: 12,
                                 letterSpacing: 1,
                                 fontStyle: FontStyle.italic,
                              ),),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).focusColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black45,
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                      )
                                    ]),
                                child: const Text(
                                  "Watch",
                                  style: TextStyle(
                                    fontFamily: "SecondaryFont",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

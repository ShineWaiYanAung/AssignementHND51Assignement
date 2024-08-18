import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LecturesDetail extends StatelessWidget {
  const LecturesDetail({
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
                    "Lectures",
                    style: TextStyle(
                        color: Theme.of(context).focusColor,
                        fontFamily: 'SecondaryFont',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          offset: Offset(2, 2), // Even shadow in both horizontal and vertical directions
                          blurRadius: 4,
                        ),

                      ]
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text("Hi"),
                      subtitle: const Text("data"),
                      trailing: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Button's corner radius
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            Theme.of(context)
                                .focusColor, // Button background color
                          ),
                        ),
                        child: Text(
                          'Watch',
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.color, // Correctly accessing the color
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_manager/widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/car.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Hello',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: '\nStart your beatiful day',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.8,
            ),
            ButtonWidget(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              text: "Add Task",
              onPressed: () {
                Navigator.pushNamed(context, '/addTask');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              text: "View All",
              onPressed: () {
                Navigator.pushNamed(context, '/addTask');
              },
            )
          ],
        ),
      ),
    );
  }
}

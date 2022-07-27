import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/widgets/button_widget.dart';
import 'package:task_manager/widgets/task_widgets.dart';

class AllTaskScreen extends StatelessWidget {
  const AllTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myData = ["Try Harder", "TRRY sMARTED"];
    final leftEditIcon = Container(
      color: const Color(0XFF2e3253).withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );

    final rightEditIcon = Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      child: const Icon(Icons.delete, color: Colors.white),
    );

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.7,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/car.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 20,
                  height: 20,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Icon(Icons.calendar_month, color: AppColors.secondaryColor),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "2",
                  style:
                      TextStyle(fontSize: 20, color: AppColors.secondaryColor),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Dismissible(
                      background: leftEditIcon,
                      secondaryBackground: rightEditIcon,
                      onDismissed: (direction) {
                        print("after dismiss");
                      },
                      confirmDismiss: (direction) async {
                        print("confirming");

                        if (direction == DismissDirection.startToEnd) {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Container(
                                height: 550,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 210, 238, 255)
                                      .withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ButtonWidget(
                                        backgroundColor: AppColors.mainColor,
                                        textColor: Colors.white,
                                        text: "View",
                                        onPressed: () {},
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ButtonWidget(
                                        backgroundColor: AppColors.mainColor,
                                        textColor: Colors.white,
                                        text: "Edit",
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          return false;
                        }

                        return Future.delayed(
                          const Duration(seconds: 1),
                          () => direction == DismissDirection.endToStart,
                        );
                      },
                      key: ObjectKey(index),
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TaskWidget(
                          text: myData[index],
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

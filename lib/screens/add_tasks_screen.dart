import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/widgets/button_widget.dart';
import 'package:task_manager/widgets/text_field_widget.dart';
import 'package:get/get.dart';
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 26,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                TextFieldWidget(
                  controller: nameController,
                  hintText: 'Add Task',
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  controller: detailController,
                  maxLines: 4,
                  hintText: 'Task Detail',
                  borderRadius: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  backgroundColor: AppColors.secondaryColor,
                  textColor: Colors.white,
                  text: "Add",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

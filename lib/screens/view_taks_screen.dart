import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/data_controller.dart';
import 'package:task_manager/widgets/text_field_widget.dart';

class ViewTaskScreen extends StatelessWidget {
  final int id;
  const ViewTaskScreen({Key? key, required this.id}) : super(key: key);
  _loadsingleTask() async {
    await Get.find<DataController>().getSingleData(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    return Scaffold(
      body: FutureBuilder(
        future: _loadsingleTask(),
        builder: (context, snapshot) {
          final controller = Get.find<DataController>();
          final taskService = controller.singleData;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
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
                        hintText: taskService["task_name"],
                        readOnly: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        controller: detailController,
                        maxLines: 4,
                        hintText: taskService["task_detail"],
                        borderRadius: 10,
                        readOnly: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

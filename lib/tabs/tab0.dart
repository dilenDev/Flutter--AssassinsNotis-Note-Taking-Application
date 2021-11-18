import 'package:final_note/controller/note_controller.dart';
import 'package:final_note/models/note.dart';
import 'package:final_note/pages/new_note_page.dart';
import 'package:final_note/pages/preview_note_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tab0 extends StatefulWidget {
  const Tab0({Key? key}) : super(key: key);

  @override
  _Tab0State createState() => _Tab0State();
}

class _Tab0State extends State<Tab0> {
  final _taskController = Get.put(TaskController());

  @override
  void initState() {
    super.initState();
    _taskController.getTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Get.to(() => const NewNote());
            _taskController.getTask();
          },
          backgroundColor: Get.isDarkMode ? Colors.grey[900] : Colors.grey[200],
          child: Icon(
            Icons.add_task,
            color: Get.isDarkMode ? Colors.grey[300] : Colors.grey[600],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //const SizedBox(height: 100),
          _showTask(),
        ],
      ),
    );
  }

  _showTask() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, index) {
              print(_taskController.taskList.length);

              // return const NoteTile();
              return GestureDetector(
                onTap: () {
                  _showBottomSheet(context, _taskController.taskList[index]);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  //height: 100,
                  margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(16)),

                  child: Container(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _taskController.taskList[index].title.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 2.0),
                        Text(_taskController.taskList[index].note.toString()),
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 5),
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        color: Get.isDarkMode ? Colors.grey[900] : Colors.grey[100],
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[400]),
          ),
          const Spacer(),
          _botomSheetButtonStyle(
              onTap: () {
                Get.to(() => const PreviewPage());
              },
              lable: "Preview",
              color: Colors.green),
          const Spacer(),
          _botomSheetButtonStyle(
              onTap: () {}, lable: "Add To Complete", color: Colors.blueAccent),
          const Spacer(),
          //* delete
          _botomSheetButtonStyle(
              onTap: () {
                _taskController.delete(task);

                _taskController.getTask();
                Get.back();
              },
              lable: "Delete",
              color: Colors.redAccent),
          const Spacer(),
          //* close
          _botomSheetButtonStyle(
              onTap: () {
                Get.back();
              },
              lable: "Close",
              color: Colors.lightBlueAccent),
          const Spacer(),
        ],
      ),
    ));
  }

  _botomSheetButtonStyle({
    required Function() onTap,
    required String lable,
    required Color color,
    //! do i need to add - required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 45,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: color),
        child: Center(
            child: Text(
          lable,
        )),
      ),
    );
  }
}

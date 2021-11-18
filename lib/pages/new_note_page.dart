import 'package:final_note/controller/note_controller.dart';
import 'package:final_note/models/note.dart';
import 'package:final_note/models/theme.dart';
import 'package:final_note/widgets/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final TaskController _taskController = Get.put(TaskController());

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Note',
          style: subHeadingStyle,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputFields(
                title: "Title",
                hint: "Enter note title",
                controller: _titleController,
              ),
              InputFields(
                title: "Note",
                hint: "Enter note description",
                controller: _noteController,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  //_colorPallete(),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => _validateData(),
                    child: Container(
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: bluishClr),
                      child: const Center(
                        child: Text(
                          'Add Note',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDb();
      Get.back();
    } else if (_titleController.text.isEmpty ||
        _noteController.text.isNotEmpty) {
      Get.snackbar(
        "Requried",
        "All fields must be filed",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        backgroundColor: Colors.grey[300],
        margin: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        borderRadius: 20,
      );
    }
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
      task: Task(
        note: _noteController.text,
        title: _titleController.text,
        //color: _selectedColor,
        isCompleted: 0,
      ),
    );
    print("My id is " + "$value");
  }

  // _colorPallete() {
  //   return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //     const Text(
  //       "Color",
  //       //style: titleStyle,
  //     ),
  //     const SizedBox(height: 8.0),
  //     //* helps to put things in horizontal line
  //     Wrap(
  //         children: List<Widget>.generate(3, (int index) {
  //       return GestureDetector(
  //         onTap: () {
  //           setState(() {
  //             _selectedColor = index;
  //           });
  //         },
  //         child: Padding(
  //           padding: const EdgeInsets.only(right: 8.0),
  //           child: CircleAvatar(
  //             radius: 14,
  //             backgroundColor: index == 0
  //                 ? Colors.lightBlueAccent
  //                 : index == 1
  //                     ? Colors.pinkAccent
  //                     : Colors.greenAccent,
  //             child: _selectedColor == index
  //                 ? const Icon(
  //                     Icons.done,
  //                     color: Colors.white,
  //                     size: 16,
  //                   )
  //                 : Container(),
  //           ),
  //         ),
  //       );
  //     }))
  //   ]);
  // }
}

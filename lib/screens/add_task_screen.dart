import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task_data.dart'; // Import TaskData
import 'package:provider/provider.dart'; // Import Provider

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle; // This will hold the text from the TextField

    return Container(
      // This provides the semi-transparent background.
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        // The Column arranges the title, text field, and button vertically.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true, // Automatically opens the keyboard
              textAlign: TextAlign.center,
              onChanged: (newText) {
                // When the user types, we save the text.
                newTaskTitle = newText;
              },
            ),
            SizedBox(height: 10.0), // Adds a little space
            TextButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: () {
                // When the "Add" button is pressed:
                if (newTaskTitle != null) {
                  // Use Provider to find the TaskData object and call addTask
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle!);
                }
                // Close this pop-up screen
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class NewBody extends StatefulWidget {
  final String? dueDate;

  const NewBody(this.dueDate, {super.key});

  @override
  State<NewBody> createState() => NewBodyState();
}

class NewBodyState extends State<NewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: const Center(
            child: Text(
              'Create new task',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40, left: 16, bottom: 0),
              child: Text(
                "Main task name",
                style: TextStyle(
                  color: Color.fromRGBO(238, 111, 87, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Card(
                color: Colors.white,
                child: SizedBox(
                  width: 460,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "UI/UX Design",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 16, bottom: 0),
              child: Text(
                "Due Date",
                style: TextStyle(
                  color: Color.fromRGBO(238, 111, 87, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                color: Colors.white,
                child: SizedBox(
                  width: 460,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [
                      Text(
                        widget.dueDate ?? 'No due date',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 200),
                        child: Icon(Icons.calendar_month_outlined,
                            color: Colors.blue),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 16, bottom: 0),
              child: Text(
                "Description",
                style: TextStyle(
                  color: Color.fromRGBO(238, 111, 87, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Card(
                color: Colors.white,
                child: SizedBox(
                  width: 460,
                  height: 100,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "First I have to animate the logo and later prototype the design",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button onPressed logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(
                        238, 111, 87, 1), // Adjusted color values
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

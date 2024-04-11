import 'package:flutter/material.dart';
import 'package:taskkmanager/body.dart';

class NewBody extends StatefulWidget {
  const NewBody({super.key});

  @override
  State<NewBody> createState() => NewBodyState();
}

class NewBodyState extends State<NewBody> {
  String nName = "";
  String nDate = "";
  String nDescription = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      onChanged: (text) {
                        nName = text;
                        print(nName);
                      },
                      decoration: const InputDecoration(
                        hintText: 'UI/UX Design',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 16, bottom: 0),
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
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (text) {
                        nDate = text;
                        print(nDate);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '10th April',
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_month_rounded,
                              color: Colors.blue),
                          onPressed: () {
                            print('Clear due date');
                          },
                        ),
                      ),
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 460,
                      height: 120,
                      child: TextField(
                        onChanged: (text) {
                          nDescription = text;
                          print(nDescription);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Describe your task',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
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
                      // Handle add task button press
                      Body body = Body(nName, nDate, nDescription);
                      Navigator.pop(context, body);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
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
      ),
    );
  }
}

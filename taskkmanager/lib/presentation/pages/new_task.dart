import 'package:flutter/material.dart';
import 'package:taskkmanager/data/body.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String nName = "";

  DateTime nDate = DateTime.now();

  String nDescription = "";
  Color nColor = Colors.red;

  final TextEditingController _controller = TextEditingController();

  List<String> status = ['Not Started', 'In progress', 'Completed'];
  String selectedValue = 'Not Started';

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: const Color.fromRGBO(238, 111, 87, 1)),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
                color: Colors.black,
                iconSize: 30,
              )
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: const Center(
                  child: Text(
                    'Create new task',
                    key: Key('newTester'),
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
                          key: const Key('nameTest'),
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
                          readOnly: true,
                          controller: _controller,
                          key: const Key('dateTest'),
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
                              onPressed: () async {
                                final DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: nDate,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                );

                                if (dateTime != null) {
                                  setState(() {
                                    nDate = dateTime;
                                    _controller.text =
                                        '${dateTime.year}/${dateTime.month}/${dateTime.day}';
                                  });
                                }
                              },
                            ),
                          ),

                          // onChanged: (text) {
                          //   nDate = text;
                          //   print(nDate);
                          // },
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
                            key: const Key('desTest'),
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
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 500,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue!;
                                });
                                if (newValue == 'Not Started') {
                                  nColor = Colors.red;
                                }
                                if (newValue == 'In progress') {
                                  nColor = Colors.yellow;
                                }
                                if (newValue == 'Completed') {
                                  nColor = Colors.green;
                                }
                              },
                              items: status.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
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
                        key: const Key('addtaskbtn'),
                        onPressed: () {
                          // Handle add task button press
                          if (nName != '' &&
                              nDate != '' &&
                              nDescription != '') {
                            Body body =
                                Body(nName, nDate, nDescription, nColor);
                            Navigator.pop(context, body);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(238, 111, 87, 1),
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:taskkmanager/data/body.dart';

class TaskDetail extends StatefulWidget {
  final Body bod;
  const TaskDetail({super.key, required this.bod});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  String nName = "";

  DateTime nDate = DateTime.now();

  String nDescription = "";

  Color? nColor = Colors.black;

  final TextEditingController _controller = TextEditingController();

  List<String> status = ['Not Started', 'In progress', 'Completed'];
  String selectedValue = 'Not Started';

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                color: Color.fromRGBO(238, 111, 87, 1)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Task Detail"),
          centerTitle: true,
          actions: [
            IconButton(
                icon:
                    const Icon(Icons.more_vert, size: 30, color: Colors.black),
                onPressed: () {}),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  // alignment: Alignment.center,
                  child: Image.asset(
                'assets/shopping.png',
                width: 220,
              )),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Title", style: TextStyle(fontSize: 24)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: const Color.fromRGBO(241, 238, 238, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: TextFormField(
                              initialValue: widget.bod.name,
                              // key: const Key('nameTest'),
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          color: const Color.fromRGBO(241, 238, 238, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              readOnly: true,
                              controller: _controller,
                              // initialValue:
                              //     '${widget.bod.date.year}-${widget.bod.date.month.toString().padLeft(2, '0')}-${widget.bod.date.day.toString().padLeft(2, '0')}',

                              key: const Key('dateTest'),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    '${widget.bod.date.year}-${widget.bod.date.month.toString().padLeft(2, '0')}-${widget.bod.date.day.toString().padLeft(2, '0')}',
                                // hintStyle: const TextStyle(
                                //   fontSize: 18,
                                //   fontWeight: FontWeight.bold,
                                //   color: Colors.black,
                                // ),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.calendar_month_rounded,
                                      color: Colors.blue),
                                  onPressed: () async {
                                    final DateTime? dateTime =
                                        await showDatePicker(
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: const Color.fromRGBO(241, 238, 238, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: TextFormField(
                              initialValue: widget.bod.description,
                              key: const Key('nameTest'),
                              onChanged: (text) {
                                nDescription = text;
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: const Color.fromRGBO(241, 238, 238, 1),
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
                        padding: const EdgeInsets.all(14.0),
                        child: Center(
                          child: ElevatedButton(
                            // key: const Key('splashBtn'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(238, 111, 87, 1),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 78, vertical: 14),
                                shape: const RoundedRectangleBorder()),
                            child: const Text("Edit Task",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            onPressed: () {
                              if (nName == '') {
                                nName = widget.bod.name;
                              }
                              if (nDescription.isEmpty) {
                                nDescription = widget.bod.description;
                              }
                              if (nDate == DateTime.now()) {
                                nDate = widget.bod.date;
                              }
                              if (nColor == Colors.black) {
                                nColor = widget.bod.color;
                              }
                              Body nBody =
                                  Body(nName, nDate, nDescription, nColor);
                              Navigator.pop(context, nBody);
                            },
                          ),
                        ),
                      ),
                    ]),
              )
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

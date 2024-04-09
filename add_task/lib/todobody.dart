import "package:flutter/material.dart";

class Todobody extends StatelessWidget {
  const Todobody({super.key});

  @override
  Widget build(context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.center,
            child: Image.asset('assets/stickman.png')),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Tasks List",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
        ),
        SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Card(
                  color: Colors.white,
                  child: _tile(
                      'U', "UI/UX App", "Design", "April 5,2023", Colors.red)),
              Card(
                  color: Colors.white,
                  child: _tile('U', "UI/UX App", "Design", "April 5,2023",
                      Colors.green)),
              Card(
                  color: Colors.white,
                  child: _tile('V', "View Candidates", " ", "April 5,2023",
                      Colors.yellow)),
              Card(
                  color: Colors.white,
                  child: _tile('F', "Football Cu", "Dribbling", "April 5,2023",
                      Colors.pink)),
            ],
          ),
        )),
        //
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 78, vertical: 14),
                  shape: const RoundedRectangleBorder()),
              child: const Text("Create Task",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  ListTile _tile(String lead, String tit, String sub, String trail, Color col) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Text(
          lead,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.normal),
        ),
      ),
      title: Text(
        tit,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        sub,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                trail,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            color: col,
            height: 46,
            width: 4,
          ),
        ],
      ),
    );
  }
}

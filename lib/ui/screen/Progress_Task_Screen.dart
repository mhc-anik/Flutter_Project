import 'package:flutter/material.dart';
import '../widgets/Task_CARD.dart';
import '../widgets/Task_Count_By_Status_CARD.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //const SizedBox(height: 16,),
          /* SizedBox(
            height: 100,
            child: Container(
              color: Colors.green[200],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return TaskCountByStatusCard(title: "New", count: 10);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10);
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ), */
          /*SizedBox(height: 10), */
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                  TaskCard(ChipName: "Progress", ChipColor: Colors.black,),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
            ),
          ),
        ],
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ), */
    );
  }
}



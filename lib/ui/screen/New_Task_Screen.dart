import 'package:flutter/material.dart';
import '../widgets/Task_CARD.dart';
import '../widgets/Task_Count_By_Status_CARD.dart';
import 'Add_New_Task_Screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //const SizedBox(height: 16,),
          SizedBox(
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
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                  TaskCard(ChipName: "New", ChipColor: Colors.blueAccent,),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _AddNewTaskScreen,
        child: Icon(Icons.add),
      ),
    );
  }
  void _AddNewTaskScreen(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddNewTaskScreen()),
    );
  }
}





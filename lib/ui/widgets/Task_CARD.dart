
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key, required this.ChipName, required this.ChipColor,
  });

  final String ChipName;
  final Color ChipColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.green[200],
      title: Text("Title Will be here",style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description Will be here"),
          Text(
            "Date : 14.09.2025",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Chip(
                label: Text("$ChipName"),
                backgroundColor: ChipColor,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

              ),
              Spacer(),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))),
              SizedBox(width: 5),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.blueAccent,))),

            ],
          ),
        ],
      ),
    );
  }
}
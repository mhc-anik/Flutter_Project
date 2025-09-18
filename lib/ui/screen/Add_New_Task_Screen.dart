import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/TM_App_Bar.dart';
import 'package:task_manager/ui/widgets/screen_backGround.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: screenBackGround(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Text("Add New Task",style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Title",
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _descriptionController,
                    textInputAction: TextInputAction.next,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: "Description",
                    ),
                  ),
                  SizedBox(height: 10,),
                  FilledButton(onPressed: (){}, child: Text("Add")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

}

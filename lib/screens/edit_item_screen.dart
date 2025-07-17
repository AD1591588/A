import 'package:flutter/material.dart';

class EditItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل بيانات البضاعة'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('شاشة تعديل بيانات البضاعة'),
      ),
    );
  }
}
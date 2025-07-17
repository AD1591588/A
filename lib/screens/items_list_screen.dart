import 'package:flutter/material.dart';

class ItemsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة البضائع'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('لا توجد بضائع بعد.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
        tooltip: 'إضافة بضاعة جديدة',
      ),
    );
  }
}
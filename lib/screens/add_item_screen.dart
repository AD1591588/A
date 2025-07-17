import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  int quantityOut = 0;
  int quantityLeft = 0;
  double price = 0.0;
  String receiver = '';
  String seller = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة بضاعة جديدة'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'اسم البضاعة'),
                onSaved: (val) => name = val ?? '',
                validator: (val) => val == null || val.isEmpty ? 'مطلوب' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'الكمية المنصرفة'),
                keyboardType: TextInputType.number,
                onSaved: (val) => quantityOut = int.tryParse(val ?? '0') ?? 0,
                validator: (val) => val == null || val.isEmpty ? 'مطلوب' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'الكمية المتبقية'),
                keyboardType: TextInputType.number,
                onSaved: (val) => quantityLeft = int.tryParse(val ?? '0') ?? 0,
                validator: (val) => val == null || val.isEmpty ? 'مطلوب' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'السعر'),
                keyboardType: TextInputType.number,
                onSaved: (val) => price = double.tryParse(val ?? '0') ?? 0.0,
                validator: (val) => val == null || val.isEmpty ? 'مطلوب' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'اسم المستلم'),
                onSaved: (val) => receiver = val ?? '',
                validator: (val) => val == null || val.isEmpty ? 'مطلوب' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'اسم البائع'),
                onSaved: (val) => seller = val ?? '',
                validator: (val) => val == null || val.isEmpty ? 'مطلوب' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // سيتم الحفظ لاحقًا
                    Navigator.pop(context);
                  }
                },
                child: Text('حفظ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
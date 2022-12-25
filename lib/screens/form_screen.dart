import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('tickets');

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _addTickets() async {
    return collectionReference
        .add({
          'title': _titleController.text,
          'description': _descriptionController.text,
          'location': _locationController.text,
          'date': _dateController.text,
        })
        .then((value) => print('ticket added'))
        .catchError(
          (error) => print('Failed to add ticket: $error'),
        );
  }

  getDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('MMM-dd-yyyy').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement

      setState(() {
        _dateController.text =
            formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Ticket Raising Form',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          label: Text(
                            'Title of a Problem',
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          label: Text(
                            'Description of a Problem',
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _locationController,
                        decoration: InputDecoration(
                          label: Text(
                            'Location',
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: _dateController,
                        onTap: getDate,
                        decoration: InputDecoration(
                          labelText: 'Tap to select Date',
                          labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        _addTickets();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

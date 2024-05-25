import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:email_validator/email_validator.dart';

class Protfolio_Hire extends StatefulWidget {
  const Protfolio_Hire({super.key});

  @override
  State<Protfolio_Hire> createState() => _Protfolio_HireState();
}

class _Protfolio_HireState extends State<Protfolio_Hire> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  Future<void> add() async {
    try {
      await FirebaseFirestore.instance.collection("Sarthak").add({
        "name": "Sarthak",
        "company_name": _nameController.text.trim(),
        "company_email": _emailController.text.trim(),
        "company_salary": _salaryController.text.trim(),
        "company_desc": _descController.text.trim(),
        "respondid": const Uuid().v1(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Response Recorded")),
      );
      _nameController.clear();
      _emailController.clear();
      _salaryController.clear();
      _descController.clear();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Contact Me",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: "Company Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: "Company Email",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                TextField(
                  controller: _salaryController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Salary",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                TextField(
                  controller: _descController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: "Description",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ElevatedButton(
                  onPressed: () {
                    final bool isValidEmail = EmailValidator.validate(_emailController.text.toString());
                    isValidEmail
                        ? add()
                        : ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Add Proper Email")));
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

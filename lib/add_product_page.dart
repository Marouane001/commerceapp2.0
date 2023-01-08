import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerceapp/reusable_widgets/reusable_widget.dart';


class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final titreController = TextEditingController();
  final imageController = TextEditingController();
  final tailleController = TextEditingController();
  final prixController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text('Your Product '),
        ),
        body: Container(

            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                      "name :", Icons.add_circle, false, titreController),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                      "image :", Icons.image_search_outlined, false, imageController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                      "Taille :", Icons.photo_size_select_small_rounded, false, tailleController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                      "Price :", Icons.paid_rounded, false, prixController),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        FirebaseFirestore.instance.collection('Products').add({
                          'name': titreController.value.text,
                          'image': imageController.value.text,
                          'taille': tailleController.value.text,
                          'prix': prixController.value.text,
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('Add New product'))
                ]),
              ),
            )));
  }
}
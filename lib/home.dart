import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerceapp/database/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:commerceapp/add_product_page.dart';





class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Dress shop'),
        centerTitle: true,


        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return  Profile();
              },
              fullscreenDialog: true,
            ));
          },
        ),
      ),
      body: const ProductsInformation(),
    );
  }




}

class ProductsInformation extends StatefulWidget {
  const ProductsInformation({Key? key}) : super(key: key);

  @override
  State<ProductsInformation> createState() => _ProductsInformationState();
}

class _ProductsInformationState extends State<ProductsInformation> {
  final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
      .collection('Products').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _productsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> product =
            document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    width: 180,
                    child: Image.network(product['image']),
                  ),

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                product['name'],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              const Text('Prix : '),
                              Text(product['prix'].toString()),
                              const Text(' €'),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Taille : '),
                              Text(product['taille'].toString()),
                            ],
                          ),
                        ],
                      )),
                  new ElevatedButton(onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()))
                  }
                      , child: Text("ADD product"))
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
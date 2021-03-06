import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:souqna_app/Scoped-Model/main.dart';
//import '../scoped-MODEL/connected_model.dart';
import './Product_edit.dart';
import './Product_list.dart';
//import '../models/product.dart';

class ProductsAdminPage extends StatelessWidget {
  Widget _drawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Menue"),
          ),
          ListTile(
            title: Text("All Products "),
            onTap: () => Navigator.pushReplacementNamed(context, '/hom'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: _drawer(context),
          appBar: AppBar(
            title: Text(
              "Manage Products",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Create Products',
                  icon: Icon(Icons.create),
                ),
                Tab(
                  text: 'View Products',
                  icon: Icon(Icons.list),
                )
              ],
            ),
          ),
          backgroundColor: Colors.blueGrey[200],
          body: ScopedModelDescendant(
            builder: (BuildContext context, Widget child, MainModel model) {
              return TabBarView(
                children: <Widget>[
                  ProductEdit(),
                  ProductList(model: model),
                ],
              );
            },
          )),
    );
  }
}

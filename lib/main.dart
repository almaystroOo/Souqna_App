import './Pages/AUTH.dart';
import './pages/products.dart';
//import './pages/products_admin.dart';
import './Pages/products_admin.dart';
import './Pages/product.dart';
import './models/product.dart';
import './Pages/Product_list.dart';
import './Scoped-Model/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<MyApp> {
  //final int index = );
  // void didUpdateWidget(MyApp oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    MainModel model = MainModel();
    return ScopedModel<MainModel>(
        model: model,
        child: MaterialApp(
          title: "list app",
          theme: ThemeData(
              primarySwatch: Colors.orange,
              accentColor: Colors.white70,
              primaryColor: Colors.orange,
              fontFamily: "oswald"),
          home: AuthPage(),
          routes: {
            '/hom': (BuildContext context) => ProductsPage(
                  model: model,
                ),
            '/admin': (BuildContext context) => ProductsAdminPage(),
            // updateProduct ,, addProduct),
            '/edit': (BuildContext context) => ProductList(model: model),

            // '/product': (BuildContext context) => ProductPage( _products[index]['title'], _products[index]['image']),
          },
          onGenerateRoute: (RouteSettings settings) {
            final List<String> pathElement = settings.name.split('/');
            if (pathElement[0] != '') {
              return null;
            }
            if (pathElement[1] == 'product') {
              final String productId = (pathElement[2]);
              model.selectedId(productId);
              return MaterialPageRoute<bool>(
                  builder: (BuildContext context) => ProductPage());
            }
            return null;
          },
          onUnknownRoute: (RouteSettings setting) {
            return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage(
                model: model,
              ),
            );
          },
        ));
  }
}

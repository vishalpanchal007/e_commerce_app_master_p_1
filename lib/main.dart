import 'package:e_commerce_app/cartshopping.dart';
import 'package:e_commerce_app/categorypage.dart';
import 'package:e_commerce_app/favourite.dart';
import 'package:e_commerce_app/helper/fakestore_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const MyApp(),
        "CategoryPage": (context) => const CategoryPage(),
        "CartShping_Page": (context) => const CartShping_Page(),
        "Favourite_Page": (context) => const Favourite_Page(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int index = 0;

List categoryProduct = [
  "Electronics",
  "Men's Clothing",
  "Jewellery",
  "Women's Clothing",
];

List cartList = [];
List favouriteList = [];
List showOneCategoryList = [];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Super Market"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FakeStoreApiHelper.currencyApiHelper.fetchFakeStoreData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List storeData = snapshot.data;

            return GridView.builder(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 15, bottom: 15),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 290,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("CategoryPage");
                    setState(() {
                      index = i;
                    });

                    showOneCategoryList = [];

                    for (int i = 0; i < storeData.length; i++) {
                      if (storeData[i].category.toString().toUpperCase() ==
                          categoryProduct[index].toString().toUpperCase()) {
                        showOneCategoryList.add(storeData[i]);
                      }
                    }
                  },
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text(
                      categoryProduct[i],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

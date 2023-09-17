import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryProduct[index]),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Row(
              children: [
                const Icon(
                  Icons.add_shopping_cart_sharp,
                  size: 16,
                ),
                Text(
                  "${cartList.length}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed("CartShping_Page");
              });
            },
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding:
        const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        itemCount: showOneCategoryList.length,
        separatorBuilder: (context, i) => const SizedBox(height: 13),
        itemBuilder: (context, i) => Container(
          height: 195,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(showOneCategoryList[i].image),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Stock : ${showOneCategoryList[i].stock}",
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 210,
                    child: Text(
                      showOneCategoryList[i].title,
                      maxLines: 2,
                      style: GoogleFonts.openSans(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (1 < showOneCategoryList[i].count) {
                              "${showOneCategoryList[i].count--}";
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 5),
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("${showOneCategoryList[i].count}"),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 5),
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (showOneCategoryList[i].count <
                                showOneCategoryList[i].stock) {
                              showOneCategoryList[i].count++;

                              showOneCategoryList[i].total =
                                  showOneCategoryList[i].count *
                                      showOneCategoryList[i].price;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    "\u{20B9} : ${showOneCategoryList[i].price * showOneCategoryList[i].count} ",
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: 60,
                        child: FloatingActionButton(
                          heroTag: null,
                          mini: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "ADD",
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (showOneCategoryList[i].addorNot) {
                                showOneCategoryList[i].addorNot = false;
                                cartList.add(showOneCategoryList[i]);
                              }
                              showOneCategoryList[i].total =
                                  showOneCategoryList[i].count *
                                      showOneCategoryList[i].price;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

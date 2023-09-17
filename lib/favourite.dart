import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite_Page extends StatefulWidget {
  const Favourite_Page({super.key});

  @override
  State<Favourite_Page> createState() => _Favourite_PageState();
}

class _Favourite_PageState extends State<Favourite_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FavouriteList Shopping"),
        centerTitle: true,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding:
        const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        itemCount: favouriteList.length,
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
                        image: NetworkImage(favouriteList[i].image),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Stock : ${favouriteList[i].stock}",
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
                      favouriteList[i].title,
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
                            if (1 < favouriteList[i].count) {
                              "${favouriteList[i].count--}";
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
                        child: Text("${favouriteList[i].count}"),
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
                            if (favouriteList[i].count <
                                favouriteList[i].stock) {
                              favouriteList[i].count++;

                              favouriteList[i].total = favouriteList[i].count *
                                  favouriteList[i].price;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    "\u{20B9} : ${favouriteList[i].price * favouriteList[i].count} ",
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
                              if (favouriteList[i].addorNot) {
                                favouriteList[i].addorNot = false;
                                favouriteList.add(favouriteList[i]);
                              }
                              favouriteList[i].total = favouriteList[i].count *
                                  favouriteList[i].price;
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

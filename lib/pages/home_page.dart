import 'package:coffeeappui/utils/coffee_tile.dart';
import 'package:coffeeappui/utils/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeType = [
    // [ coffee type, isSelected ]
    ['Cappucino', true],
    ['Latte', false],
    ['Flat White', false],
    ['Espresso', false],
  ];

  // user tapped on coffee type
  void coffeeTypeSelected(int index) {
    // this is for loop makes sure only one coffee type is selected
    for (int i = 0; i < coffeeType.length; i++) {
      coffeeType[i][1] = false;
    }
    setState(() {
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.person),
          ),
        ],
      ),

      // bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),

      // Body
      body: Column(
        children: [
          // find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 25),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),

          // Horizontal view of coffee categories
          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      });
                }),
          ),

          // Horizontal listview of coffee tiles
          Container(
            height: 400,
            child: Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                    coffeeName: 'Cappucino',
                    coffeeImagePath: 'lib/images/cappucinno.webp',
                    coffeePrice: '6.99',
                  ),
                  CoffeeTile(
                    coffeeName: 'Latte',
                    coffeeImagePath: 'lib/images/cappucino#2.jpg',
                    coffeePrice: '5.99',
                  ),
                  CoffeeTile(
                    coffeeName: 'Flat White',
                    coffeeImagePath: 'lib/images/coffee.jpg',
                    coffeePrice: '2.99',
                  ),
                  CoffeeTile(
                    coffeeName: 'Espresso',
                    coffeeImagePath: 'lib/images/cappucino.png',
                    coffeePrice: '4.99',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

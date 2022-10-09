import 'package:coffee_ui/util/coffee_tile.dart';
import 'package:coffee_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of Coffee Type....

  final List coffeeType = [
    //Coffee Type isSelected....
    ['Cappucino', true],
    ['Latte', false],
    ['Milk', false],
    ['Tea', false],
  ];

  // User Tapped on Coffee Tytpe....

  void coffeeTypeSelected(int index) {
    setState(() {
      //this for make loops every selection false....
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }

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
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ]),
      body: Column(
        // find the best coffee for you....
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                fontSize: 45,
              ),
            ),
          ),
          SizedBox(height: 10),

          // Search Bar....

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee....',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 10),

          //Horizontal ListView of Coffee Types....

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
                  },
                );
              },
            ),
          ),

          SizedBox(height: 10),

          //Horizontal ListView of Coffee Tiles....

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeTile(
                  coffeeImagePath: 'assets/6.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: '4.09',
                ),
                CoffeTile(
                  coffeeImagePath: 'assets/5.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '4.12',
                ),
                CoffeTile(
                  coffeeImagePath: 'assets/4.jpg',
                  coffeeName: 'Milk',
                  coffeePrice: '4.15',
                ),
                CoffeTile(
                  coffeeImagePath: 'assets/1.jpg',
                  coffeeName: 'Tea',
                  coffeePrice: '4.17',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

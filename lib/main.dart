import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wine App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WineHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WineHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Vinodiversity Drive', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text('1', style: TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Shop wines by',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildChip('Type', isSelected: true),
                _buildChip('Style'),
                _buildChip('Countries'),
                _buildChip('Grape'),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildWineTypeCard('Red wines', 123, 'assets/images/pngwing 2.png'),
                SizedBox(width: 16),
                _buildWineTypeCard('White wines', 123, 'assets/images/NicePng_grape-vine-png_725363 1.png'),
                SizedBox(width: 16),
                _buildWineTypeCard('Rosé wines', 123, 'assets/images/pngwing 2.png'),
                SizedBox(width: 16),
                _buildWineTypeCard('Sparkling wines', 123, 'assets/images/NicePng_grape-vine-png_725363 1.png'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Wine',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _buildWineItem('Ocean Blueprint Reserva tinto Reserva', 'Red wine', 'France', '23,256,696', 'assets/images/Rectangle 9 (3).png'),
          _buildWineItem('2021 Pure Chablis Passy Le Clou', 'White wine', 'France', '23,256,696', 'assets/images/Rectangle 9.png'),
          _buildWineItem('Philippe Fontaine Champagne Brut Rosé de Saignée, NV', 'Sparkling wine', 'France', '23,256,696', 'assets/images/Rectangle 9 (1).png', isPopular: true),
          _buildWineItem('2021 Gérard s Song Rosé', 'Rosé wine', 'France', '23,256,696', 'assets/images/Rectangle 9 (2).png'),
        ],
      ),
    );
  }

  Widget _buildChip(String label, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isSelected ? Colors.pink : Colors.grey[200],
      ),
    );
  }

  Widget _buildWineTypeCard(String title, int count, String imagePath) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('$count', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wine_bar, size: 50, color: title.contains('Red') ? Colors.red : Colors.yellow[700]),
                SizedBox(height: 8),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWineItem(String name, String type, String country, String price, String imagePath, {bool isPopular = false}) {
    return ListTile(
      leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$type • $country'),
          Text('₩ $price', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isPopular)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('Popular', style: TextStyle(color: Colors.white, fontSize: 10)),
            ),
          Icon(Icons.favorite_border),
        ],
      ),
    );
  }
}

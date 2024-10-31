import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sumiy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'Menu Sumiy Hari Ini'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
          },
        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              Flexible(
                child: _buildRecipeCard(
                  title: 'Bubur Babi',
                  rating: 4.8,
                  time: '18 mnt',
                  price: '32 rb',
                  sellerName: 'SUMIY OFFICIAL',
                  sellerImage: 'assets/images/logo.jpeg',
                  isVerified: true,
                  imageUrl: 'assets/images/bubur.jpeg',
                ),
              ),
              const SizedBox(width: 16.0),
              Flexible(
                child: _buildRecipeCard(
                  title: 'Chocolate Chocochips',
                  rating: 4.8,
                  time: '7 mnt',
                  price: '38 rb',
                  sellerName: 'SUMIY OFFICIAL',
                  sellerImage: 'assets/images/logo.jpeg',
                  isVerified: true,
                  imageUrl: 'assets/images/coklat.jpeg',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Flexible(
                child: _buildRecipeCard(
                  title: 'MieMiean',
                  rating: 4.8,
                  time: '20 mnt',
                  price: ' 40rb',
                  sellerName: 'SUMIY OFFICIAL',
                  sellerImage: 'assets/images/logo.jpeg',
                  isVerified: true,
                  imageUrl: 'assets/images/mie.jpeg',
                ),
              ),
              const SizedBox(width: 16.0),
              Flexible(
                child: _buildRecipeCard(
                  title: 'Salad Ramban',
                  rating: 5.0,
                  time: '10 mnt',
                  price: '125rb',
                  sellerName: 'SUMIY OFFICIAL',
                  sellerImage: 'assets/images/logo.jpeg',
                  isVerified: true,
                  imageUrl: 'assets/images/salad.jpeg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCard({
    required String title,
    required double rating,
    required String time,
    required String price,
    required String sellerName,
    required String sellerImage,
    required bool isVerified,
    required String imageUrl,
  }) {
    return Card(
      color: const Color.fromARGB(255, 126, 172, 128),
      elevation: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(sellerImage),
                  radius: 20.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  sellerName,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                if (isVerified)
                  Container(
                    padding: const EdgeInsets.all(2.0), 
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 16.0),
                  ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              imageUrl,
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange),
                    Text('$rating'),
                    const SizedBox(width: 16.0),
                    const Icon(Icons.timer, color: Colors.grey),
                    Text(time),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.remove_red_eye, color: Colors.grey, size: 16.0),
                        const SizedBox(width: 4.0),
                        Text(price),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.bookmark_border, color: Colors.black, size: 24.0),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$title bookmarked!'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

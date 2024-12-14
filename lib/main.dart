import 'package:flutter/material.dart';
import 'package:madmon_task/bottom_nav_bar.dart';
import 'package:madmon_task/custom_app_bar.dart';
import 'package:svg_flutter/svg.dart';
import 'custom_card.dart'; // Ensure you import your CustomCard widget here

const textTheme = TextTheme(
  bodyLarge: TextStyle(
    color: Colors.black,
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  bodyMedium: TextStyle(
    color: Color(0xffA2A7AF),
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
);
final borderStyle = Border.all(color: const Color(0xffDCDCFF), width: 1);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          textTheme: textTheme,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 1,
            selectedItemColor: Color(0xff0512F5),
            unselectedItemColor: Color(0xffA2A7AF),
            selectedLabelStyle: TextStyle(color: Color(0xff0512F5)),
            unselectedLabelStyle: TextStyle(color: Color(0xffA2A7AF)),
            selectedIconTheme: IconThemeData(color: Color(0xff0512F5)),
            unselectedIconTheme: IconThemeData(color: Color(0xffA2A7AF)),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          )),
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: const CustomAppBar(),
          backgroundColor: Colors.white,
          bottomNavigationBar: const CustomBottomNavBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CustomScrollView(
              slivers: [
                // SliverToBoxAdapter(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 25.0),
                //     child: _buildSearchRow(context),
                //   ),
                // ),
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: _buildSearchRow(context),
                  ),
                  toolbarHeight: 80.0, // Adjust this to fit your design
                ),
                SliverList.builder(
                  itemCount: listOfCards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return listOfCards[index];
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Container _buildSearchRow(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          // Search Field
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffDCDCFF), width: 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Search...",
                      style: TextStyle(fontSize: 14, color: Color(0xffA2A7AF), fontFamily: 'Poppins', fontWeight: FontWeight.w400, letterSpacing: 0),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/magnifier.svg',
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Arrange Button
          _buildIconButton(
            context,
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/arrange.svg',
              ),
            ),
            onPressed: () {
              _showBottomModalSheet(context, "Arrange Options");
            },
          ),
          const SizedBox(width: 8),
          // Drawer Button
          _buildIconButton(
            context,
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/mage_filter.svg',
              ),
            ),
            onPressed: () {
              _showBottomModalSheet(context, "Drawer Options");
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildIconButton(BuildContext context, {required Widget icon, required VoidCallback onPressed}) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: borderStyle,
    ),
    child: InkWell(
      onTap: onPressed,
      child: icon,
    ),
  );
}

void _showBottomModalSheet(BuildContext context, String title) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text("Here you can show options or content related to $title."),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        ),
      );
    },
  );
}

const listOfCards = [
  CustomCard(
    number: 123,
    status: 'new',
    location: 'Cairo, Egypt',
    sellerName: 'Abd El-rahman Ahmed',
    sellerPhone: '+20 123 456 7890',
    buyerName: 'John Doe',
    buyerPhone: '+20 987 654 3210',
    unitPrice: '\$200,000',
    unitCommission: '\$10,000',
    dateReserved: '2024/12/03', // Date format changed statically
    lastAction: 'Follow Up',
  ),
  CustomCard(
    number: 124,
    status: 'contract signed',
    location: 'Alexandria, Egypt',
    sellerName: 'Sarah Khaled',
    sellerPhone: '+20 234 567 8901',
    buyerName: 'Jane Smith',
    buyerPhone: '+20 876 543 2109',
    unitPrice: '\$150,000',
    unitCommission: '\$7,500',
    dateReserved: '2024/12/05', // Date format changed statically
    lastAction: 'Meeting Scheduled',
  ),
  CustomCard(
    number: 125,
    status: 'no answer',
    location: 'Giza, Egypt',
    sellerName: 'Mohamed Ali',
    sellerPhone: '+20 345 678 9012',
    buyerName: 'David Johnson',
    buyerPhone: '+20 765 432 1098',
    unitPrice: '\$180,000',
    unitCommission: '\$9,000',
    dateReserved: '2024/12/06', // Date format changed statically
    lastAction: 'Follow Up',
  ),
  CustomCard(
    number: 126,
    status: 'commission',
    location: 'Hurghada, Egypt',
    sellerName: 'Mona Samir',
    sellerPhone: '+20 456 789 0123',
    buyerName: 'Chris Lee',
    buyerPhone: '+20 654 321 0987',
    unitPrice: '\$220,000',
    unitCommission: '\$11,000',
    dateReserved: '2024/12/07', // Date format changed statically
    lastAction: 'Contract Signed',
  ),
  CustomCard(
    number: 127,
    status: 'meeting scheduled',
    location: 'Sharm El-Sheikh, Egypt',
    sellerName: 'Tamer Ghanem',
    sellerPhone: '+20 567 890 1234',
    buyerName: 'Sophia Green',
    buyerPhone: '+20 765 432 1098',
    unitPrice: '\$250,000',
    unitCommission: '\$12,500',
    dateReserved: '2024/12/08', // Date format changed statically
    lastAction: 'Follow Up',
  ),
  CustomCard(
    number: 128,
    status: 'follow up',
    location: 'Aswan, Egypt',
    sellerName: 'Hassan Fathy',
    sellerPhone: '+20 678 901 2345',
    buyerName: 'Robert White',
    buyerPhone: '+20 876 543 2109',
    unitPrice: '\$180,000',
    unitCommission: '\$9,000',
    dateReserved: '2024/12/09', // Date format changed statically
    lastAction: 'Follow Up',
  ),
];

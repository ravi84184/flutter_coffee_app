import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with profile and menu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.menu, color: Color(0xFF2F2D2C)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Hi William text
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hi, ',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 28,
                            color: Color(0xFF2F2D2C),
                          ),
                        ),
                        TextSpan(
                          text: 'William',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2F2D2C),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Search bar
                  Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Coffee shop, beer & wine...',
                              hintStyle: const TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 14,
                                color: Color(0xFF9B9B9B),
                              ),
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(14),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.search,
                                    color: Color(0xFF2F2D2C),
                                    size: 20,
                                  ),
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6B4731),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const SizedBox(
                            width: 44,
                            height: 44,
                            child: Icon(
                              Icons.tune_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Categories
            SizedBox(
              height: 38,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildCategoryItem('☕ Coffee', true),
                  _buildCategoryItem('🍺 Beer', false),
                  _buildCategoryItem('🍷 Wine Bar', false),
                  _buildCategoryItem('🎫 Events', false),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Products
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildProductSection(
                      'Popular Now',
                      [
                        _buildProductCard(
                          'Chai Latte',
                          '\$85.00',
                          'https://cdn-icons-png.flaticon.com/512/924/924514.png',
                          true,
                        ),
                        _buildProductCard(
                          'Matcha Latte',
                          '\$22.00',
                          'https://cdn-icons-png.flaticon.com/512/924/924514.png',
                          false,
                        ),
                        _buildProductCard(
                          'Red Eye Coffee',
                          '\$60.00',
                          'https://cdn-icons-png.flaticon.com/512/924/924514.png',
                          false,
                        ),
                      ],
                      isScrollable: true),
                  const SizedBox(height: 24),
                  _buildFrozenBeveragesSection(),
                  const SizedBox(height: 24),
                  _buildKavaAndBottledSection(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFC67C4E),
          unselectedItemColor: const Color(0xFF8D8D8D),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFC67C4E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.grid_view_rounded, color: Colors.white),
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Material(
        color: isSelected ? const Color(0xFF6B4731) : const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xFF2F2D2C),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFrozenBeveragesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Frozen Beverages',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F2D2C),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 25),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'See All',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 14,
                  color: Color(0xFFC67C4E),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildFrozenBeverageCard(
                'Coffee',
                '\$22.00',
                'https://cdn-icons-png.flaticon.com/512/924/924514.png',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildFrozenBeverageCard(
                'Coffee',
                '\$85.00',
                'https://cdn-icons-png.flaticon.com/512/924/924514.png',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFrozenBeverageCard(String name, String price, String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2F2D2C),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC67C4E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductSection(String title, List<Widget> products,
      {bool isScrollable = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F2D2C),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 25),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'See All',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 14,
                  color: Color(0xFFC67C4E),
                ),
              ),
            ),
          ],
        ),
        if (isScrollable)
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: products,
            ),
          )
        else
          ...products,
      ],
    );
  }

  Widget _buildProductCard(
      String name, String price, String imageUrl, bool isSelected) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 150,
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF6B4731) : Color(0xffDCDCDC),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10000),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10000),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF2F2D2C),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        price,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFFC67C4E),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKavaAndBottledSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Kava and Bottled Beverages',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F2D2C),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 25),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'See All',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 14,
                  color: Color(0xFFC67C4E),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildFrozenBeverageCard(
                'Kava',
                '\$22.00',
                'https://cdn-icons-png.flaticon.com/512/924/924514.png',
              ),
              const SizedBox(width: 12),
              _buildFrozenBeverageCard(
                'Bottled Coffee',
                '\$85.00',
                'https://cdn-icons-png.flaticon.com/512/924/924514.png',
              ),
              const SizedBox(width: 12),
              _buildFrozenBeverageCard(
                'Cold Brew',
                '\$32.00',
                'https://cdn-icons-png.flaticon.com/512/924/924514.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

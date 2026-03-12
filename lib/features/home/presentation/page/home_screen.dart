import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/features/home/presentation/widgets/banner_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<String> books = [
    AppImages.bookImage,
    AppImages.book,
    AppImages.bookImage,
    AppImages.book,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

     
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.homeIcon,
              width: 26,
              color: const Color(0xffC5A35A),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.bookmarkIcon,
              width: 26,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.cartIcon,
              width: 26,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.profileIcon,
              width: 26,
            ),
            label: "",
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                 
                  SvgPicture.asset(
                    AppImages.logo,
                    width: 80,
                  ),

                 
                  Image.asset(
                    AppImages.searchIcon,
                    width: 26,
                  ),
                ],
              ),

              const SizedBox(height: 25),

          
              const BannerSlider(),

              const SizedBox(height: 30),

            
              const Text(
                "Best Seller",
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: "DMSerifDisplay",
                ),
              ),

              const SizedBox(height: 20),

           
              GridView.builder(
                itemCount: books.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                  childAspectRatio: .70,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xffEDE6DA),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                    
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            books[index],
                            height: 170,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          "The Republic",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "DMSerifDisplay",
                          ),
                        ),

                        const Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "₹285",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "Buy",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
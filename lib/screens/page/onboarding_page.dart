import 'package:carousel_slider/carousel_slider.dart';
import 'package:cashier_app_ui/config/theme.dart';
import 'package:cashier_app_ui/helpers/route_helper.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final CarouselController _carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: OnBoardingCarouselImage(
                    carouselController: _carouselController,
                    onPageChanged: (index) => setState(() {
                      currentIndex = index;
                    }),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white, // Ganti dengan warna yang sesuai
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Indicator(isActive: currentIndex == 0),
                    Indicator(isActive: currentIndex == 1),
                    Indicator(isActive: currentIndex == 2),
                  ],
                ),
                const SizedBox(height: 36),
                OnBoardingCarouselContent(
                    title: onboardingText[currentIndex]['title']!,
                    description: onboardingText[currentIndex]['description']!),
                const SizedBox(height: 32),
                OnBoardingCarouselActionBottom(
                  carouselController: _carouselController,
                  currentIndex: currentIndex,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    Color color = isActive ? DColors.blue : DColors.subtleBlue;
    double width = isActive ? 32 : 8;
    return Container(
      width: width,
      height: 8,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
    );
  }
}

class OnBoardingCarouselImage extends StatelessWidget {
  final CarouselController carouselController;
  final Function(int) onPageChanged;
  const OnBoardingCarouselImage(
      {super.key,
      required this.carouselController,
      required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _carouselItem,
      options: CarouselOptions(
          enableInfiniteScroll: false,
          aspectRatio: 1,
          viewportFraction: 1,
          onPageChanged: (index, reason) => onPageChanged(index)),
      carouselController: carouselController,
    );
  }
}

class OnBoardingCarouselContent extends StatelessWidget {
  final String title;
  final String description;
  const OnBoardingCarouselContent(
      {super.key, required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: DTextStyle.setStyle(
              size: DTextSizes.extraLarge,
              color: DColors.black,
              fontWeight: DFontWeight.semiBold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: DTextStyle.setStyle(
              size: DTextSizes.normal,
              color: DColors.darkGrey,
              fontWeight: DFontWeight.reguler),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class OnBoardingCarouselActionBottom extends StatelessWidget {
  final CarouselController carouselController;
  final int currentIndex;
  const OnBoardingCarouselActionBottom(
      {super.key, required this.carouselController, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: currentIndex == 2 ? _buttonGetStarted(context) : _actionButtonNext(context));
  }

  Widget _actionButtonNext(context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buttonSkip(context), _buttonNext()]);
  }

  Widget _buttonGetStarted(context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextButton(
          onPressed: () => navigateAndRemoveNamed(context, 'dashboard'),
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: DColors.blue),
          child: Text(
            'Get Started',
            style: DTextStyle.setStyle(
                color: Colors.white, fontWeight: DFontWeight.semiBold),
          )),
    );
  }

  Widget _buttonSkip(context) {
    return SizedBox(
      height: 40,
      child: TextButton(
          onPressed: () => navigateAndRemoveNamed(context, 'dashboard'),
          child: Text(
            'Skip',
            style: DTextStyle.setStyle(
                fontWeight: DFontWeight.reguler, color: DColors.blue, size: DTextSizes.small),
          )),
    );
  }

  Widget _buttonNext() {
    onPressed() => carouselController.nextPage();
    return SizedBox(
      height: 40,
      width: 100,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: DColors.blue),
          onPressed: onPressed,
          child: IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              color: Colors.white,
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_right_alt_rounded))),
    );
  }
}

List<Image> _carouselItem = [
  Image.asset('assets/image/onboarding1.png'),
  Image.asset('assets/image/onboarding2.png'),
  Image.asset('assets/image/onboarding3.png'),
];

final List<Map<String, String>> onboardingText = [
  {
    'title': 'Buka Kapan Saja',
    'description': 'Jangan takut tidak kebagian barang\nkarena kami buka 24/7'
  },
  {
    'title': 'Harga Murah Meriah',
    'description': 'Barang kami 99% lebih murah\ndari toko lainnya'
  },
  {
    'title': 'Belanja Lebih Nyaman',
    'description': 'Kamu akan nyaman berbelanja\nkarena murah dan selalu buka'
  },
];

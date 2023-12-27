import 'package:authentication_app/provider/onBoarding_provider.dart';
import 'package:authentication_app/view/screens/loginscreen.dart';
import 'package:authentication_app/view/widgets/onBoarding_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/constant/image_strings.dart';
import '../../utils/constant/text_strings.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller:_controller,
              onPageChanged: (index) {
                final provider = Provider.of<OnboardingProvider>(context, listen: false);
                provider.currentPage = index;
              },
              children: const [
                OnBoardingPage(
                    image: SImages.onBoardingImage1,
                    title: STexts.onBoardingTitle1,
                    subTitle: STexts.onBoardingSubTitle1),
                OnBoardingPage(
                    image: SImages.onBoardingImage2,
                    title: STexts.onBoardingTitle2,
                    subTitle: STexts.onBoardingSubTitle2),
                OnBoardingPage(
                    image: SImages.onBoardingImage3,
                    title: STexts.onBoardingTitle3,
                    subTitle: STexts.onBoardingSubTitle3),
              ],
            ),

            Positioned(
              top: 50.0, // Adjust the position as needed
              right: 16.0,
              child: TextButton(
                onPressed: () {
                  final provider = Provider.of<OnboardingProvider>(context, listen: false);
                  provider.markOnboardingDone(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Mylogin()));
                },
                child: const Text("Skip"),
              ),
            ),

            Positioned(
              right: 16.0,
              bottom: 16.0,
              child: ElevatedButton(
                onPressed: () {
                  final provider = Provider.of<OnboardingProvider>(context, listen: false);
                  if (provider.isLastPage) {
                    provider.markOnboardingDone(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Mylogin()));
                  } else {
                    provider.nextPage();
                    _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                  }
                },
                style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: Colors.blue),
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
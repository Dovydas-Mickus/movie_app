import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/features/home/widgets/featured/featured_widget.dart';
import 'package:movie_app/presentation/features/home/widgets/search/search_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset(height: 150, 'assets/images/logo.png'),),
                    Center(child: Text("Movies", style: GoogleFonts.nunito(fontSize: 50),))
                  ],
                ),
              ),
              
              SearchWidget(),

              FeaturedWidget()
            ],
          ),
        ),
      ),
    );
  }
}

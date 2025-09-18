import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Features/home_page/presentation/view/widgets/brand_item_list_view.dart';
import 'package:auto_swift/Features/home_page/presentation/view/widgets/car_item_grid_view.dart';
import 'package:auto_swift/Features/home_page/presentation/view/widgets/home_page_header.dart';
import 'package:auto_swift/Features/home_page/presentation/view/widgets/welcome_message.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageHeader(),
              WelcomeMessage(),
              Text("Choose Your Ideal Car", style: AppStyles.styleSemiBold14(context)),
              BrandItemListView(),
              Expanded(child: CarItemGridView()),
            ],
          ),
        ),
      ),
    );
  }
}

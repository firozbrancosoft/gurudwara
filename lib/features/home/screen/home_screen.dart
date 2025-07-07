import 'package:flutter/material.dart';
import 'package:gurudwara/core/widgets/custom_image_widget.dart';

import '../../../core/constants/image_constants.dart';
import '../controller/home_controller.dart';
import 'package:get/get.dart';

import '../widget/gurudwara_card.dart';
import '../widget/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageWidget(
              imagePath:  ImageConstants.logo,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            )
            ,Text(
              'Welcome to Gurudwara',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: controller.refresh,
        child: Column(
          children: [
            // Search Bar
            Container(
              margin: const EdgeInsets.all(16),
              child: SearchWidget(
                onChanged: controller.onSearchChanged,
              ),
            ),

            // Near By Gurudwaras Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Near By Gurudwaras',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Gurudwara List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                }

                if (controller.filteredGurudwaras.isEmpty) {
                  return const Center(
                    child: Text(
                      'No gurudwaras found',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.filteredGurudwaras.length,
                  itemBuilder: (context, index) {
                    final gurudwara = controller.filteredGurudwaras[index];
                    return GurudwaraCard(
                      gurudwara: gurudwara,
                      isFavorite: controller.isFavorite(gurudwara.id),
                      onFavoriteToggle: () => controller.toggleFavorite(gurudwara.id),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

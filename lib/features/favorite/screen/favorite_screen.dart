import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurudwara/core/utils/custom_app_bar.dart';
import '../../home/widget/gurudwara_card.dart';
import '../controller/favorite_controller.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoriteController>();
    return Scaffold(
      appBar: CustomAppBar(title: "Favourite Gurudwara",showBackButton: false,centerTitle: false,

      ),
      body: RefreshIndicator(
        onRefresh: controller.refresh,
        child: Column(
          children: [

            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                }

                if (controller.favoriteGurudwaras.isEmpty) {
                  return const Center(
                    child: Text(
                      'No favorite Gurudwaras found',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.favoriteGurudwaras.length,
                  itemBuilder: (context, index) {
                    final gurudwara = controller.favoriteGurudwaras[index];
                    return GurudwaraCard(
                      gurudwara: gurudwara,
                      isFavorite: true,
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

import 'package:flutter/material.dart';

import '../model/reward_model.dart';

class RewardCardWidget extends StatelessWidget {
  final RewardModel reward;
  final VoidCallback? onTap;

  const RewardCardWidget({
    Key? key,
    required this.reward,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: reward.imageUrl.isNotEmpty
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    reward.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _getRewardIcon(reward.name);
                    },
                  ),
                )
                    : _getRewardIcon(reward.name),
              ),
              const SizedBox(height: 8),
              Text(
                reward.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                '${reward.points} Points',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRewardIcon(String name) {
    IconData icon;
    switch (name.toLowerCase()) {
      case 'laptop':
        icon = Icons.laptop;
        break;
      case 'cycle':
        icon = Icons.directions_bike;
        break;
      case 'tablet':
        icon = Icons.tablet;
        break;
      case 'bag':
        icon = Icons.shopping_bag;
        break;
      default:
        icon = Icons.card_giftcard;
    }

    return Icon(
      icon,
      size: 30,
      color: Colors.orange,
    );
  }
}

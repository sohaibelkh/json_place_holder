import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/constants.dart';

class UsersListViewItem extends StatelessWidget {
  const UsersListViewItem({
    super.key,
    required this.name,
    required this.city,
    required this.email,
    required this.company,
  });

  final String name;
  final String city;
  final String email;
  final String company;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      height: 200,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 22, color: Colors.black),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.person,
                color: kPurpleColor,
                size: 28,
              ),
            ],
          ),
          const SizedBox(height: 8),
           Text(
            'City : $city',
            style: const TextStyle(fontSize: 18, color: kGreyColor),
          ),
          const SizedBox(height: 8),
           Text(
            'Email : $email',
            style:const TextStyle(fontSize: 18, color: kGreyColor),
          ),
          const SizedBox(height: 8),
           Text(
            'Company : $company',
            style:const TextStyle(fontSize: 18, color: kGreyColor),
          ),
          const SizedBox(height: 16),
          const Text(
            'Tap to see more..',
            style: TextStyle(fontSize: 16, color: kPurpleColor),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: Colors.white),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionButton(
            icon: Icons.swap_horiz_rounded,
            label: "Transfer",
            onTap: () {
              // Handle transfer tap
              print("Transfer tapped");
            },
          ),
          ActionButton(
            icon: Icons.cached_outlined,
            label: "Request",
            onTap: () {
              // Handle request tap
              print("Request tapped");
            },
          ),
          ActionButton(
            icon: Icons.qr_code_scanner,
            label: "Code scan",
            onTap: () {
              // Handle code scan tap
              print("Code scan tapped");
            },
          ),
          ActionButton(
            icon: Icons.location_on,
            label: "ATMs",
            onTap: () {
              // Handle ATMs tap
              print("ATMs tapped");
            },
          ),
        ],
      ),
    );
  }
}

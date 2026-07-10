import 'package:flutter/material.dart';

class NotificationsSheet extends StatelessWidget {
  const NotificationsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black12, height: 1),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: _dummyNotifications.length,
                  separatorBuilder: (_, __) =>
                      const Divider(color: Colors.black12, height: 1),
                  itemBuilder: (context, index) {
                    final item = _dummyNotifications[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.notifications, color: Colors.white),
                      ),
                      title: Text(
                        item['title']!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        item['subtitle']!,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      trailing: Text(
                        item['time']!,
                        style: const TextStyle(
                          color: Colors.black38,
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

const _dummyNotifications = [
  {
    'title': 'New Order',
    'subtitle': 'Your order #1023 has shipped',
    'time': '2m'
  },
  {
    'title': 'Special Offer',
    'subtitle': '20% off on new arrivals',
    'time': '1h'
  },
  {
    'title': 'Reminder',
    'subtitle': 'An item in your cart is waiting',
    'time': '3h'
  },
  {
    'title': 'Special Offer',
    'subtitle': '20% off on new arrivals',
    'time': '1h'
  },
  {
    'title': 'New Order',
    'subtitle': 'Your order #1023 has shipped',
    'time': '2m'
  },
  {
    'title': 'Reminder',
    'subtitle': 'An item in your cart is waiting',
    'time': '3h'
  },
];

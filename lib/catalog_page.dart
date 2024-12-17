import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  final List<ServiceItem> services = const [
    ServiceItem(name: 'ПЦР-тест на определение РНК коронавируса стандартный', days: '2 дня', price: 1800),
    ServiceItem(name: 'Клинический анализ крови с лейкоцитарной формулировкой', days: '1 день', price: 690),
    ServiceItem(name: 'Биохимический анализ крови, базовый', days: '1 день', price: 2440),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Каталог услуг',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: services.length,
        itemBuilder: (context, index) => ServiceCard(service: services[index]),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final ServiceItem service;

  const ServiceCard({required this.service, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            service.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 16),
          Text(
            service.days,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${service.price} ₽',
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Добавить',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String name;
  final String days;
  final double price;

  const ServiceItem({required this.name, required this.days, required this.price});
}
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems = const [
    CartItem(name: 'Клинический анализ крови с лейкоцитарной формулировкой', price: 690.0, quantity: 1),
    CartItem(name: 'Общий анализ мочи', price: 350.0, quantity: 2),
  ];

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double totalPrice = _calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Корзина',
          style: AppStyles.appBarTitleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length + 1,
                itemBuilder: (context, index) {
                  if (index < cartItems.length) {
                    return CartItemWidget(cartItem: cartItems[index]);
                  } else {
                    return TotalPriceRow(totalPrice: totalPrice);
                  }
                },
              ),
            ),
            const CheckoutButton(),
          ],
        ),
      ),
    );
  }

  double _calculateTotalPrice() {
    return cartItems.fold(0, (total, item) => total + (item.price * item.quantity));
  }
}

class TotalPriceRow extends StatelessWidget {
  final double totalPrice;

  const TotalPriceRow({required this.totalPrice, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Сумма', style: AppStyles.totalPriceLabelStyle),
          Text('${totalPrice.toStringAsFixed(2)} ₽', style: AppStyles.totalPriceValueStyle),
        ],
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Center(
        child: SizedBox(
          width: 335,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              // Handle checkout action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Перейти к оформлению заказа', style: AppStyles.buttonTextStyle),
          ),
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({required this.cartItem, Key? key}) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  cartItem.name,
                  style: AppStyles.cartItemNameStyle,
                  overflow: TextOverflow.visible,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  // Handle remove item
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${cartItem.price.toStringAsFixed(2)} ₽', style: AppStyles.cartItemPriceStyle),
              QuantityControl(quantity: cartItem.quantity),
            ],
          ),
        ],
      ),
    );
  }
}

class QuantityControl extends StatelessWidget {
  final int quantity;

  const QuantityControl({required this.quantity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${quantity} клиент${quantity > 1 ? 'а' : ''}', style: AppStyles.cartItemQuantityStyle),
        const SizedBox(width: 8),
        Container(
          width: 64,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.remove, size: 15, color: Color(0xFFB8C1CC)),
              Icon(Icons.add, size: 15, color: Color(0xFFB8C1CC)),
            ],
          ),
        ),
      ],
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final int quantity;

  const CartItem({required this.name, required this.price, required this.quantity});
}

class AppStyles {
  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );

  static const TextStyle cartItemNameStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );

  static const TextStyle cartItemPriceStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );

  static const TextStyle cartItemQuantityStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );

  static const TextStyle totalPriceLabelStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );

  static const TextStyle totalPriceValueStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );
}

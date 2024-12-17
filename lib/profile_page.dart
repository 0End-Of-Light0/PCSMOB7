import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Эдуард',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            const Text(
              '+7 900 800-55-33',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF898A8D)),
            ),
            const SizedBox(height: 5),
            const Text(
              'email@gmail.com',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF898A8D)),
            ),
            const SizedBox(height: 26),
            Expanded(
              child: ListView(
                children: [
                  _buildNavButton(context, 'Мои заказы', 'assets/icons/order.png'),
                  _buildNavButton(context, 'Медицинские карты', 'assets/icons/cards.png'),
                  _buildNavButton(context, 'Мои адреса', 'assets/icons/adress.png'),
                  _buildNavButton(context, 'Настройки', 'assets/icons/settings.png'),
                ],
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String title, String iconPath) {
    return _AnimatedButton(
      onTap: () => print('$title нажат'),
      child: Row(
        children: [
          Image.asset(iconPath, width: 32, height: 32),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final List<Map<String, dynamic>> footerButtons = [
      {'title': 'Ответы на вопросы', 'color': const Color(0xFF939396)},
      {'title': 'Политика конфиденциальности', 'color': const Color(0xFF939396)},
      {'title': 'Пользовательское соглашение', 'color': const Color(0xFF939396)},
      {'title': 'Выход', 'color': const Color(0xFFFC3434)},
    ];

    return Column(
      children: footerButtons.map((btn) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Center(
            child: _AnimatedButton(
              onTap: () => print('${btn['title']} нажат'),
              child: Text(
                btn['title'],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: btn['color']),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const _AnimatedButton({required this.child, required this.onTap, Key? key}) : super(key: key);

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _isPressed ? Colors.grey : Colors.transparent),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: widget.child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardProfile extends StatefulWidget {
  const CardProfile(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  CardProfileState createState() => CardProfileState();
}

// ตรวจสอบว่าเมาส์มีการชี้ไปที่ Card หรือไม่
class CardProfileState extends State<CardProfile> {
  bool _isHovered = false;

  void _onEnter(PointerEvent details) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: _isHovered
              ? (Matrix4.identity()..translate(0, -10, 0))
              : Matrix4.identity(),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
            child: ListTile(
              leading: Icon(
                widget.icon,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                widget.text,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

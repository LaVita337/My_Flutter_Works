import 'package:TikTok/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:TikTok/constants/sizes.dart';

class PostVideoButton extends StatefulWidget {
  final Function onTap;

  const PostVideoButton({super.key, required this.onTap});

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 + _controller.value;
    return GestureDetector(
        onTapDown: _tapDown,
        onTapUp: _tapUp,
        child: Transform.scale(
          scale: _scale,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 12,
                child: Container(
                  height: 30,
                  width: 25,
                  decoration: BoxDecoration(
                    color: isDarkMode(context)
                        ? Colors.white
                        : Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(Sizes.size12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
                ),
              ),
              Positioned(
                left: 12,
                child: Container(
                  height: 30,
                  width: 25,
                  decoration: BoxDecoration(
                    color: isDarkMode(context)
                        ? Colors.white
                        : Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(Sizes.size12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
                ),
              ),
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
                decoration: BoxDecoration(
                    color: isDarkMode(context)
                        ? Colors.grey.shade900
                        : Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.plus,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

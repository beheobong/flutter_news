import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged<int> onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;
  final int index;

  const AnimatedToggle({
    Key? key,
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
    required this.index,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  @override
  void initState() {
    super.initState();
    if (widget.index == 1) {
      initialPosition = false;
    }
  }

  bool initialPosition = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 30,
          margin: const EdgeInsets.only(right: 10),
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  initialPosition = !initialPosition;
                  var index = 0;
                  if (!initialPosition) {
                    index = 1;
                  }
                  widget.onToggleCallback(index);
                  setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: ShapeDecoration(
                    color: widget.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      widget.values.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          widget.values[index],
                          style: Styles.copyStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xAA000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.decelerate,
                alignment: initialPosition
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                  width: 50,
                  height: double.infinity,
                  decoration: ShapeDecoration(
                    color: widget.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.1),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    initialPosition ? widget.values[0] : widget.values[1],
                    style: Styles.copyStyle(
                      color: widget.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

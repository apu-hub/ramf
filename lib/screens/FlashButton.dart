import 'package:flutter/material.dart';

import '../services/flashControl.dart';

class FlashButton extends StatefulWidget {
  const FlashButton({Key? key}) : super(key: key);

  @override
  State<FlashButton> createState() => _FlashButtonState();
}

class _FlashButtonState extends State<FlashButton> {
  bool _isElevated = false;

  final myController = TextEditingController();

  @override
  initState() {
    super.initState();
    isTorchAvailable(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.all(100),
          child: Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isElevated = !_isElevated;
                });
                _isElevated ? enableTorch(context) : disableTorch(context);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: 100,
                width: 100,
                child: Icon(
                  Icons.highlight,
                  size: 50,
                  color: Colors.grey.shade500,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: _isElevated
                      ? [
                          BoxShadow(
                            color: Colors.grey[500]!,
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          )
                        ]
                      : null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

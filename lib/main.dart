// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAMF',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlashButton(),
    );
  }
}

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
    _isTorchAvailable(context);
  }

  Future<bool> _isTorchAvailable(BuildContext context) async {
    try {
      return await TorchLight.isTorchAvailable();
    } on Exception catch (_) {
      _showMessage(
        'Could not check if the device has an available torch',
        context,
      );
      rethrow;
    }
  }

  Future<void> _enableTorch(BuildContext context) async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      _showMessage('Could not enable torch', context);
    }
  }

  Future<void> _disableTorch(BuildContext context) async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      _showMessage('Could not disable torch', context);
    }
  }

  void _showMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
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
                _isElevated ? _enableTorch(context) : _disableTorch(context);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
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

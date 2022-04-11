import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

Future<bool> isTorchAvailable(BuildContext context) async {
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

Future<void> enableTorch(BuildContext context) async {
  try {
    await TorchLight.enableTorch();
  } on Exception catch (_) {
    _showMessage('Could not enable torch', context);
  }
}

Future<void> disableTorch(BuildContext context) async {
  try {
    await TorchLight.disableTorch();
  } on Exception catch (_) {
    _showMessage('Could not disable torch', context);
  }
}

void _showMessage(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

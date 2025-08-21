import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LiveDateWidget extends StatefulWidget {
  const LiveDateWidget({super.key});

  @override
  State<LiveDateWidget> createState() => _LiveDateWidgetState();
}

class _LiveDateWidgetState extends State<LiveDateWidget> {
  late String _formattedDate;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateDate();
    // ✅ Har 1 minute baad update hoga
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _updateDate();
    });
  }

  void _updateDate() {
    final now = DateTime.now();
    final formatter = DateFormat("EEEE, MMM d"); // Saturday, Aug 20
    setState(() {
      _formattedDate = formatter.format(now);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedDate,
      style: const TextStyle(color: Colors.white70, fontSize: 14),
    );
  }
}

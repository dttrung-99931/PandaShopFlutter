import 'package:flutter/material.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({
    this.child,
    this.bottomNavigationBar,
    Key? key,
  }) : super(key: key);
  final Widget? child;
  final BottomNavigationBar? bottomNavigationBar;
  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            // const Background(),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                widget.child ?? const Text("Future Improving")
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}

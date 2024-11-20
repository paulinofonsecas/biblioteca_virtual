import 'package:flutter/material.dart';

class DialogoCarregando extends StatelessWidget {
  const DialogoCarregando({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: PopScope(
        canPop: false,
        child: SizedBox(
          width: 300,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

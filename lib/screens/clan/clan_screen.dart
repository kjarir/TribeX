import 'package:flutter/material.dart';

class ClanScreen extends StatelessWidget {
  const ClanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 360;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clan'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.group,
                  size: isSmallScreen ? 48 : 64,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(height: screenSize.height * 0.02),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Clan Features Coming Soon',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: isSmallScreen ? 20 : 24,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.1,
                  ),
                  child: Text(
                    'Join forces with friends and compete together!',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: isSmallScreen ? 14 : 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

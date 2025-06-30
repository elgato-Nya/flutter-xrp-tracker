import 'package:flutter/material.dart';

/// About screen displaying app information and features
class AboutScreen extends StatelessWidget {
  static const String routeName = '/about';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('About'),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF23D3FF).withAlpha((0.1 * 255).toInt()),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF121212),
              const Color(0xFF1A1A1A),
              const Color(0xFF121212),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF23D3FF).withAlpha(25), // 0.1 * 255 ≈ 25
                        const Color(0xFF00B8D4).withAlpha(25), // 0.1 * 255 ≈ 25
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF23D3FF).withAlpha(76), // 0.3 * 255 ≈ 76
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF23D3FF),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF23D3FF).withAlpha(128), // 0.5 * 255 ≈ 128
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'X',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'XRP Crypto Tracker',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: const Color(0xFF23D3FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Real-time cryptocurrency monitoring',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 48),
                
                // Features section
                _buildInfoCard(
                  context,
                  icon: Icons.speed,
                  title: 'Real-time Data',
                  description: 'Get live XRP prices in Malaysian Ringgit (MYR) with instant updates and accurate market data.',
                  iconColor: const Color(0xFF23D3FF),
                ),
                                
                const SizedBox(height: 16),
                
                _buildInfoCard(
                  context,
                  icon: Icons.trending_up,
                  title: 'Market Insights',
                  description: 'Track XRP performance with clean, modern interface designed for crypto enthusiasts.',
                  iconColor: const Color(0xFF23D3FF),
                ),
                
                const SizedBox(height: 48),
                
                // Developer info
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF23D3FF).withAlpha(51), // 0.2 * 255 ≈ 51
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF23D3FF).withAlpha(25), // 0.1 * 255 ≈ 25
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.code,
                              color: const Color(0xFF23D3FF),
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'About the Developer',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: 18,
                              color: const Color(0xFF23D3FF),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Mohamad Afiq bin Mohamad Sharifuzan',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '2023197751',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Version 1.0.0 (June 2025)',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a feature information card with icon, title and description
  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: iconColor.withAlpha(51), // 0.2 * 255 ≈ 51
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withAlpha(25), // 0.1 * 255 ≈ 25
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

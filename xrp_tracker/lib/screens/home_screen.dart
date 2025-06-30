import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/xrp_rate.dart';
import '../widgets/rate_display.dart';
import 'about_screen.dart';

/// Main screen displaying real-time XRP price with refresh functionality
class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<XrpRate> _futureRate;

  @override
  void initState() {
    super.initState();
    _loadRate();
  }

  /// Initiates API call to fetch current XRP rate
  void _loadRate() {
    setState(() {
      _futureRate = ApiService().fetchXrpRate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF23D3FF),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF23D3FF).withAlpha(76), // 0.3 * 255 ≈ 76
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'X',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text('XRP Tracker'),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF23D3FF).withAlpha(25), // 0.1 * 255 ≈ 25
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                Navigator.pushNamed(context, AboutScreen.routeName);
              },
            ),
          ),
        ],
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Header section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E).withAlpha(204), // 0.8 * 255 ≈ 204
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF23D3FF).withAlpha(51), // 0.2 * 255 ≈ 51
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF23D3FF).withAlpha(25), // 0.1 * 255 ≈ 25
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.trending_up,
                          color: const Color(0xFF23D3FF),
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Live Price',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Real-time XRP value in MYR',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Main content
                Expanded(
                  child: FutureBuilder<XrpRate>(
                    future: _futureRate,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF23D3FF).withAlpha(25), // 0.1 * 255 ≈ 25
                                  shape: BoxShape.circle,
                                ),
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF23D3FF),
                                  ),
                                  strokeWidth: 3,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Fetching latest price...',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.red.withAlpha(25), // 0.1 * 255 ≈ 25
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.red.withAlpha(76), // 0.3 * 255 ≈ 76
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 48,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Failed to fetch price',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${snapshot.error}',
                                  style: TextStyle(color: Colors.red.shade300),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton.icon(
                                  onPressed: _loadRate,
                                  icon: const Icon(Icons.refresh),
                                  label: const Text('Retry'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        final rate = snapshot.data!;
                        return Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: RateDisplay(rate: rate.value),
                              ),
                            ),
                            
                            // Action buttons
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1E1E1E),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: const Color(0xFF23D3FF).withAlpha(51), // 0.2 * 255 ≈ 51
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Last Updated',
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          '${rate.fetchedAt.hour.toString().padLeft(2, '0')}:${rate.fetchedAt.minute.toString().padLeft(2, '0')}',
                                          style: TextStyle(
                                            color: const Color(0xFF23D3FF),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF23D3FF).withAlpha(25), // 0.1 * 255 ≈ 25
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.refresh),
                                    iconSize: 32,
                                    onPressed: _loadRate,
                                    tooltip: 'Refresh price',
                                    color: const Color(0xFF23D3FF),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: Text(
                            'No data available',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        );
                      }
                    },
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

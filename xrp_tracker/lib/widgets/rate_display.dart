import 'package:flutter/material.dart';

/// Animated widget displaying XRP price with live indicator and pulsing effects
class RateDisplay extends StatefulWidget {
  /// XRP rate value to display
  final double rate;

  const RateDisplay({Key? key, required this.rate}) : super(key: key);

  @override
  State<RateDisplay> createState() => _RateDisplayState();
}

class _RateDisplayState extends State<RateDisplay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    // Setup pulsing animation for live indicator
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Container(
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
              color: Color.lerp(
                const Color(0xFF23D3FF).withAlpha(76), // 0.3 * 255 ≈ 76
                const Color(0xFF23D3FF).withAlpha(204), // 0.8 * 255 ≈ 204
                _pulseAnimation.value,
              )!,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF23D3FF).withAlpha((76 * _pulseAnimation.value).round()), // 0.3 * 255 ≈ 76
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: const Color(0xFF23D3FF),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF23D3FF).withAlpha(153), // 0.6 * 255 ≈ 153
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'LIVE',
                    style: TextStyle(
                      color: const Color(0xFF23D3FF),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'RM ${widget.rate.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -1,
                  shadows: [
                    Shadow(
                      color: const Color(0xFF23D3FF).withAlpha(128), // 0.5 * 255 ≈ 128
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'XRP / MYR',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

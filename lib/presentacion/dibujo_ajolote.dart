import 'package:flutter/material.dart';

class DibujoAjolote extends StatelessWidget {
  const DibujoAjolote({super.key, required this.hambre});
  final int hambre;
  @override
  Widget build(BuildContext context) {
    final triste = hambre >= 60;
    return Semantics(
      label: 'Ajolotito ${triste ? 'hambriento' : 'feliz'}',
      child: SizedBox(
        width: 240,
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(left: 20, child: _branquia()),
            Positioned(
              right: 20,
              child: Transform.flip(flipX: true, child: _branquia()),
            ),
            Container(
              width: 160,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xffff9fc9),
                borderRadius: BorderRadius.circular(70),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x339c3f6e),
                    blurRadius: 18,
                    offset: Offset(0, 9),
                  ),
                ],
              ),
            ),
            Positioned(top: 66, left: 78, child: _ojo()),
            Positioned(top: 66, right: 78, child: _ojo()),
            Positioned(
              top: 112,
              child: Icon(
                triste
                    ? Icons.sentiment_dissatisfied_rounded
                    : Icons.sentiment_very_satisfied_rounded,
                size: 42,
                color: const Color(0xff793754),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ojo() => Container(
    width: 15,
    height: 20,
    decoration: const BoxDecoration(
      color: Color(0xff4b2436),
      shape: BoxShape.circle,
    ),
  );
  Widget _branquia() => Column(
    children: List.generate(
      3,
      (i) => Container(
        width: 60,
        height: 15,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Color.lerp(
            const Color(0xffff73aa),
            const Color(0xffca477e),
            i / 3,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}

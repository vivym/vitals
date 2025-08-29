import 'package:flutter/material.dart';

// 自定义数字键盘
class CustomNumericKeypad extends StatelessWidget {
  const CustomNumericKeypad({
    super.key,
    required this.onNumberPressed,
    required this.onBackspace,
    required this.onNext,
  });

  final ValueChanged<int> onNumberPressed;
  final VoidCallback onBackspace;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 第一行：1, 2, 3, 退格
        Row(
          children: [
            Expanded(child: _NumberButton(1, onNumberPressed)),
            const SizedBox(width: 8),
            Expanded(child: _NumberButton(2, onNumberPressed)),
            const SizedBox(width: 8),
            Expanded(child: _NumberButton(3, onNumberPressed)),
            const SizedBox(width: 8),
            Expanded(child: _BackspaceButton(onBackspace)),
          ],
        ),

        const SizedBox(height: 8),

        // 第二行：4, 5, 6
        Row(
          children: [
            Expanded(child: _NumberButton(4, onNumberPressed)),
            const SizedBox(width: 8),
            Expanded(child: _NumberButton(5, onNumberPressed)),
            const SizedBox(width: 8),
            Expanded(child: _NumberButton(6, onNumberPressed)),
            const SizedBox(width: 8),
            const Expanded(child: SizedBox()), // 占位
          ],
        ),

        const SizedBox(height: 8),

        // 第三行：7, 8, 9, 下一个
        Row(
          children: [
            Expanded(child: _NumberButton(7, onNumberPressed)),
            const SizedBox(width: 8),
            Expanded(child: _NumberButton(8, onNumberPressed)),
            const SizedBox(width: 8),
            Expanded(child: _NumberButton(9, onNumberPressed)),
            const SizedBox(width: 8),
            Expanded(child: _NextButton(onNext)),
          ],
        ),

        const SizedBox(height: 8),

        // 第四行：0, 小数点
        Row(
          children: [
            Expanded(child: _NumberButton(0, onNumberPressed)),
            const SizedBox(width: 8),
            Expanded(child: _DecimalButton()),
            const SizedBox(width: 8),
            const Expanded(child: SizedBox()), // 占位
            const SizedBox(width: 8),
            const Expanded(child: SizedBox()), // 占位
          ],
        ),
      ],
    );
  }
}

// 数字按钮
class _NumberButton extends StatelessWidget {
  const _NumberButton(this.number, this.onPressed);

  final int number;
  final ValueChanged<int> onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () => onPressed(number),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          number.toString(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// 退格按钮
class _BackspaceButton extends StatelessWidget {
  const _BackspaceButton(this.onPressed);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Icon(Icons.backspace, size: 20),
      ),
    );
  }
}

// 下一个按钮
class _NextButton extends StatelessWidget {
  const _NextButton(this.onPressed);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          '下一个',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// 小数点按钮
class _DecimalButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          // 处理小数点输入
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          '.',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';

/// ATOMS

class AppGap extends StatelessWidget {
  final double h, w;
  const AppGap.h(this.h, {super.key}) : w = 0;
  const AppGap.w(this.w, {super.key}) : h = 0;
  @override
  Widget build(BuildContext context) => SizedBox(height: h, width: w);
}

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  const AppIcon(this.icon, {super.key, this.size = 20, this.color});
  @override
  Widget build(BuildContext context) => Icon(
    icon,
    size: size,
    color: color ?? const Color.fromARGB(255, 186, 242, 225),
  );
}

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? align;
  final int? maxLines;
  const AppText(this.text, {super.key, this.style, this.align, this.maxLines});
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: style ?? Theme.of(context).textTheme.bodyMedium,
    textAlign: align,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
  );
}

class AppBadge extends StatelessWidget {
  final String label;
  final Color color;
  const AppBadge(
    this.label, {
    super.key,
    this.color = const Color.fromARGB(255, 178, 242, 211),
  });
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withOpacity(.12),
      borderRadius: BorderRadius.circular(999),
      border: Border.all(color: color.withOpacity(.3)),
    ),
    child: Text(
      label,
      style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12),
    ),
  );
}

class AppShimmer extends StatefulWidget {
  final double height;
  final double width;
  final BorderRadiusGeometry radius;
  const AppShimmer({
    super.key,
    this.height = 16,
    this.width = double.infinity,
    this.radius = const BorderRadius.all(Radius.circular(8)),
  });
  @override
  State<AppShimmer> createState() => _AppShimmerState();
}

class _AppShimmerState extends State<AppShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ac = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ac,
      builder: (_, __) {
        return Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: widget.radius,
            gradient: LinearGradient(
              begin: Alignment(-1 + _ac.value * 2, 0),
              end: Alignment(1 + _ac.value * 2, 0),
              colors: const [
                Color(0xFFEFF1F5),
                Color(0xFFDDE1EA),
                Color(0xFFEFF1F5),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }
}

/// MOLECULES

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final bool outline;
  final IconData? leading;
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.outline = false,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          Icon(leading, size: 18),
          const SizedBox(width: 8),
        ],
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );

    final btn = outline
        ? OutlinedButton(onPressed: loading ? null : onPressed, child: child)
        : FilledButton(onPressed: loading ? null : onPressed, child: child);

    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(opacity: loading ? 0.0 : 1.0, child: btn),
        if (loading)
          const SizedBox(
            height: 40,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          ),
      ],
    );
  }
}

class AppTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboard;
  final bool obscure;
  final Widget? prefix;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const AppTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.keyboard = TextInputType.text,
    this.obscure = false,
    this.prefix,
    this.suffix,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1418273A),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
    return onTap == null
        ? card
        : InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: card,
          );
  }
}

class AppListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData leading;
  final VoidCallback? onTap;
  final Widget? trailing;
  const AppListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.leading,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(
              255,
              176,
              247,
              220,
            ).withOpacity(.12),
            child: Icon(
              leading,
              color: const Color.fromARGB(255, 185, 247, 199),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ],
            ),
          ),
          trailing ?? const Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }
}

/// ORGANISMS / SERVICES

class AppDialog {
  static Future<T?> show<T>({
    required String title,
    required String message,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool showCancel = true,
  }) {
    return Get.dialog<T>(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          if (showCancel)
            TextButton(onPressed: () => Get.back<T>(), child: Text(cancelText)),
          FilledButton(
            onPressed: () => Get.back<T>(result: true as T?),
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }
}

class AppSnack {
  static void success(String msg) =>
      Get.snackbar('Success', msg, snackPosition: SnackPosition.BOTTOM);
  static void error(String msg) => Get.snackbar(
    'Error',
    msg,
    backgroundColor: Colors.red.shade50,
    colorText: Colors.red.shade700,
    snackPosition: SnackPosition.BOTTOM,
  );
}

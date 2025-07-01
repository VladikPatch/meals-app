import 'package:flutter/material.dart';

class FilterTile extends StatelessWidget {
  const FilterTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.activeValue,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool activeValue;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SwitchListTile(
      value: activeValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: theme.textTheme.titleLarge!.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.labelLarge!.copyWith(
          color: theme.colorScheme.onSurface,
          fontSize: 18,
        ),
      ),
      activeColor: theme.colorScheme.tertiary,
    );
  }
}

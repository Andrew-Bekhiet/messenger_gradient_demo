import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String? subtitle;
  final String imageUrl;

  const UserInfo({
    super.key,
    required this.name,
    this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primary,
        foregroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name),
      subtitle: subtitle != null ? Text(subtitle!) : null,
    );
  }
}

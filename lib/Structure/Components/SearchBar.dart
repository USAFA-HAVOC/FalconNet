import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String) onChanged;
  final String label;

  const SearchBar({super.key, required this.onChanged, this.label = "Search"});

  @override
  Widget build(BuildContext context) => TextField(
    decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(10)),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        labelText: label,
        suffixIcon: const Icon(Icons.search)
    ),
    onChanged: onChanged,
  );
}
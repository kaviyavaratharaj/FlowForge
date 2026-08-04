import 'package:flutter/material.dart';

import 'app_text_field.dart';

class SearchField extends StatefulWidget {
    const SearchField({super.key,
  this.controller,
    this.hint,
    this.onChanged,
  });

    final TextEditingController? controller;
    final String? hint;
    final ValueChanged<String>? onChanged;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();

    _controller.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
        return AppTextField(
      controller: _controller,
      hint: widget.hint ?? "Search...",
      prefixIcon: Icons.search,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      onChanged: widget.onChanged,
      suffixIcon: _controller != null &&
          (_controller?.text.isNotEmpty ?? false)
      ? IconButton(
        icon: const Icon(Icons.close_outlined),
        onPressed: () {
          _controller?.clear();
          widget.onChanged?.call('');
        },
      )
        : null,
    );
  }
}


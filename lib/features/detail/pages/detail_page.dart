import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/movie/movie.dart';
import '../../../../theme/theme.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: Text(
          movie.title,
          style: AppTextStyles.bold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                if (movie.poster != null) ...[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: CachedNetworkImage(
                      imageUrl: AppImages.instance.networkImagesPath + movie.poster!,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
                Text(movie.overview),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

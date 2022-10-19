import 'package:cached_network_image/cached_network_image.dart';
import 'package:falconnet/router/router_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../models/movie/movie.dart';
import '../../../theme/src/app_colors.dart';
import '../../../theme/src/app_images.dart';
import '../../../theme/src/app_text_styles.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    required this.movie,
    Key? key,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushDetailPage(movie),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: movie.poster != null
                  ? CachedNetworkImage(
                      imageUrl: AppImages.instance.networkImagesPath + movie.poster!,
                      placeholder: ((context, url) => Shimmer.fromColors(
                            baseColor: AppColors.lightGray,
                            highlightColor: AppColors.darkerGray,
                            child: Container(
                              color: AppColors.white,
                            ),
                          )),
                    )
                  : const Center(child: Text('No Poster')),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            movie.title,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.p1,
          ),
        ],
      ),
    );
  }
}

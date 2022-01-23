import 'package:flutter/material.dart';
import 'package:functional_error_handling/core/presentation/text_styles.dart';
import 'package:functional_error_handling/features/post/domain/entities/post_entity.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 26,
                  child: Text(
                    post.userId.toString(),
                    style: TextStyles.userId,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.title.replaceAll("\n", " "),
                          style: TextStyles.postTitle),
                      Text('Post id: ${post.id}', style: TextStyles.id),
                      Text(post.body.replaceAll("\n", " ")),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}

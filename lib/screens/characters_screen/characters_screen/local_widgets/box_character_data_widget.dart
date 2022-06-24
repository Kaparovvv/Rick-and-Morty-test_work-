import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_test_app/commons/text_styles_helper.dart';
import 'package:rick_and_morty_test_app/screens/global_widgets/character_isalive_widget.dart';
import 'package:rick_and_morty_test_app/screens/global_widgets/circle_cashed_network_image_widget.dart';

class BoxCharacterDataWidget extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? isAlive;
  final String? species;
  final String? gender;
  final Function() function;

  const BoxCharacterDataWidget({
    Key? key,
     required this.function(),
     this.imageUrl,
     this.name,
     this.isAlive,
     this.species,
     this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: SizedBox(
        width: 343.w,
        height: 74.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleCachedNetworkImageWidget(
              imageUrl: imageUrl,
              width: 74.w,
              height: 74.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.w),
              child: SizedBox(
                width: 251.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CharacterAliveOrDead(
                      alive: isAlive!,
                    ),
                    Text(
                      name!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStylesHelper.nameCharacter,
                    ),
                    Text(
                      '$species, $gender',
                      style: TextStylesHelper.genderStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

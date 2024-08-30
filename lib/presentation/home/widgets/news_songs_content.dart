import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_flutter_bloc/common/helpers/is_dark_mode.dart';
import 'package:spotify_flutter_bloc/core/configs/constants/app_urls.dart';
import 'package:spotify_flutter_bloc/core/configs/theme/app_colors.dart';
import 'package:spotify_flutter_bloc/domain/entities/song/song.dart';
import 'package:spotify_flutter_bloc/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify_flutter_bloc/presentation/home/bloc/news_songs_state.dart';

class NewsSongsContent extends StatelessWidget {
  const NewsSongsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }

            if (state is NewsSongsLoaded) {
              return _songs(state.songs);
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          ///'${AppURLs.firestorage}${songs[index].artist}-${songs[index].title}.jpg?${AppURLs.mediaAlt}',
                          '${AppURLs.firestorage}${songs[index].artist} - ${songs[index].title}.jpg?${AppURLs.mediaAlt}',
                        ///https://firebasestorage.googleapis.com/v0/b/spotify-flutter-bloc.appspot.com/o/covers%2FDamage-%20Emotional%20Piano.jpg?alt=media&token=53057e12-2e35-442a-bd1c-0b8f9cbbef13
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      transform: Matrix4.translationValues(10, 10, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        ///color: AppColors.darkGrey,
                        color: context.isDarkMode
                            ? AppColors.darkGrey
                            : const Color(0xffE6E6E6),
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode
                            ? const Color(0xff959595)
                            : const Color(0xff555555),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                songs[index].title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                songs[index].artist,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 14,
      ),
      itemCount: songs.length,
    );
  }
}

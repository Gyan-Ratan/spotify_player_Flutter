import '../models/music.dart';

class MusicOperations {
  MusicOperations._() {}
  static List<Music> getMusic() {
    return <Music>[
      Music(
          "Mozart",
          "https://c-cl.cdn.smule.com/rs-s78/arr/ad/95/6e3062ea-19a3-4dbb-a247-f53a1b490584.jpg",
          "Best Healing Piano"),
      Music(
          "SPD",
          "https://c-cl.cdn.smule.com/rs-s78/arr/ad/95/6e3062ea-19a3-4dbb-a247-f53a1b490584.jpg",
          "Best Healing Piano"),
      Music(
          "SPD",
          "https://c-cl.cdn.smule.com/rs-s78/arr/ad/95/6e3062ea-19a3-4dbb-a247-f53a1b490584.jpg",
          "Best Healing Piano"),
    ];
  }
}

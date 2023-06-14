import '../models/music.dart';

class MusicOperations {
  MusicOperations._() {}
  static List<Music> getMusic() {
    return <Music>[
      Music(
          "Annihilate",
          "https://is5-ssl.mzstatic.com/image/thumb/Music116/v4/c9/ca/6b/c9ca6b51-87a9-4a13-d37f-24535687023d/23UMGIM63882.rgb.jpg/100x100bb.jpg",
          "Metro Boomin,",
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/5f/55/99/5f559978-d283-b719-5b6f-a447213e06cd/mzaf_2285222827793641114.plus.aac.p.m4a"),
      Music(
          "Ed Sheeran",
          "https://is2-ssl.mzstatic.com/image/thumb/Music125/v4/c5/d8/c6/c5d8c675-63e3-6632-33db-2401eabe574d/190296491412.jpg/100x100bb.jpg",
          "Shivers",
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/b7/5d/69/b75d69a5-ab31-ca1a-62aa-3985abaaa59c/mzaf_16578619813671696376.plus.aac.p.m4a"),
      Music(
          "Apna Time Aayega",
          "https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/de/3d/61/de3d61a9-1296-6a0f-6482-32723729d4b6/8718857674948.png/100x100bb.jpg",
          "Ranveer Singh",
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/0e/d5/52/0ed55222-e6ae-1e7f-24c1-284da449af4e/mzaf_169448091425248968.plus.aac.p.m4a"),
    ];
  }
}

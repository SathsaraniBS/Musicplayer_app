import 'package:flutter/material.dart';
import 'package:musical_instrument_app/models/song.dart';
import 'package:audioplayers/audioplayers.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [
    //song 1
    Song(
      songName: 'Believer',
      artistName: 'Imagine Dragons',
      albumArtImagePath: 'assets/img/m1.webp',
      audioPath: 'assets/songs/Perfect-(Mr-Jat.in).mp3',
    ),

    //song 2
    Song(
      songName: 'Prefect',
      artistName: 'Ed Sheeran',
      albumArtImagePath: 'assets/img/m2.webp',
      audioPath: 'assets/songs/Perfect-(Mr-Jat.in).mp3',
    ),

    //song 3
    Song(
      songName: 'Senorita',
      artistName: 'Shawan mendes',
      albumArtImagePath: 'assets/img/m4.jpg',
      audioPath: 'assets/songs/Perfect-(Mr-Jat.in).mp3',
    ),

    //song 4
    Song(
      songName: 'Night Changes',
      artistName: 'One Derections',
      albumArtImagePath: 'assets/img/m5.jpg',
      audioPath: 'assets/songs/Perfect-(Mr-Jat.in).mp3',
    ),

    //song 5
    Song(
      songName: 'Bad Liar',
      artistName: 'Eminem',
      albumArtImagePath: 'assets/img/m6.jpg',
      audioPath: 'assets/songs/Perfect-(Mr-Jat.in).mp3',
    ),
  ];

  //current song index
  int? _currentSongIndex;

  /* A U D I O P L A Y E R  */

  /*audio player  */
  final AudioPlayer _audioPlayer = AudioPlayer();

  //durations
  Duration _currentDuration = Duration(seconds: 0);
  Duration _totalDuration = Duration(seconds: 480);

  //constructor
  PlaylistProvider() {
    listenToDuration();
  }
  

  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); //stop current song
    await _audioPlayer.play(AssetSource(path)); //play new song
    _isPlaying = true;
    notifyListeners();
  }

  //pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async {
    
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position in the current song
  void seek(Duration position) async{
    await _audioPlayer.seek(position);
     _currentDuration = position; // update local state
     notifyListeners();
  }


  //play next song
  void playNextSong()  {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1){
        //go to the next song if it's not the last song
        currentSongIndex = _currentSongIndex! + 1;

      }else {
        //if it's the last song, loop back to the first song
        currentSongIndex = 0;
      }
    }
      
  }

  //play previous song
  void playPreviousSong() async{
    //if more than 2 seconds have passed ,restart the current song
    if (_currentDuration.inSeconds > 2) {
        
        seek(Duration.zero);
    }

    //if it's within first  2 second of the song, go to the previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      }else {
        //if it's the first song, loop back to the last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration() {

    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration){
      _totalDuration =newDuration;
      notifyListeners();
    }
    );

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition){
      _currentDuration =newPosition;
      notifyListeners();
    }
    );

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });


  }
  

  //dispose audio player


  

  /*getters  */

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;


  /*setters  */

  set currentSongIndex(int? newIndex) {

    //update current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play();  // play the song at the new index
    }

    //update ui
    notifyListeners();
  }
}

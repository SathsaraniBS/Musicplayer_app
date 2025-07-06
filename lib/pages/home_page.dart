import 'package:flutter/material.dart';
import 'package:musical_instrument_app/components/my_drawer.dart';
import 'package:provider/provider.dart';
import 'package:musical_instrument_app/models/playlist_provider.dart';
import 'package:musical_instrument_app/models/song.dart';
import 'package:musical_instrument_app/pages/song_page.dart';
import 'package:audioplayers/audioplayers.dart';
class HomePage extends StatefulWidget {
  final AudioPlayer audioPlayer; // Define the audioPlayer parameter

    const HomePage({super.key, required this.audioPlayer});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get the playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  //go to a song
  void goToSong(int songIndex) {

    //update current song index
    playlistProvider.currentSongIndex = songIndex;

    Navigator.push(context,
    MaterialPageRoute(builder: (context) => SongPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text("P L A Y L I S T"),
      backgroundColor: Theme.of(context).colorScheme.primary,),

      drawer: const MyDrawer(),

      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          //get playlist
          final List<Song> playlist = value.playlist;

          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              //get individual song
              final Song song = playlist[index];

              //return list view ui
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumArtImagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}

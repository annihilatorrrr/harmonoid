/* 
 *  This file is part of Harmonoid (https://github.com/harmonoid/harmonoid).
 *  
 *  Harmonoid is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *  
 *  Harmonoid is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *  
 *  You should have received a copy of the GNU General Public License
 *  along with Harmonoid. If not, see <https://www.gnu.org/licenses/>.
 * 
 *  Copyright 2020-2022, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
 */

import 'package:flutter/material.dart';
import 'package:harmonoid/utils/rendering.dart';
import 'package:provider/provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import 'package:harmonoid/core/collection.dart';
import 'package:harmonoid/utils/widgets.dart';
import 'package:harmonoid/core/hotkeys.dart';
import 'package:harmonoid/utils/dimensions.dart';
import 'package:harmonoid/constants/language.dart';
import 'package:harmonoid/interface/collection/album.dart';
import 'package:harmonoid/interface/collection/track.dart';
import 'package:harmonoid/interface/collection/artist.dart';

class SearchTab extends StatefulWidget {
  final ValueNotifier<String>? query;
  SearchTab({Key? key, this.query}) : super(key: key);
  SearchTabState createState() => SearchTabState();
}

class SearchTabState extends State<SearchTab> {
  TextEditingController controller = new TextEditingController();
  List<Widget> albums = <Widget>[];
  List<Widget> tracks = <Widget>[];
  List<Widget> artists = <Widget>[];
  int index = 0;
  late Future<void> Function() listener;

  @override
  void initState() {
    super.initState();
    if (widget.query != null) {
      this.listener = () async {
        this.albums = <Widget>[];
        this.tracks = <Widget>[];
        this.artists = <Widget>[];
        var result = collection.search(widget.query!.value);
        for (var media in result) {
          if (media is Album) {
            this.albums.addAll(
              [
                AlbumTile(
                  height: kAlbumTileHeight,
                  width: kAlbumTileWidth,
                  album: media,
                ),
                const SizedBox(
                  width: 16.0,
                ),
              ],
            );
          }
          if (media is Artist) {
            this.artists.addAll(
              [
                ArtistTile(
                  height: kDesktopArtistTileHeight,
                  width: kDesktopArtistTileWidth,
                  artist: media,
                ),
                const SizedBox(
                  width: 16.0,
                ),
              ],
            );
          } else if (media is Track) {
            this.tracks.add(
                  TrackTile(
                    track: media,
                    index: collection.tracks.indexOf(media),
                  ),
                );
          }
        }
      };
      widget.query!.addListener(this.listener);
      listener();
    }
  }

  @override
  void dispose() {
    widget.query!.removeListener(this.listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Collection>(
      builder: (context, collection, _) {
        listener();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              if (widget.query == null)
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Container(
                          width: 56.0,
                          child: Icon(
                            FluentIcons.search_24_regular,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Focus(
                          onFocusChange: (hasFocus) {
                            if (hasFocus) {
                              HotKeys.disableSpaceHotKey();
                            } else {
                              HotKeys.enableSpaceHotKey();
                            }
                          },
                          child: TextField(
                            controller: controller,
                            onChanged: (String query) async {
                              int _index = index;
                              index++;
                              List<dynamic> result = collection.search(query);
                              List<Widget> albums = <Widget>[];
                              List<Widget> tracks = <Widget>[];
                              List<Widget> artists = <Widget>[];
                              for (dynamic media in result) {
                                if (media is Album) {
                                  albums.addAll(
                                    [
                                      AlbumTile(
                                        height: kAlbumTileHeight,
                                        width: kAlbumTileWidth,
                                        album: media,
                                      ),
                                      const SizedBox(
                                        width: 16.0,
                                      ),
                                    ],
                                  );
                                }
                                if (media is Artist) {
                                  artists.addAll(
                                    [
                                      ArtistTile(
                                        height: kDesktopArtistTileHeight,
                                        width: kDesktopArtistTileWidth,
                                        artist: media,
                                      ),
                                      const SizedBox(
                                        width: 16.0,
                                      ),
                                    ],
                                  );
                                } else if (media is Track) {
                                  tracks.add(
                                    TrackTile(
                                      track: media,
                                      index: collection.tracks.indexOf(media),
                                    ),
                                  );
                                }
                              }
                              if (_index == index - 1) {
                                this.albums = albums;
                                this.artists = artists;
                                this.tracks = tracks;
                                setState(() {});
                              }
                            },
                            style: Theme.of(context).textTheme.headline4,
                            cursorWidth: 1.0,
                            decoration: InputDecoration(
                              hintText: language.COLLECTION_SEARCH_LABEL,
                              hintStyle: Theme.of(context).textTheme.headline3,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).dividerColor,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24.0,
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: this.albums.isNotEmpty ||
                        this.artists.isNotEmpty ||
                        this.tracks.isNotEmpty
                    ? CustomListView(
                        children: <Widget>[
                              if (this.albums.isNotEmpty)
                                Row(
                                  children: [
                                    SubHeader(language.ALBUM),
                                    const Spacer(),
                                    ShowAllButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => Scaffold(
                                              body: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: kDesktopTitleBarHeight +
                                                              kDesktopAppBarHeight),
                                                      child: CustomListView(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: tileMargin,
                                                        ),
                                                        children:
                                                            tileGridListWidgets(
                                                          context: context,
                                                          tileHeight:
                                                              kAlbumTileHeight,
                                                          tileWidth:
                                                              kAlbumTileWidth,
                                                          elementsPerRow: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  tileMargin) ~/
                                                              (kAlbumTileWidth +
                                                                  tileMargin),
                                                          subHeader: null,
                                                          leadingSubHeader:
                                                              null,
                                                          widgetCount: this
                                                                  .albums
                                                                  .length ~/
                                                              2,
                                                          leadingWidget:
                                                              Container(),
                                                          builder: (BuildContext
                                                                      context,
                                                                  int index) =>
                                                              this.albums[
                                                                  2 * index],
                                                        ),
                                                      ),
                                                    ),
                                                    DesktopAppBar(
                                                      title: language.ALBUM,
                                                      elevation: 4.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                  ],
                                ),
                              if (this.albums.isNotEmpty)
                                Container(
                                  height: kAlbumTileHeight + 10.0,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView(
                                    padding: EdgeInsets.only(
                                      left: 16.0,
                                      top: 2.0,
                                      bottom: 8.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: this.albums,
                                  ),
                                ),
                              if (this.artists.isNotEmpty)
                                Row(
                                  children: [
                                    SubHeader(language.ARTIST),
                                    const Spacer(),
                                    ShowAllButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => Scaffold(
                                              body: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: kDesktopTitleBarHeight +
                                                              kDesktopAppBarHeight),
                                                      child: CustomListView(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: tileMargin,
                                                        ),
                                                        children:
                                                            tileGridListWidgets(
                                                          context: context,
                                                          tileHeight:
                                                              kDesktopArtistTileHeight,
                                                          tileWidth:
                                                              kDesktopArtistTileWidth,
                                                          elementsPerRow: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  tileMargin) ~/
                                                              (kDesktopArtistTileWidth +
                                                                  tileMargin),
                                                          subHeader: null,
                                                          leadingSubHeader:
                                                              null,
                                                          widgetCount: this
                                                                  .artists
                                                                  .length ~/
                                                              2,
                                                          leadingWidget:
                                                              Container(),
                                                          builder: (BuildContext
                                                                      context,
                                                                  int index) =>
                                                              this.artists[
                                                                  2 * index],
                                                        ),
                                                      ),
                                                    ),
                                                    DesktopAppBar(
                                                      title: language.ARTIST,
                                                      elevation: 4.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                  ],
                                ),
                              if (this.artists.isNotEmpty)
                                Container(
                                  height: kDesktopArtistTileHeight + 10.0,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView(
                                    padding: EdgeInsets.only(
                                      left: 16.0,
                                      top: 2.0,
                                      bottom: 8.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: this.artists,
                                  ),
                                ),
                              if (this.tracks.isNotEmpty)
                                Row(
                                  children: [
                                    SubHeader(language.TRACK),
                                    const Spacer(),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                  ],
                                ),
                            ] +
                            this.tracks,
                      )
                    : (controller.text.isNotEmpty ||
                            (widget.query?.value.isNotEmpty ?? false)
                        ? Center(
                            child: ExceptionWidget(
                              title:
                                  language.COLLECTION_SEARCH_NO_RESULTS_TITLE,
                              subtitle: language
                                  .COLLECTION_SEARCH_NO_RESULTS_SUBTITLE,
                            ),
                          )
                        : Center(
                            child: Icon(
                              FluentIcons.search_20_regular,
                              size: 72.0,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          )),
              ),
            ],
          ),
        );
      },
    );
  }
}

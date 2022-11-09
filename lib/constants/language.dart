// ignore_for_file: non_constant_identifier_names
// AUTO GENERATED FILE, DO NOT EDIT.

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'package:harmonoid/constants/strings.dart';

/// [LanguageData] model to represent a language, which will be displayed in the UI.
///
/// See: https://github.com/harmonoid/translations.git
///
/// The mentioned repository is kept as a submodule to the Harmonoid repository.
///
class LanguageData {
  /// Language & country code. e.g. `en-US`.
  /// This should match the name of the file.
  final String code;

  /// Language name. e.g. `English (United States)`.
  /// Must be in the same language.
  final String name;

  /// Name of the country. e.g. `United States`.
  /// Must be in the same language.
  final String country;

  const LanguageData({
    required this.code,
    required this.name,
    required this.country,
  });

  factory LanguageData.fromJson(dynamic json) => LanguageData(
        code: json['code'],
        name: json['name'],
        country: json['country'],
      );

  Map<String, String> toJson() => {
        'code': code,
        'name': name,
        'country': country,
      };

  @override
  int get hashCode => code.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is LanguageData) {
      return code == other.code;
    }
    return false;
  }
}

/// Provides the [String] labels localized for the [current] language to show inside the UI.
class Language extends Strings with ChangeNotifier {
  /// [Language] object singleton instance.
  static final Language instance = Language();

  /// Must be called before [runApp].
  static Future<void> initialize({
    required LanguageData language,
  }) =>
      instance.set(value: language);

  /// Returns all the available languages after reading the assets.
  Future<Set<LanguageData>> get available async {
    final data = await rootBundle.loadString('assets/translations/index.json');
    return Set.from(json.decode(data).map((e) => LanguageData.fromJson(e)));
  }

  /// Updates the [current] language & notifies the listeners.
  Future<void> set({
    required LanguageData value,
  }) async {
    final data = await rootBundle.loadString(
      'assets/translations/translations/${value.code}.json',
      cache: true,
    );
    final map = json.decode(data);
    ABOUT_TITLE = map['ABOUT_TITLE']!;
    ADD = map['ADD']!;
    ADD_NEW_FOLDER = map['ADD_NEW_FOLDER']!;
    ADD_NEW_FOLDER_SUBTITLE = map['ADD_NEW_FOLDER_SUBTITLE']!;
    ADD_THIS_FOLDER = map['ADD_THIS_FOLDER']!;
    ADD_TO_NOW_PLAYING = map['ADD_TO_NOW_PLAYING']!;
    ADD_TO_PLAYLIST = map['ADD_TO_PLAYLIST']!;
    ALBUM = map['ALBUM']!;
    ALBUMS_FROM_ARTIST = map['ALBUMS_FROM_ARTIST']!;
    ALBUM_ARTIST = map['ALBUM_ARTIST']!;
    ALBUM_SINGLE = map['ALBUM_SINGLE']!;
    ALL_FILES = map['ALL_FILES']!;
    ARTIST = map['ARTIST']!;
    ARTIST_SINGLE = map['ARTIST_SINGLE']!;
    ASCENDING = map['ASCENDING']!;
    AUTOMATICALLY_ADD_OTHER_SONGS_TO_NOW_PLAYING = map['AUTOMATICALLY_ADD_OTHER_SONGS_TO_NOW_PLAYING']!;
    AUTOMATICALLY_ADD_OTHER_SONGS_TO_NOW_PLAYING_TITLE = map['AUTOMATICALLY_ADD_OTHER_SONGS_TO_NOW_PLAYING_TITLE']!;
    AUTO_REFRESH_SETTING = map['AUTO_REFRESH_SETTING']!;
    AUTO_REFRESH_SETTING_TITLE = map['AUTO_REFRESH_SETTING_TITLE']!;
    AVAILABLE_STORAGES = map['AVAILABLE_STORAGES']!;
    AWESOME = map['AWESOME']!;
    A_TO_Z = map['A_TO_Z']!;
    BACKGROUND_ARTWORK_SUBTITLE = map['BACKGROUND_ARTWORK_SUBTITLE']!;
    BACKGROUND_ARTWORK_TITLE = map['BACKGROUND_ARTWORK_TITLE']!;
    BETA = map['BETA']!;
    BUFFERING = map['BUFFERING']!;
    CANCEL = map['CANCEL']!;
    CHANGE_NOW_PLAYING_BAR_COLOR_BASED_ON_MUSIC = map['CHANGE_NOW_PLAYING_BAR_COLOR_BASED_ON_MUSIC']!;
    CHANGE_NOW_PLAYING_BAR_COLOR_BASED_ON_MUSIC_TITLE = map['CHANGE_NOW_PLAYING_BAR_COLOR_BASED_ON_MUSIC_TITLE']!;
    CLEAR_LRC_FILE = map['CLEAR_LRC_FILE']!;
    COLLECTION = map['COLLECTION']!;
    COLLECTION_ALBUM_DELETE_DIALOG_BODY = map['COLLECTION_ALBUM_DELETE_DIALOG_BODY']!;
    COLLECTION_ALBUM_DELETE_DIALOG_HEADER = map['COLLECTION_ALBUM_DELETE_DIALOG_HEADER']!;
    COLLECTION_INDEXING_HINT = map['COLLECTION_INDEXING_HINT']!;
    COLLECTION_INDEXING_LABEL = map['COLLECTION_INDEXING_LABEL']!;
    COLLECTION_PLAYLIST_DELETE_DIALOG_BODY = map['COLLECTION_PLAYLIST_DELETE_DIALOG_BODY']!;
    COLLECTION_PLAYLIST_DELETE_DIALOG_HEADER = map['COLLECTION_PLAYLIST_DELETE_DIALOG_HEADER']!;
    COLLECTION_SEARCH_LABEL = map['COLLECTION_SEARCH_LABEL']!;
    COLLECTION_SEARCH_NO_RESULTS_SUBTITLE = map['COLLECTION_SEARCH_NO_RESULTS_SUBTITLE']!;
    COLLECTION_SEARCH_NO_RESULTS_TITLE = map['COLLECTION_SEARCH_NO_RESULTS_TITLE']!;
    COLLECTION_SEARCH_WELCOME = map['COLLECTION_SEARCH_WELCOME']!;
    COLLECTION_TOP_SUBHEADER_ALBUM = map['COLLECTION_TOP_SUBHEADER_ALBUM']!;
    COLLECTION_TOP_SUBHEADER_ARTIST = map['COLLECTION_TOP_SUBHEADER_ARTIST']!;
    COLLECTION_TOP_SUBHEADER_TRACK = map['COLLECTION_TOP_SUBHEADER_TRACK']!;
    COLLECTION_TRACKS_SUBHEADER = map['COLLECTION_TRACKS_SUBHEADER']!;
    COLLECTION_TRACK_DELETE_DIALOG_BODY = map['COLLECTION_TRACK_DELETE_DIALOG_BODY']!;
    COLLECTION_TRACK_DELETE_DIALOG_HEADER = map['COLLECTION_TRACK_DELETE_DIALOG_HEADER']!;
    COLLECTION_TRACK_PLAYLIST_REMOVE_DIALOG_BODY = map['COLLECTION_TRACK_PLAYLIST_REMOVE_DIALOG_BODY']!;
    COMING_UP = map['COMING_UP']!;
    CONTROL_PANEL = map['CONTROL_PANEL']!;
    COPY_AS_JSON = map['COPY_AS_JSON']!;
    COPY_LINK = map['COPY_LINK']!;
    CORRUPT_LRC_FILE = map['CORRUPT_LRC_FILE']!;
    COUNT = map['COUNT']!;
    CREATE = map['CREATE']!;
    CREATE_NEW_PLAYLIST = map['CREATE_NEW_PLAYLIST']!;
    CREATE_PLAYLIST_SUBHEADER = map['CREATE_PLAYLIST_SUBHEADER']!;
    DATE_ADDED = map['DATE_ADDED']!;
    DELETE = map['DELETE']!;
    DESCENDING = map['DESCENDING']!;
    DISABLE_VOLUME_BOOST = map['DISABLE_VOLUME_BOOST']!;
    DISCOVERING_FILES = map['DISCOVERING_FILES']!;
    DISPLAY_AUDIO_FORMAT = map['DISPLAY_AUDIO_FORMAT']!;
    DONATE = map['DONATE']!;
    DONE = map['DONE']!;
    DOWNLOAD = map['DOWNLOAD']!;
    DOWNLOAD_UPDATE = map['DOWNLOAD_UPDATE']!;
    EDIT = map['EDIT']!;
    EDIT_DETAILS = map['EDIT_DETAILS']!;
    EDIT_MINIMUM_FILE_SIZE = map['EDIT_MINIMUM_FILE_SIZE']!;
    ENABLE_125_SCALING = map['ENABLE_125_SCALING']!;
    ENABLE_ACRYLIC_BLUR = map['ENABLE_ACRYLIC_BLUR']!;
    ENABLE_DISCORD_RPC = map['ENABLE_DISCORD_RPC']!;
    ERROR = map['ERROR']!;
    EXIT_FULLSCREEN = map['EXIT_FULLSCREEN']!;
    EXIT_NOW_PLAYING = map['EXIT_NOW_PLAYING']!;
    EXIT_SUBTITLE = map['EXIT_SUBTITLE']!;
    EXIT_TITLE = map['EXIT_TITLE']!;
    EXPERIMENTAL = map['EXPERIMENTAL']!;
    EXPERIMENTAL_SUBTITLE = map['EXPERIMENTAL_SUBTITLE']!;
    FALLBACK_ALBUM_ARTS = map['FALLBACK_ALBUM_ARTS']!;
    FILE = map['FILE']!;
    FILE_INFORMATION = map['FILE_INFORMATION']!;
    FILE_PATH_OR_URL = map['FILE_PATH_OR_URL']!;
    FOLDERS_NOT_FOUND = map['FOLDERS_NOT_FOUND']!;
    FOLDER_NOT_FOUND = map['FOLDER_NOT_FOUND']!;
    FULLSCREEN = map['FULLSCREEN']!;
    GENRE = map['GENRE']!;
    GO_TO_SETTINGS = map['GO_TO_SETTINGS']!;
    HIDE = map['HIDE']!;
    HIDE_LYRICS = map['HIDE_LYRICS']!;
    HIGHLIGHTED_LYRICS_SIZE = map['HIGHLIGHTED_LYRICS_SIZE']!;
    HISTORY = map['HISTORY']!;
    IMAGES = map['IMAGES']!;
    IMPORT = map['IMPORT']!;
    IMPORT_PLAYLIST_SUBTITLE = map['IMPORT_PLAYLIST_SUBTITLE']!;
    IMPORT_PLAYLIST_TITLE = map['IMPORT_PLAYLIST_TITLE']!;
    INDEXING_ALREADY_GOING_ON_SUBTITLE = map['INDEXING_ALREADY_GOING_ON_SUBTITLE']!;
    INDEXING_ALREADY_GOING_ON_TITLE = map['INDEXING_ALREADY_GOING_ON_TITLE']!;
    INTERNET_ERROR = map['INTERNET_ERROR']!;
    INVALID_PLAYLIST_URL = map['INVALID_PLAYLIST_URL']!;
    LAST_COLLECTION_DIRECTORY_REMOVED = map['LAST_COLLECTION_DIRECTORY_REMOVED']!;
    LESS = map['LESS']!;
    LIKED_SONGS = map['LIKED_SONGS']!;
    LYRICS = map['LYRICS']!;
    LYRICS_NOT_FOUND = map['LYRICS_NOT_FOUND']!;
    LYRICS_RETRIEVING = map['LYRICS_RETRIEVING']!;
    MEDIA_FILES = map['MEDIA_FILES']!;
    MENU = map['MENU']!;
    MINIMUM_FILE_SIZE = map['MINIMUM_FILE_SIZE']!;
    MINIMUM_FILE_SIZE_WARNING = map['MINIMUM_FILE_SIZE_WARNING']!;
    MOBILE_ALBUM_GRID_SIZE = map['MOBILE_ALBUM_GRID_SIZE']!;
    MOBILE_ARTIST_GRID_SIZE = map['MOBILE_ARTIST_GRID_SIZE']!;
    MOBILE_ENABLE_NOW_PLAYING_RIPPLE_EFFECT = map['MOBILE_ENABLE_NOW_PLAYING_RIPPLE_EFFECT']!;
    MOBILE_ENABLE_VOLUME_SLIDER = map['MOBILE_ENABLE_VOLUME_SLIDER']!;
    MORE = map['MORE']!;
    MUTE = map['MUTE']!;
    M_TRACKS_AND_N_ALBUMS = map['M_TRACKS_AND_N_ALBUMS']!;
    NEXT = map['NEXT']!;
    NO = map['NO']!;
    NOTHING_IN_QUEUE = map['NOTHING_IN_QUEUE']!;
    NOTIFICATION_LYRICS_SUBTITLE = map['NOTIFICATION_LYRICS_SUBTITLE']!;
    NOTIFICATION_LYRICS_TITLE = map['NOTIFICATION_LYRICS_TITLE']!;
    NOW_PLAYING = map['NOW_PLAYING']!;
    NOW_PLAYING_SCREEN = map['NOW_PLAYING_SCREEN']!;
    NOW_PLAYING_SCREEN_SETTING_SUBTITLE = map['NOW_PLAYING_SCREEN_SETTING_SUBTITLE']!;
    NOW_YOU_ARE_GOOD_TO_GO_BACK = map['NOW_YOU_ARE_GOOD_TO_GO_BACK']!;
    NO_COLLECTION_SUBTITLE = map['NO_COLLECTION_SUBTITLE']!;
    NO_COLLECTION_TITLE = map['NO_COLLECTION_TITLE']!;
    NO_DOWNLOAD_UPDATE = map['NO_DOWNLOAD_UPDATE']!;
    NO_INTERNET_SUBTITLE = map['NO_INTERNET_SUBTITLE']!;
    NO_INTERNET_TITLE = map['NO_INTERNET_TITLE']!;
    NO_PLAYLISTS_FOUND = map['NO_PLAYLISTS_FOUND']!;
    N_TRACKS = map['N_TRACKS']!;
    OK = map['OK']!;
    OPEN_FILE_OR_URL = map['OPEN_FILE_OR_URL']!;
    OPEN_IN_BROWSER = map['OPEN_IN_BROWSER']!;
    OPTIONS = map['OPTIONS']!;
    ORDER = map['ORDER']!;
    PAUSE = map['PAUSE']!;
    PERMISSIONS = map['PERMISSIONS']!;
    PERMISSIONS_SUBTITLE = map['PERMISSIONS_SUBTITLE']!;
    PERMISSION_IMAGES_AND_PHOTOS = map['PERMISSION_IMAGES_AND_PHOTOS']!;
    PERMISSION_IMAGES_AND_PHOTOS_SUBTITLE = map['PERMISSION_IMAGES_AND_PHOTOS_SUBTITLE']!;
    PERMISSION_MUSIC_AND_AUDIO = map['PERMISSION_MUSIC_AND_AUDIO']!;
    PERMISSION_MUSIC_AND_AUDIO_SUBTITLE = map['PERMISSION_MUSIC_AND_AUDIO_SUBTITLE']!;
    PERMISSION_NOTIFICATIONS = map['PERMISSION_NOTIFICATIONS']!;
    PERMISSION_NOTIFICATIONS_SUBTITLE = map['PERMISSION_NOTIFICATIONS_SUBTITLE']!;
    PHONE = map['PHONE']!;
    PITCH = map['PITCH']!;
    PLAY = map['PLAY']!;
    PLAYLIST = map['PLAYLIST']!;
    PLAYLISTS_CREATE = map['PLAYLISTS_CREATE']!;
    PLAYLISTS_SUBHEADER = map['PLAYLISTS_SUBHEADER']!;
    PLAYLISTS_TEXT_FIELD_HINT = map['PLAYLISTS_TEXT_FIELD_HINT']!;
    PLAYLISTS_TEXT_FIELD_LABEL = map['PLAYLISTS_TEXT_FIELD_LABEL']!;
    PLAYLIST_ADD_DIALOG_BODY = map['PLAYLIST_ADD_DIALOG_BODY']!;
    PLAYLIST_ADD_DIALOG_TITLE = map['PLAYLIST_ADD_DIALOG_TITLE']!;
    PLAYLIST_NAME = map['PLAYLIST_NAME']!;
    PLAYLIST_SINGLE = map['PLAYLIST_SINGLE']!;
    PLAYLIST_TRACKS_SUBHEADER = map['PLAYLIST_TRACKS_SUBHEADER']!;
    PLAY_INTERNET = map['PLAY_INTERNET']!;
    PLAY_NOW = map['PLAY_NOW']!;
    PLAY_URL = map['PLAY_URL']!;
    PLAY_URL_SUBTITLE = map['PLAY_URL_SUBTITLE']!;
    PREVIOUS = map['PREVIOUS']!;
    PROPERTY = map['PROPERTY']!;
    READ = map['READ']!;
    READ_METADATA = map['READ_METADATA']!;
    RECOMMENDATIONS = map['RECOMMENDATIONS']!;
    RECOMMENDED_HINT = map['RECOMMENDED_HINT']!;
    REFRESH = map['REFRESH']!;
    REFRESH_INFORMATION = map['REFRESH_INFORMATION']!;
    REFRESH_SUBTITLE = map['REFRESH_SUBTITLE']!;
    REINDEX = map['REINDEX']!;
    REINDEX_INFORMATION = map['REINDEX_INFORMATION']!;
    REINDEX_SUBTITLE = map['REINDEX_SUBTITLE']!;
    REMIND_ME_NEXT_TIME = map['REMIND_ME_NEXT_TIME']!;
    REMOVE = map['REMOVE']!;
    REMOVE_FROM_PLAYLIST = map['REMOVE_FROM_PLAYLIST']!;
    RENAME = map['RENAME']!;
    REPEAT = map['REPEAT']!;
    RESET_PITCH = map['RESET_PITCH']!;
    RESET_SPEED = map['RESET_SPEED']!;
    RESTORE = map['RESTORE']!;
    RESTORE_DEFAULTS = map['RESTORE_DEFAULTS']!;
    RESULTS_FOR_QUERY = map['RESULTS_FOR_QUERY']!;
    RETRIEVING_INFO = map['RETRIEVING_INFO']!;
    RETRIEVING_LINK = map['RETRIEVING_LINK']!;
    SAVE = map['SAVE']!;
    SAVE_AS_PLAYLIST = map['SAVE_AS_PLAYLIST']!;
    SD_CARD = map['SD_CARD']!;
    SEARCH = map['SEARCH']!;
    SEARCH_COLLECTION = map['SEARCH_COLLECTION']!;
    SEARCH_HISTORY_SUBHEADER = map['SEARCH_HISTORY_SUBHEADER']!;
    SEARCH_NO_RECENT_SEARCHES = map['SEARCH_NO_RECENT_SEARCHES']!;
    SEARCH_WELCOME = map['SEARCH_WELCOME']!;
    SEE_ALL = map['SEE_ALL']!;
    SELECTED_DIRECTORIES = map['SELECTED_DIRECTORIES']!;
    SELECTED_DIRECTORY = map['SELECTED_DIRECTORY']!;
    SETTING = map['SETTING']!;
    SETTING_ACCENT_COLOR_AUTOMATIC = map['SETTING_ACCENT_COLOR_AUTOMATIC']!;
    SETTING_ACCENT_COLOR_SUBTITLE = map['SETTING_ACCENT_COLOR_SUBTITLE']!;
    SETTING_ACCENT_COLOR_TITLE = map['SETTING_ACCENT_COLOR_TITLE']!;
    SETTING_APP_VERSION_INSTALLED = map['SETTING_APP_VERSION_INSTALLED']!;
    SETTING_APP_VERSION_LATEST = map['SETTING_APP_VERSION_LATEST']!;
    SETTING_APP_VERSION_SUBTITLE = map['SETTING_APP_VERSION_SUBTITLE']!;
    SETTING_APP_VERSION_TITLE = map['SETTING_APP_VERSION_TITLE']!;
    SETTING_INDEXING_LINEAR_PROGRESS_INDICATOR = map['SETTING_INDEXING_LINEAR_PROGRESS_INDICATOR']!;
    SETTING_INDEXING_SUBTITLE = map['SETTING_INDEXING_SUBTITLE']!;
    SETTING_INDEXING_TITLE = map['SETTING_INDEXING_TITLE']!;
    SETTING_LANGUAGE_SUBTITLE = map['SETTING_LANGUAGE_SUBTITLE']!;
    SETTING_LANGUAGE_TITLE = map['SETTING_LANGUAGE_TITLE']!;
    SETTING_MISCELLANEOUS_SUBTITLE = map['SETTING_MISCELLANEOUS_SUBTITLE']!;
    SETTING_MISCELLANEOUS_TITLE = map['SETTING_MISCELLANEOUS_TITLE']!;
    SETTING_THEME_SUBTITLE = map['SETTING_THEME_SUBTITLE']!;
    SETTING_THEME_TITLE = map['SETTING_THEME_TITLE']!;
    SET_LRC_FILE = map['SET_LRC_FILE']!;
    SHARE = map['SHARE']!;
    SHOW_ALBUM = map['SHOW_ALBUM']!;
    SHOW_IN_FILE_MANAGER = map['SHOW_IN_FILE_MANAGER']!;
    SHOW_LYRICS = map['SHOW_LYRICS']!;
    SHOW_NOW_PLAYING_AFTER_PLAYING = map['SHOW_NOW_PLAYING_AFTER_PLAYING']!;
    SHOW_NOW_PLAYING_AFTER_PLAYING_SUBTITLE = map['SHOW_NOW_PLAYING_AFTER_PLAYING_SUBTITLE']!;
    SHOW_NOW_PLAYING_SCREEN = map['SHOW_NOW_PLAYING_SCREEN']!;
    SHOW_TRACK_PROGRESS_ON_TASKBAR = map['SHOW_TRACK_PROGRESS_ON_TASKBAR']!;
    SHOW_TRACK_PROGRESS_ON_TASKBAR_SUBTITLE = map['SHOW_TRACK_PROGRESS_ON_TASKBAR_SUBTITLE']!;
    SHUFFLE = map['SHUFFLE']!;
    SORT = map['SORT']!;
    SORT_BY = map['SORT_BY']!;
    SPEED = map['SPEED']!;
    STARTING_PLAYBACK = map['STARTING_PLAYBACK']!;
    STATS_SUBTITLE = map['STATS_SUBTITLE']!;
    STATS_TITLE = map['STATS_TITLE']!;
    STREAM = map['STREAM']!;
    THEME_MODE_DARK = map['THEME_MODE_DARK']!;
    THEME_MODE_LIGHT = map['THEME_MODE_LIGHT']!;
    THEME_MODE_SYSTEM = map['THEME_MODE_SYSTEM']!;
    TRACK = map['TRACK']!;
    TRACKS_FROM_ARTIST = map['TRACKS_FROM_ARTIST']!;
    TRACK_NUMBER = map['TRACK_NUMBER']!;
    TRACK_SINGLE = map['TRACK_SINGLE']!;
    TRANSFERS = map['TRANSFERS']!;
    TYPE = map['TYPE']!;
    UNHIGHLIGHTED_LYRICS_SIZE = map['UNHIGHLIGHTED_LYRICS_SIZE']!;
    UNMUTE = map['UNMUTE']!;
    UPDATE_AVAILABLE = map['UPDATE_AVAILABLE']!;
    URL = map['URL']!;
    USE_LRC_FILE_FROM_TRACK_DIRECTORY = map['USE_LRC_FILE_FROM_TRACK_DIRECTORY']!;
    USE_MODERN_NOW_PLAYING_SCREEN = map['USE_MODERN_NOW_PLAYING_SCREEN']!;
    USE_THESE_CHARACTERS_TO_SEPARATE_ARTISTS = map['USE_THESE_CHARACTERS_TO_SEPARATE_ARTISTS']!;
    VALUE = map['VALUE']!;
    VIDEO_SINGLE = map['VIDEO_SINGLE']!;
    VISUALS = map['VISUALS']!;
    VISUALS_TITLE = map['VISUALS_TITLE']!;
    VOLUME_BOOST = map['VOLUME_BOOST']!;
    WARNING = map['WARNING']!;
    WEB_INTERNET_ERROR = map['WEB_INTERNET_ERROR']!;
    WEB_NO_RESULTS = map['WEB_NO_RESULTS']!;
    WEB_WELCOME = map['WEB_WELCOME']!;
    WEB_WELCOME_SUBTITLE = map['WEB_WELCOME_SUBTITLE']!;
    WEB_WELCOME_TITLE = map['WEB_WELCOME_TITLE']!;
    YEAR = map['YEAR']!;
    YES = map['YES']!;
    current = value;
    notifyListeners();
  }

  /// Currently selected & displayed [Language].
  late LanguageData current;

  @override
  // ignore: must_call_super
  void dispose() {}
}

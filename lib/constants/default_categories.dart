import '../models/app_classification.dart';

class DefaultCategories {
  // Human-readable display names for known package names.
  // Used as a fallback when the system cannot resolve the app label.
  static const Map<String, String> displayNames = {
    'com.ichi2.anki': 'AnkiDroid',
    'com.instructure.candroid': 'Canvas Student',
    'com.zwift.zwiftgame': 'Zwift',
    'com.duolingo': 'Duolingo',
    'com.google.android.apps.fitness': 'Google Fit',
    'com.fitbit.FitbitMobile': 'Fitbit',
    'com.strava': 'Strava',
    'com.calm.android': 'Calm',
    'com.getsomeheadspace.android': 'Headspace',
    'com.audible.application': 'Audible',
    'com.todoist': 'Todoist',
    'notion.id': 'Notion',
    'com.evernote': 'Evernote',
    'org.khanacademy.android': 'Khan Academy',
    'org.coursera.android': 'Coursera',
    'com.memrise.android.memrisecompanion': 'Memrise',
    'com.babbel.mobile.android.en': 'Babbel',
    'air.com.rosettastone.mobile.CoursePlayer': 'Rosetta Stone',
    'com.onepeloton.callisto': 'Peloton',
    'com.nike.ntc': 'Nike Training Club',
    'com.alltrails.alltrails': 'AllTrails',
    'com.clozemaster.v2': 'Clozemaster',
    'com.zhiliaoapp.musically': 'TikTok',
    'com.instagram.android': 'Instagram',
    'com.facebook.katana': 'Facebook',
    'com.twitter.android': 'X',
    'com.reddit.frontpage': 'Reddit',
    'com.snapchat.android': 'Snapchat',
    'com.pinterest': 'Pinterest',
    'com.tumblr': 'Tumblr',
    'com.tiktok.lite.go': 'TikTok Lite',
    'com.vkontakte.android': 'VK',
    'com.king.candycrushsaga': 'Candy Crush Saga',
    'com.supercell.clashofclans': 'Clash of Clans',
    'com.supercell.clashroyale': 'Clash Royale',
    'com.rovio.baba': 'Angry Birds 2',
    'com.nianticlabs.pokemongo': 'Pokémon GO',
    'com.playrix.gardenscapes': 'Gardenscapes',
    'com.ea.game.pvzfree_row': 'Plants vs. Zombies',
    'com.kiloo.subwaysurf': 'Subway Surfers',
    'com.imangi.templerun': 'Temple Run',
    'com.google.android.apps.maps': 'Google Maps',
    'com.spotify.music': 'Spotify',
    'com.google.android.apps.youtube.music': 'YouTube Music',
    'com.apple.android.music': 'Apple Music',
    'com.whatsapp': 'WhatsApp',
    'com.google.android.apps.messaging': 'Google Messages',
    'com.google.android.dialer': 'Phone',
    'com.google.android.gm': 'Gmail',
    'com.microsoft.office.outlook': 'Outlook',
    'com.google.android.calendar': 'Google Calendar',
    'com.weather.Weather': 'The Weather Channel',
    'com.yahoo.mobile.client.android.weather': 'Yahoo Weather',
    'com.google.android.apps.photos': 'Google Photos',
    'com.google.android.apps.docs': 'Google Docs',
    'com.Slack': 'Slack',
    'com.microsoft.teams': 'Microsoft Teams',
    'us.zoom.videomeetings': 'Zoom',
    'org.telegram.messenger': 'Telegram',
    'com.discord': 'Discord',
    'com.example.screen_time_wrapped': 'Screen Time Wrapped',
    'com.accuweather.android': 'AccuWeather',
  };

  // Package names that are always hidden from reports and categories.
  // These are system/background services with no meaningful screen time.
  static const Set<String> excluded = {
    'com.google.android.apps.scone',                      // Adaptive Connectivity Services
    'com.google.android.aicore',                          // AICore
    'com.google.android.projection.gearhead',             // Android Auto
    'com.google.android.apps.nexuslauncher',              // Pixel Launcher
    'com.google.android.apps.aiwallpapers',               // AI Wallpaper
    'com.google.android.marvin.talkback',                 // Android Accessibility Suite
    'com.google.android.apps.restore',                    // Android Switch
    'com.google.android.apps.accessibility.switchaccess', // Switch Access
    'com.google.android.as',                              // Android System Intelligence
    'com.google.android.contactkeys',                     // Android System Key Verifier
    'com.google.android.safetycore',                      // Android SystemSafetyCore
    'com.google.android.webview',                         // Android System WebView
    'com.google.android.captiveportallogin',              // Captive Portal Login
    'com.google.android.apps.wellbeing',                  // Digital Wellbeing
  };

  static const Map<String, AppCategory> defaults = {
    // GOOD APPS (productivity, fitness, learning)
    'com.ichi2.anki': AppCategory.good,                             // AnkiDroid
    'com.instructure.candroid': AppCategory.good,                   // Canvas Student
    'com.zwift.zwiftgame': AppCategory.good,                        // Zwift
    'com.duolingo': AppCategory.good,                               // Duolingo
    'com.google.android.apps.fitness': AppCategory.good,            // Google Fit
    'com.fitbit.FitbitMobile': AppCategory.good,                    // Fitbit
    'com.strava': AppCategory.good,                                 // Strava
    'com.calm.android': AppCategory.good,                           // Calm
    'com.getsomeheadspace.android': AppCategory.good,               // Headspace
    'com.audible.application': AppCategory.good,                    // Audible
    'com.todoist': AppCategory.good,                                // Todoist
    'notion.id': AppCategory.good,                                  // Notion
    'com.evernote': AppCategory.good,                               // Evernote
    'org.khanacademy.android': AppCategory.good,                    // Khan Academy
    'org.coursera.android': AppCategory.good,                       // Coursera
    'com.memrise.android.memrisecompanion': AppCategory.good,       // Memrise
    'com.babbel.mobile.android.en': AppCategory.good,               // Babbel
    'air.com.rosettastone.mobile.CoursePlayer': AppCategory.good,   // Rosetta Stone
    'com.onepeloton.callisto': AppCategory.good,                    // Peloton
    'com.nike.ntc': AppCategory.good,                               // Nike Training Club
    'com.alltrails.alltrails': AppCategory.good,                    // AllTrails
    'com.clozemaster.v2': AppCategory.good,                         // Clozemaster    

    // BAD APPS (social media, games)
    'com.zhiliaoapp.musically': AppCategory.bad,                    // TikTok
    'com.instagram.android': AppCategory.bad,                       // Instagram
    'com.facebook.katana': AppCategory.bad,                         // Facebook
    'com.twitter.android': AppCategory.bad,                         // X / Twitter
    'com.reddit.frontpage': AppCategory.bad,                        // Reddit
    'com.snapchat.android': AppCategory.bad,                        // Snapchat
    'com.pinterest': AppCategory.bad,                               // Pinterest
    'com.tumblr': AppCategory.bad,                                  // Tumblr
    'com.tiktok.lite.go': AppCategory.bad,                          // TikTok Lite
    'com.vkontakte.android': AppCategory.bad,                       // VK
    'com.king.candycrushsaga': AppCategory.bad,                     // Candy Crush Saga
    'com.supercell.clashofclans': AppCategory.bad,                  // Clash of Clans
    'com.supercell.clashroyale': AppCategory.bad,                   // Clash Royale
    'com.rovio.baba': AppCategory.bad,                              // Angry Birds 2
    'com.nianticlabs.pokemongo': AppCategory.bad,                   // Pokémon GO
    'com.playrix.gardenscapes': AppCategory.bad,                    // Gardenscapes
    'com.ea.game.pvzfree_row': AppCategory.bad,                     // Plants vs. Zombies
    'com.kiloo.subwaysurf': AppCategory.bad,                        // Subway Surfers
    'com.imangi.templerun': AppCategory.bad,                        // Temple Run

    // NEUTRAL APPS (utilities, communication, media)
    'com.google.android.apps.maps': AppCategory.neutral,            // Google Maps
    'com.spotify.music': AppCategory.neutral,                       // Spotify
    'com.google.android.apps.youtube.music': AppCategory.neutral,   // YouTube Music
    'com.apple.android.music': AppCategory.neutral,                 // Apple Music
    'com.whatsapp': AppCategory.neutral,                            // WhatsApp
    'com.google.android.apps.messaging': AppCategory.neutral,       // Google Messages
    'com.google.android.dialer': AppCategory.neutral,               // Phone
    'com.google.android.gm': AppCategory.neutral,                   // Gmail
    'com.microsoft.office.outlook': AppCategory.neutral,            // Outlook
    'com.google.android.calendar': AppCategory.neutral,             // Google Calendar
    'com.weather.Weather': AppCategory.neutral,                     // The Weather Channel
    'com.yahoo.mobile.client.android.weather': AppCategory.neutral, // Yahoo Weather
    'com.google.android.apps.photos': AppCategory.neutral,          // Google Photos
    'com.google.android.apps.docs': AppCategory.neutral,            // Google Docs
    'com.Slack': AppCategory.neutral,                               // Slack
    'com.microsoft.teams': AppCategory.neutral,                     // Microsoft Teams
    'us.zoom.videomeetings': AppCategory.neutral,                   // Zoom
    'org.telegram.messenger': AppCategory.neutral,                  // Telegram
    'com.discord': AppCategory.neutral,                             // Discord
    'com.accuweather.android': AppCategory.neutral,                 // AccuWeather
    'com.example.screen_time_wrapped': AppCategory.neutral,         // Screen Time Wrapped
  };
}

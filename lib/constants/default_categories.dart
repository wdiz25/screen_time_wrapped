import '../models/app_classification.dart';

class DefaultCategories {

  // Package names that are always hidden from reports and categories.
  // These are system/background services with no meaningful screen time.
  static const Set<String> excluded = {
    'com.google.android.apps.scone',                                    // Adaptive Connectivity Services
    'com.google.android.aicore',                                        // AICore
    'com.google.android.projection.gearhead',                           // Android Auto
    'com.google.android.apps.nexuslauncher',                            // Pixel Launcher
    'com.google.android.apps.aiwallpapers',                             // AI Wallpaper
    'com.google.android.marvin.talkback',                               // Android Accessibility Suite
    'com.google.android.apps.restore',                                  // Android Switch
    'com.google.android.accessibility.switchaccess',                    // Switch Access
    'com.google.android.as',                                            // Android System Intelligence
    'com.google.android.contactkeys',                                   // Android System Key Verifier
    'com.google.android.safetycore',                                    // Android SystemSafetyCore
    'com.google.android.webview',                                       // Android System WebView
    'com.google.android.captiveportallogin',                            // Captive Portal Login
    'com.google.android.apps.wellbeing',                                // Digital Wellbeing
    'com.google.ambient.streaming',                                     // Cross-Device Services
    'com.google.android.apps.ai.icons',                                 // Custom Icons
    'com.google.android.apps.turbo',                                    // Device Health Services
    'com.google.android.apps.pixel.dcservice',                          // Device Connectivity Service
    'com.google.assistant.hubui',                                       // Dreams
    'com.google.android.apps.emojiwallpaper',                           // Emoji Workshop Wallpaper
    'com.google.android.inputmethod.latin',                             // Gboard
    'com.google.android.apps.gcs',                                      // Google Connectivity Services
    'com.google.android.partnersetup',                                  // Google Partner Setup
    'com.google.android.gms',                                           // Google Play Services
    'com.google.android.odad',                                          // Google Play Protect Services
    'com.google.android.apps.carrier.carrierwifi',                      // Google Wi-Fi Provisioner
    'com.google.audio.hearing.visualization.accessibility.scribe',      // Live Transcribe
    'com.google.android.modulemetadata',                                // Main Components
    'com.google.android.apps.privacy.wildlife',                         // VPN by Google
    'com.google.android.apps.accessibility.voiceaccess',                // Voice Access
    'com.google.android.apps.pixel.customizationbundle',                // Themes Packs
    'com.google.android.gms.supervision',                               // System Parental Controls
    'com.google.mainline.telemetry',                                    // Support Components
    'com.google.android.tts',                                           // Speech Recognition and Synthesis from Google
    'com.google.android.soundpicker',                                   // Sounds
    'com.google.android.accessibility.soundamplifier',                  // Sound Amplifier
    'com.google.android.euicc',                                         // SIM Manager
    'com.google.android.settings.intelligence',                         // Settings Services
    'com.example.screen_time_wrapped',                                  // Screen Time Wrapped
  };

  static const Map<String, AppCategory> defaults = {
    // GOOD APPS (productivity, fitness, learning)
    'com.ichi2.anki': AppCategory.good,                                 // AnkiDroid
    'com.instructure.candroid': AppCategory.good,                       // Canvas Student
    'com.zwift.zwiftgame': AppCategory.good,                            // Zwift
    'com.duolingo': AppCategory.good,                                   // Duolingo
    'com.google.android.apps.fitness': AppCategory.good,                // Google Fit
    'com.fitbit.FitbitMobile': AppCategory.good,                        // Fitbit
    'com.strava': AppCategory.good,                                     // Strava
    'com.calm.android': AppCategory.good,                               // Calm
    'com.getsomeheadspace.android': AppCategory.good,                   // Headspace
    'com.audible.application': AppCategory.good,                        // Audible
    'com.todoist': AppCategory.good,                                    // Todoist
    'notion.id': AppCategory.good,                                      // Notion
    'com.evernote': AppCategory.good,                                   // Evernote
    'org.khanacademy.android': AppCategory.good,                        // Khan Academy
    'org.coursera.android': AppCategory.good,                           // Coursera
    'com.memrise.android.memrisecompanion': AppCategory.good,           // Memrise
    'com.babbel.mobile.android.en': AppCategory.good,                   // Babbel
    'air.com.rosettastone.mobile.CoursePlayer': AppCategory.good,       // Rosetta Stone
    'com.onepeloton.callisto': AppCategory.good,                        // Peloton
    'com.nike.ntc': AppCategory.good,                                   // Nike Training Club
    'com.alltrails.alltrails': AppCategory.good,                        // AllTrails
    'com.clozemaster.v2': AppCategory.good,                             // Clozemaster
    'com.highmark.myhighmark': AppCategory.good,                        // My Highmark
    'com.upmc.enterprises.myupmc': AppCategory.good,                    // MyUPMC
    'com.google.android.apps.messaging': AppCategory.good,              // Google Messages
    'com.google.android.dialer': AppCategory.good,                      // Phone
    'com.yougov.mobile.online': AppCategory.good,                       // YouGov
    'com.thetransitapp.droid': AppCategory.good,                        // Transit
    'com.teamreach.app': AppCategory.good,                              // TeamReach
    'com.github.android': AppCategory.good,                             // GitHub
    'com.whatsapp': AppCategory.good,                                   // WhatsApp
    'com.google.android.gm': AppCategory.good,                          // Gmail
    'com.microsoft.office.outlook': AppCategory.good,                   // Outlook
    'com.microsoft.teams': AppCategory.good,                            // Microsoft Teams
    'com.Slack': AppCategory.good,                                      // Slack
    'us.zoom.videomeetings': AppCategory.good,                          // Zoom
    'org.telegram.messenger': AppCategory.good,                         // Telegram
    'com.volatello.tellofpv': AppCategory.good,                         // Tello FPV
    'com.google.android.apps.docs': AppCategory.good,                   // Google Drive
    'com.google.android.apps.docs.editors.slides': AppCategory.good,    // Google Slides
    'com.google.android.apps.docs.editors.sheets': AppCategory.good,    // Google Sheets
    'com.google.android.apps.docs.editors.docs': AppCategory.good,      // Google Docs

    // GAMES
    'com.king.candycrushsaga': AppCategory.games,                       // Candy Crush Saga
    'com.supercell.clashofclans': AppCategory.games,                    // Clash of Clans
    'com.supercell.clashroyale': AppCategory.games,                     // Clash Royale
    'com.rovio.baba': AppCategory.games,                                // Angry Birds 2
    'com.nianticlabs.pokemongo': AppCategory.games,                     // Pokémon GO
    'com.playrix.gardenscapes': AppCategory.games,                      // Gardenscapes
    'com.ea.game.pvzfree_row': AppCategory.games,                       // Plants vs. Zombies
    'com.kiloo.subwaysurf': AppCategory.games,                          // Subway Surfers
    'com.imangi.templerun': AppCategory.games,                          // Temple Run

    // ENTERTAINMENT
    'com.hulu.plus': AppCategory.entertainment,                         // Hulu
    'com.netflix.mediaclient': AppCategory.entertainment,               // Netflix
    'com.xfinity.cloudtvr': AppCategory.entertainment,                  // Xfinity Stream
    'com.google.android.youtube': AppCategory.entertainment,            // YouTube

    // SHOPPING
    'com.amazon.mShop.android.shopping': AppCategory.shopping,          // Amazon
    'com.walmart.android': AppCategory.shopping,                        // Walmart

    // SOCIAL MEDIA
    'com.zhiliaoapp.musically': AppCategory.socialMedia,                // TikTok
    'com.instagram.android': AppCategory.socialMedia,                   // Instagram
    'com.facebook.katana': AppCategory.socialMedia,                     // Facebook
    'com.twitter.android': AppCategory.socialMedia,                     // X / Twitter
    'com.reddit.frontpage': AppCategory.socialMedia,                    // Reddit
    'com.snapchat.android': AppCategory.socialMedia,                    // Snapchat
    'com.pinterest': AppCategory.socialMedia,                           // Pinterest
    'com.tumblr': AppCategory.socialMedia,                              // Tumblr
    'com.tiktok.lite.go': AppCategory.socialMedia,                      // TikTok Lite
    'com.vkontakte.android': AppCategory.socialMedia,                   // VK
    'com.instagram.barcelona': AppCategory.socialMedia,                 // Threads
    'com.discord': AppCategory.socialMedia,                             // Discord

    // NEUTRAL APPS
    'com.spotify.music': AppCategory.neutral,                           // Spotify
    'com.google.android.apps.youtube.music': AppCategory.neutral,       // YouTube Music
    'com.apple.android.music': AppCategory.neutral,                     // Apple Music
    'com.android.chrome': AppCategory.neutral,                          // Chrome
    'com.google.android.googlequicksearchbox': AppCategory.neutral,     // Google Search
    'com.azure.authenticator': AppCategory.neutral,                     // Microsoft Authenticator
    'com.google.android.contacts': AppCategory.neutral,                 // Contacts
    'com.weather.Weather': AppCategory.neutral,                         // The Weather Channel
    'com.yahoo.mobile.client.android.weather': AppCategory.neutral,     // Yahoo Weather
    'com.accuweather.android': AppCategory.neutral,                     // AccuWeather
    'com.google.android.apps.maps': AppCategory.neutral,                // Google Maps
    'com.google.android.calendar': AppCategory.neutral,                 // Google Calendar
    'com.google.android.apps.photos': AppCategory.neutral,              // Google Photos
    'io.homeassistant.companion.android': AppCategory.neutral,          // Home Assistant
    'com.a3.yearlyprogess': AppCategory.neutral,                        // Yearly Progress
    'com.xfinity.mobile.spamfilter': AppCategory.neutral,               // Xfinity Call Guard
    'com.xfinity.digitalhome': AppCategory.neutral,                     // Xfinity
  };
}

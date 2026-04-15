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
    'com.google.android.apps.setupwizrd.searchselector',                // Search Engine Selector
    'com.google.android.as.oss',                                        // Private Compute Services
    'com.google.pixel.livewallpaper',                                   // Pixel Live Wallpaper
    'com.google.android.apps.camera.services',                          // Pixel Camera Services
    'com.google.android.networkstack',                                  // Network Manager
    'com.google.android.apps.helprtc',                                  // Google Support Services
    'com.google.ar.core',                                               // Google Play Services for AR
    'com.google.android.documentsui',                                   // Files (Picker UI)
    'com.google.android.apps.work.clouddpc',                            // Device Policy
    'com.google.android.apps.dreamliner',                               // Pixel Stand
    'com.google.android.apps.pixel.relationships',                      // Pixel VIPs
    'com.google.android.apps.pixel.support',                            // Pixel Troubleshooting
    'edu.kent.honors.screen_time_synopsis',                             // Screen Time Synopsis
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

    // TOP 300 APPS
    'com.google.android.apps.subscriptions.red': AppCategory.neutral,   // Google One
    'com.mojang.minecraftpe': AppCategory.games,                        // Minecraft: Dream it, Build it!
    'com.openai.chatgpt': AppCategory.neutral,                          // ChatGPT
    'com.robtopx.geometryjump': AppCategory.games,                      // Geometry Dash
    'com.einnovation.temu': AppCategory.shopping,                       // Temu: Shop Like a Billionaire
    'com.scopely.monopolygo': AppCategory.games,                        // MONOPOLY GO!
    'com.humble.SlayTheSpire': AppCategory.games,                       // Slay the Spire
    'com.playstack.balatro.android': AppCategory.good,                  // Balatro
    'com.playdigious.seaofstars': AppCategory.games,                    // Sea of Stars
    'com.scopely.monopolygo.companion': AppCategory.games,              // MONOPOLY GO!Chat
    'com.fun.lastwar.gp': AppCategory.games,                            // Last War:Survival Game
    'com.ninjakiwi.bloonstd6': AppCategory.games,                       // Bloons TD 6
    'com.dreamgames.royalmatch': AppCategory.games,                     // Royal Match
    'com.chucklefish.stardewvalley': AppCategory.games,                 // Stardew Valley
    'com.facebook.stella': AppCategory.neutral,                         // Meta AI - Assistant & Glasses
    'com.peacocktv.peacockandroid': AppCategory.entertainment,          // Peacock TV: Stream TV & Movies
    'com.PanikArcade.CloverPit': AppCategory.games,                     // CloverPit
    'easy.launcher': AppCategory.neutral,                               // Easy Homescreen
    'com.wbd.stream': AppCategory.entertainment,                        // HBO Max: Stream TV & Movies
    'com.fundaygames.scritchyscratchy': AppCategory.games,              // Scritchy Scratchy
    'com.pdflauncher.forer.ciarip': AppCategory.neutral,                // PDF & Launcher for Android
    'com.roblox.client': AppCategory.games,                             // Roblox
    'com.MOBGames.PoppyMobileChap1': AppCategory.games,                 // Poppy Playtime Chapter 1
    'com.fastemulator.gba': AppCategory.games,                          // My Boy! - GBA Emulator
    'com.oakever.arrows': AppCategory.games,                            // Arrows GO!
    'com.scottgames.fivenightsatfreddys': AppCategory.games,            // Five Nights at Freddy's
    'com.block.juggle': AppCategory.games,                              // Block Blast!
    'com.mergegames.gossipharbor': AppCategory.games,                   // Gossip Harbor: Merge & Story
    'com.sofarsogood.incredibox': AppCategory.games,                    // Incredibox
    'com.netshort.abroad': AppCategory.entertainment,                   // NetShort - Popular Dramas & TV
    'com.crunchyroll.crunchyroid': AppCategory.entertainment,           // Crunchyroll: Anime Streaming
    'com.gamefirst.religioninc': AppCategory.games,                     // Religion Inc. God Simulator
    'com.dreamgames.royalkingdom': AppCategory.games,                   // Royal Kingdom
    'com.run.tower.defense': AppCategory.games,                         // Kingshot
    'com.tdr3.hs.android': AppCategory.neutral,                         // HotSchedules
    'com.whatnot_mobile': AppCategory.shopping,                         // Whatnot: Shop, Sell, Connect
    'com.QuanticBit.NeonValley': AppCategory.games,                     // Neon Valley [AMOLED]
    'com.ecffri.arrows': AppCategory.games,                             // Arrows – Puzzle Escape
    'com.anthropic.claude': AppCategory.neutral,                        // Claude by Anthropic
    'com.and.games505.TerrariaPaid': AppCategory.games,                 // Terraria
    'com.lemon.lvoverseas': AppCategory.neutral,                        // CapCut - Video Editor
    'com.tinder': AppCategory.socialMedia,                              // Tinder Dating App: Chat & Date
    'com.rockstargames.gtasa': AppCategory.games,                       // Grand Theft Auto: San Andreas
    'com.freecash.app2': AppCategory.entertainment,                     // Freecash: Earn Money
    'com.moonactive.coinmaster': AppCategory.games,                     // Coin Master
    'com.facer.pipboy_se': AppCategory.neutral,                         // Fallout Pip-Boy SE Watch Face
    'com.gof.global': AppCategory.games,                                // Whiteout Survival
    'com.MOBGames.PoppyMobileChap2': AppCategory.games,                 // Poppy Playtime Chapter 2
    'com.cbs.app': AppCategory.entertainment,                           // Paramount+
    'com.fulldive.extension.fullroid.pro': AppCategory.games,           // Pro Emulator for Game Consoles
    'com.pandora.android': AppCategory.neutral,                         // Pandora - Music & Podcasts
    'com.com2us.ootpbbgo27.android.google.global.normal': AppCategory.games, // OOTP Baseball 27 Go!
    'com.zzkko': AppCategory.shopping,                                  // SHEIN-Shopping Online
    'com.playrix.township': AppCategory.games,                          // Township
    'com.marmalade.monopoly': AppCategory.games,                        // MONOPOLY
    'com.squareup.cash': AppCategory.neutral,                           // Cash App
    'com.radio.pocketfm': AppCategory.neutral,                          // Pocket FM: Audio Series
    'com.scottgames.fnaf2': AppCategory.games,                          // Five Nights at Freddy's 2
    'com.seedleap.loopitapp': AppCategory.games,                        // Loopit - Make Playables
    'com.readygo.barrel.gp': AppCategory.games,                         // Last Z: Survival Shooter
    'com.pid.shotgunking': AppCategory.games,                           // Shotgun King
    'com.intuit.turbotax.mobile': AppCategory.neutral,                  // TurboTax: File Your Tax Return
    'com.disney.disneyplus': AppCategory.entertainment,                 // Disney+
    'net.dinglisch.android.taskerm': AppCategory.neutral,               // Tasker
    'tv.twitch.android.app': AppCategory.entertainment,                 // Twitch: Live Streaming
    'com.watchfacestudio.md339': AppCategory.neutral,                   // MD339 Digital watch face
    'com.newleaf.app.android.victor': AppCategory.entertainment,        // ReelShort - Stream Drama & TV
    'nz.co.codepoint.minimetro': AppCategory.games,                     // Mini Metro
    'com.superplaystudios.disneysolitairedreams': AppCategory.games,    // Disney Solitaire
    'net.peakgames.toonblast': AppCategory.games,                       // Toon Blast
    'air.com.flipline.papasfreezeriatogo': AppCategory.games,           // Papa's Freezeria To Go!
    'com.life360.android.safetymapd': AppCategory.neutral,              // Life360: Stay Connected & Safe
    'org.prowl.torque': AppCategory.neutral,                            // Torque Pro (OBD 2 & Car)
    'com.imageline.FLM': AppCategory.games,                             // FL Studio Mobile
    'com.facebook.orca': AppCategory.neutral,                           // Messenger
    'com.linkedin.android': AppCategory.neutral,                        // LinkedIn: Community & Network
    'com.xd.tabs.google': AppCategory.games,                            // TABS Pocket Edition
    'com.playdigious.deadcells.mobile': AppCategory.games,              // Dead Cells
    'com.loomgames.pixelflow': AppCategory.games,                       // Pixel Flow!
    'com.appslab.glass.widgets': AppCategory.neutral,                   // Glass Widgets
    'com.tubitv': AppCategory.entertainment,                            // Tubi: Free Movies & Live TV
    'co.hinge.app': AppCategory.socialMedia,                            // Hinge Dating App: Match & Date
    'com.FireproofStudios.TheRoom': AppCategory.games,                  // The Room
    'com.williamsinteractive.jackpotparty': AppCategory.games,          // Jackpot Party Casino Slots
    'com.llc3909.papersplease': AppCategory.games,                      // Papers, Please
    'com.moonactive.cmboard': AppCategory.games,                        // Coin Master - Board Adventure
    'com.topgamesinc.evony': AppCategory.games,                         // Evony: The King's Return
    'com.mobentertainment.PoppyPlaytimeChapter4': AppCategory.games,    // Poppy Playtime Chapter 4
    'app.jumpjumpvpn.jumpjumpvpn': AppCategory.neutral,                 // JumpJumpVPN: Fast & Secure
    'com.brotato.shooting.survivors.games.paid.android': AppCategory.games, // Brotato: Premium
    'com.sybogames.subway.surfers.game': AppCategory.games,             // Subway Surfers City
    'net.peakgames.match': AppCategory.games,                           // Match Factory!
    'com.MobEntertainment.PoppyPlaytimeChapter3': AppCategory.games,    // Poppy Playtime Chapter 3
    'air.com.buffalo_studios.newflashbingo': AppCategory.games,         // Bingo Blitz™️ - Bingo Games
    'com.SpottedGhosts.SpiritTalker': AppCategory.games,                // Spirit Talker ®
    'com.bumble.app': AppCategory.socialMedia,                          // Bumble Dating App: Meet & Date
    'com.sidekick.dwarves': AppCategory.games,                          // Dwarves: Glory, Death and Loot
    'com.mcdonalds.app': AppCategory.neutral,                           // McDonald's
    'com.g2labs.floatingsandboxmobile': AppCategory.games,              // Floating Sandbox
    'com.arrow.out': AppCategory.games,                                 // Arrow Out
    'com.totalbattle': AppCategory.games,                               // Total Battle: War Strategy
    'it.dbtecno.pizzaboygbapro': AppCategory.games,                     // Pizza Boy A Pro
    'com.nebula.mahjongtile': AppCategory.games,                        // Mahjong Blast
    'com.ninjakiwi.bloonstd5': AppCategory.games,                       // Bloons TD 5
    'com.newsbreak.crimeradar': AppCategory.neutral,                    // CrimeRadar: Dispatch Alerts
    'com.king.candycrushsodasaga': AppCategory.games,                   // Candy Crush Soda Saga
    'com.clickteam.ultimatecustomnight': AppCategory.games,             // Ultimate Custom Night
    'com.paypal.android.p2pmobile': AppCategory.shopping,               // PayPal - Pay, Send, Save
    'com.productmadness.cashmancasino': AppCategory.games,              // Cashman Casino Slots Games
    'org.mupen64plusae.v3.fzurita.pro': AppCategory.games,              // M64Plus FZ Pro Emulator
    'com.vitastudio.mahjong': AppCategory.games,                        // Vita Mahjong
    'com.productmadness.lightninglink': AppCategory.games,              // Lightning Link Casino Slots
    'com.jndapp.nothing.widgets.pack': AppCategory.neutral,             // Everything Widgets
    'ai.x.grok': AppCategory.neutral,                                   // Grok - AI Chat & Video
    'com.playrix.fishdomdd.gplay': AppCategory.games,                   // Fishdom
    'net.esword.esword': AppCategory.good,                              // e-Sword: Bible Study to Go
    'com.amazon.avod.thirdpartyclient': AppCategory.entertainment,      // Prime Video
    'it.rortos.realflightsimulator': AppCategory.games,                 // RFS - Real Flight Simulator
    'com.storage.androidcleaner': AppCategory.neutral,                  // Cleanup: Phone Storage Cleaner
    'com.microsoft.skydrive': AppCategory.good,                         // Microsoft OneDrive
    'com.edde746.plezy': AppCategory.entertainment,                     // Plezy for Plex
    'com.enflick.android.TextNow': AppCategory.neutral,                 // TextNow: Call + Text Unlimited
    'com.sonosaurus.tonalenergytuner': AppCategory.good,                // TonalEnergy Tuner & Metronome
    'com.playrix.homescapes': AppCategory.games,                        // Homescapes
    'com.scottgames.fnaf4': AppCategory.games,                          // Five Nights at Freddy's 4
    'com.google.android.apps.bard': AppCategory.neutral,                // Google Gemini
    'com.bamnetworks.mobile.android.gameday.atbat': AppCategory.entertainment, // MLB
    'com.unknownworlds.subnautica': AppCategory.games,                  // Subnautica
    'com.tencent.ig': AppCategory.games,                                // PUBG MOBILE
    'com.wakdev.nfctools.pro': AppCategory.neutral,                     // NFC Tools - Pro Edition
    'com.venmo': AppCategory.shopping,                                  // Venmo
    'tech.ula.ogtrail': AppCategory.games,                              // OG Trail - Travel to Oregon
    'fr.vinted': AppCategory.shopping,                                  // Vinted: Shop & sell pre-loved
    'com.fatmerge.global': AppCategory.games,                           // Tasty Travels: Merge Game
    'com.basevelocity.radarscope': AppCategory.neutral,                 // RadarScope
    'com.tmobile.tuesdays': AppCategory.neutral,                        // T-Life
    'com.activision.callofduty.shooter': AppCategory.games,             // Call of Duty®: Mobile
    'com.watchfacestudio.per27': AppCategory.neutral,                   // PER27 Digital Watch Face
    'com.dd.doordash': AppCategory.neutral,                             // DoorDash: Food, Grocery, More
    'com.thunderful.smbf': AppCategory.games,                           // Super Meat Boy Forever
    'com.roku.remote': AppCategory.entertainment,                       // The Roku App (Official)
    'com.superplaystudios.dicedreams': AppCategory.games,               // Dice Dreams™️
    'psplay.grill.com': AppCategory.games,                              // PXPlay: Remote Play
    'com.grindrapp.android': AppCategory.socialMedia,                   // Grindr - Gay Dating & Chat
    'com.samruston.buzzkill': AppCategory.good,                         // BuzzKill Notification Manager
    'com.phs.global': AppCategory.games,                                // Last Asylum: Plague
    'com.diamondlife.slots.vegas.free': AppCategory.games,              // Lotsa Slots - Casino Games
    'com.rockstargames.gtavc': AppCategory.games,                       // Grand Theft Auto: Vice City
    'com.storymatrix.drama': AppCategory.entertainment,                 // DramaBox - Stream Drama Shorts
    'com.AlfaOBD.AlfaOBD': AppCategory.neutral,                         // AlfaOBD
    'com.find.phone.device.locate.lostphone.android': AppCategory.neutral, // Find My Phone by Clap Launcher
    'com.playwithfurcifer.bpb.android': AppCategory.games,              // Backpack Battles
    'com.sei.android': AppCategory.neutral,                             // 7-Eleven: Rewards & Shopping
    'com.piratesoutlaws.fabledgame': AppCategory.games,                 // Pirates Outlaws
    'com.ubercab': AppCategory.neutral,                                 // Uber - Request a ride
    'com.homagames.studio.allinhole': AppCategory.games,                // All in Hole: Black Hole Games
    'com.nintendo.zasa': AppCategory.games,                             // Animal Crossing: Pocket Camp C
    'com.grandgames.magicsort': AppCategory.games,                      // Magic Sort!
    'com.doghowlgames.thronefall': AppCategory.games,                   // Thronefall
    'com.thehomedepot': AppCategory.neutral,                            // The Home Depot
    'com.devsisters.ck': AppCategory.games,                             // CookieRun: Kingdom
    'com.scottgames.fnaf3': AppCategory.games,                          // Five Nights at Freddy's 3
    'com.doordash.driverapp': AppCategory.neutral,                      // DoorDash - Dasher
    'com.canva.editor': AppCategory.neutral,                            // Canva: AI Photo & Video Editor
    'com.doghowlgames.pokeridler': AppCategory.games,                   // This Aint Even Poker, Ya Joker
    'air.com.vudu.air.DownloaderTablet': AppCategory.entertainment,     // Fandango at Home: Movies & TV
    'com.notdoppler.earntodie': AppCategory.games,                      // Earn to Die
    'com.pocket.sort.coin.puzzle.game': AppCategory.games,              // Pocket Sort: Coin Merge Puzzle
    'slots.pcg.casino.games.free.android': AppCategory.games,           // Cash Frenzy™ - Casino Slots
    'com.watchfacestudio.d355': AppCategory.neutral,                    // D355 Premium Watch Face
    'com.gc.teammanager': AppCategory.neutral,                          // GameChanger
    'com.watchfacestudio.per32': AppCategory.neutral,                   // PER32 Ultra Hybrit Watch Face
    'com.onedebit.chime': AppCategory.shopping,                         // Chime® – Fee-Free Banking
    'com.giantssoftware.fs23.google': AppCategory.games,                // Farming Simulator 23 Mobile
    'com.lucky.zootchi': AppCategory.entertainment,                     // Dootchi: Chat with AI Chars
    'io.randomco.travel': AppCategory.games,                            // Travel Town - Merge Adventure
    'com.watchfacestudio.md307digital': AppCategory.neutral,            // MD307 Digital watch face
    'io.voodoo.paper2': AppCategory.games,                              // Paper.io 2
    'com.global.ztmslg': AppCategory.games,                             // Puzzles & Survival
    'com.monashuniversity.fodmap': AppCategory.neutral,                 // Monash University FODMAP diet
    'com.cbs.ott': AppCategory.entertainment,                           // Paramount+
    'air.com.flipline.papaspizzeriatogo': AppCategory.games,            // Papa's Pizzeria To Go!
    'com.upside.consumer.android': AppCategory.neutral,                 // Upside: Gas & Food Cash Back
    'com.readygo.dark.gp': AppCategory.games,                           // Dark War Survival
    'com.halls.of.torment.paid.gp': AppCategory.games,                  // Halls of Torment: Premium
    'com.indeed.android.jobsearch': AppCategory.good,                   // Indeed Job Search
    'com.elf.koalasampler': AppCategory.neutral,                        // Koala Sampler
    'com.youmusic.magictiles': AppCategory.games,                       // Magic Tiles 3™ - Piano Game
    'com.playdigious.northgard': AppCategory.games,                     // Northgard
    'de.empfohlen': AppCategory.entertainment,                          // Testerup: Test & Earn Rewards
    'com.ballytechnologies.quickhitslots': AppCategory.games,           // Quick Hit Casino Slots Games
    'com.upallnitesoftware.walkoutsongdj': AppCategory.neutral,         // Walkout Song DJ
    'color.number.paint.pixle.art.sort.jigsaw': AppCategory.games,      // Jewel Coloring
    'com.hualai': AppCategory.neutral,                                  // Wyze - Make Your Home Smarter
    'com.scottgames.sisterlocation': AppCategory.games,                 // Five Nights at Freddy's: SL
    'jp.pokemon.pokemontcgp': AppCategory.games,                        // Pokémon TCG Pocket - Card Game
    'org.hempuli.baba': AppCategory.games,                              // Baba Is You
    'com.trueaxis.trueskate': AppCategory.games,                        // True Skate
    'pdf.pdfreader.viewer.editor.free': AppCategory.neutral,            // PDF Reader - PDF Viewer
    'com.productmadness.hovmobile': AppCategory.games,                  // Slots: Heart of Vegas Casino
    'com.zubersoft.mobilesheetspro': AppCategory.neutral,               // MobileSheets
    'com.cleansweep.plus': AppCategory.neutral,                         // Clean Sweep Plus
    'com.miHoYo.GenshinImpact': AppCategory.games,                      // Genshin Impact
    'com.watchfacestudio.md326': AppCategory.neutral,                   // MD326 3D Modern Watch Face
    'com.tfgco.apps.coloring.free.color.by.number': AppCategory.games,  // Color by Number：Coloring Games
    'com.adobe.reader': AppCategory.neutral,                            // Adobe Acrobat Reader: Edit PDF
    'com.goblintools': AppCategory.games,                               // Goblin Tools
    'com.microsoft.office.word': AppCategory.neutral,                   // Microsoft Word: Edit Documents
    'com.plarium.raidlegends': AppCategory.games,                       // RAID: Shadow Legends
    'com.atari.mobile.rctclassic': AppCategory.games,                   // RollerCoaster Tycoon® Classic
    'com.gamma.scan': AppCategory.neutral,                              // QR & Barcode Scanner
    'com.nordvpn.android': AppCategory.neutral,                         // NordVPN – fast VPN for privacy
    'com.avalonuk.taskmaster': AppCategory.games,                       // Taskmaster The App
    'com.codeway.aitutor': AppCategory.good,                            // Learn English, Spanish: Learna
    'com.newreading.goodreels': AppCategory.entertainment,              // GoodShort - Short Dramas Hub
    'de.twokit.video.tv.cast.browser.lg.pro': AppCategory.neutral,      // TV Cast Pro for LG webOS
    'com.phonestorage.cleanup': AppCategory.neutral,                    // Phone Storage Clean
    'com.strayfawnstudio.dungeonclawlermobile': AppCategory.games,      // Dungeon Clawler
    'com.ebay.mobile': AppCategory.shopping,                            // eBay online shopping & selling
    'com.merge.cooking.theme.restaurant.food': AppCategory.games,       // Merge Cooking®
    'com.clickteam.freddyfazbearspizzeriasimulator': AppCategory.games, // FNaF 6: Pizzeria Simulator
    'com.gooddrama.idrama': AppCategory.entertainment,                  // iDrama – Short Dramas & Reels
    'com.ea.game.starwarscapital_row': AppCategory.games,               // Star Wars™: Galaxy of Heroes
    'com.recreative.recreative31': AppCategory.neutral,                 // Minimal - Classic - RE31
    'com.shopify.arrive': AppCategory.shopping,                         // Shop: All your favorite brands
    'com.MontanaGames.LowridersComebackBlvrd': AppCategory.games,       // Lowriders Comeback: Boulevard
    'com.facebook.lite': AppCategory.socialMedia,                       // Facebook Lite
    'net.supertreat.solitaire': AppCategory.games,                      // Solitaire Grand Harvest
    'com.kleientertainment.doNotStarvePocket': AppCategory.games,       // Don't Starve: Pocket Edition
    'io.supercent.linkedcubic': AppCategory.games,                      // Snake Clash!
    'com.nexon.ma': AppCategory.games,                                  // MapleStory : Idle RPG
    'com.pgp.bybb01': AppCategory.games,                                // Backyard Baseball '01
    'com.cleanertool.box': AppCategory.games,                           // Cleaner Toolbox
    'sg.bigo.live': AppCategory.games,                                  // Bigo Live - Live Streaming App
    'com.infinity.traffix': AppCategory.games,                          // Traffix: Traffic Simulator
    'com.studio27.MelonPlayground': AppCategory.games,                  // Melon Sandbox
    'com.joycastle.mergematch': AppCategory.games,                      // Matching Story - Puzzle Games
    'ch.threema.app': AppCategory.neutral,                              // Threema. The Secure Messenger
    'com.ss.android.ttmd.video': AppCategory.entertainment,             // PineDrama
    'com.greenmushroom.boomblitz.gp': AppCategory.games,                // Top Heroes: Kingdom Saga
    'com.marmalade.gol2': AppCategory.games,                            // The Game of Life 2
    'com.onefinance.one': AppCategory.neutral,                          // OnePay – Mobile Banking
    'onxmaps.hunt': AppCategory.games,                                  // onX Hunt: Offline Hunting Maps
    'com.fastemulator.gbc': AppCategory.games,                          // My OldBoy! - GBC Emulator
    'dev.vodik7.tvquickactions': AppCategory.neutral                    // tvQuickActions Pro
  };
}

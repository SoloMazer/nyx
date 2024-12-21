{ inputs, ... }: {

   home.file = {
     ".mozilla/firefox/SoloMazer/user.js".source = ./user.js;
   };

   programs.firefox = {
      enable = true;
      profiles.SoloMazer = {
         extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
           ublock-origin
           darkreader
           sponsorblock  
           surfingkeys
           proton-pass
           proton-vpn
           facebook-container
           multi-account-containers
           side-view
         ];
         search = {
            force = true;
            default = "Google";
            order = [ "Google" "Searxng" ];
            engines = {
               "Nix Packages" = {
                  urls = [{
                  template = "https://search.nixos.org/packages";
                  params = [
                     { name = "type"; value = "packages"; }
                     { name = "query"; value = "{searchTerms}"; }
                  ];
                  }];
                  definedAliases = [ "@np" ];
               };
               "NixOS Wiki" = {
                  urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                  definedAliases = [ "@nw" ];
               };
               "Searxng" = {
                  urls = [{ template = "https://searxng.site/"; }];
                  definedAliases = [ "@sng" ];
               };
               "Bing".metaData.hidden = true;
               "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
            };
         };

         
         # # Declare your settings from about:config
         # # My settings are inspired from betterfox
         # settings = {
         #
         #    # NOTE: section = fastFox
         #    # General
         #    "content.notify.interval"= 100000;
         #    # GFX
         #    "gfx.canvas.accelerated.cache-items"= 4096;
         #    "gfx.canvas.accelerated.cache-size"= 512;
         #    "gfx.content.skia-font-cache-size"= 20;
         #    # Disk Cache
         #    "browser.cache.jsbc_compression_level"= 3;
         #    # Media Cache
         #    "media.memory_cache_max_size"= 65536;
         #    "media.cache_readahead_limit"= 7200;
         #    "media.cache_resume_threshold"= 3600;
         #    # Image Cache
         #    "image.mem.decode_bytes_at_a_time"= 32768;
         #    # Network
         #    "network.http.max-connections"= 1800;
         #    "network.http.max-persistent-connections-per-server"= 10;
         #    "network.http.max-urgent-start-excessive-connections-per-host"= 5;
         #    "network.http.pacing.requests.enabled"= false;
         #    "network.dnsCacheExpiration"= 3600;
         #    "network.ssl_tokens_cache_capacity"= 10240;
         #    #Speculative Loading
         #    "network.dns.disablePrefetch"= true;
         #    "network.dns.disablePrefetchFromHTTPS"= true;
         #    "network.prefetch-next"= false;
         #    "network.predictor.enabled"= false;
         #    "network.predictor.enable-prefetch"= false;
         #    #Experimental
         #    "layout.css.grid-template-masonry-value.enabled"= true;
         #    "dom.enable_web_task_scheduling"= true;
         #    "dom.security.sanitizer.enabled"= true;
         #
         #    # NOTE: section = secureFox
         #    # Tracking Protection
         #    "browser.contentblocking.category"= "strict";
         #    "urlclassifier.trackingSkipURLs"= "*.reddit.com";
         #    "urlclassifier.features.socialtracking.skipURLs"= "*.instagram.com,";
         #    "network.cookie.sameSite.noneRequiresSecure"= true;
         #    "browser.download.start_downloads_in_tmp_dir"= true;
         #    "browser.helperApps.deleteTempFileOnExit"= true;
         #    "browser.uitour.enabled"= false;
         #    "privacy.globalprivacycontrol.enabled"= true;
         #    # OCSP & CERTS / HPKP
         #    "security.OCSP.enabled"= 0;
         #    "security.remote_settings.crlite_filters.enabled"= true;
         #    "security.pki.crlite_mode"= 2;
         #    # SSL / TLS 
         #    "security.ssl.treat_unsafe_negotiation_as_broken"= true;
         #    "browser.xul.error_pages.expert_bad_cert"= true;
         #    "security.tls.enable_0rtt_data"= false;
         #    # DISK AVOIDANCE 
         #    "browser.privatebrowsing.forceMediaMemoryCache"= true;
         #    "browser.sessionstore.interval"= 60000;
         #    # SHUTDOWN & SANITIZING
         #    "privacy.history.custom"= true;
         #    # SEARCH / URL BAR 
         #    "browser.search.separatePrivateDefault.ui.enabled"= true;
         #    "browser.urlbar.update2.engineAliasRefresh"= true;
         #    "browser.search.suggest.enabled"= false;
         #    "browser.urlbar.suggest.quicksuggest.sponsored"= false;
         #    "browser.urlbar.suggest.quicksuggest.nonsponsored"= false;
         #    "browser.formfill.enable"= false;
         #    "security.insecure_connection_text.enabled"= true;
         #    "security.insecure_connection_text.pbmode.enabled"= true;
         #    "network.IDN_show_punycode"= true;
         #    # HTTPS-FIRST POLICY 
         #    "dom.security.https_first"= true;
         #    "dom.security.https_first_schemeless"= true;
         #    # PASSWORDS 
         #    "signon.formlessCapture.enabled"= false;
         #    "signon.privateBrowsingCapture.enabled"= false;
         #    "network.auth.subresource-http-auth-allow"= 1;
         #    "editor.truncate_user_pastes"= false;
         #    # MIXED CONTENT + CROSS-SITE
         #    "security.mixed_content.block_display_content"= true;
         #    "security.mixed_content.upgrade_display_content"= true;
         #    "security.mixed_content.upgrade_display_content.image"= true;
         #    "pdfjs.enableScripting"= false;
         #    "extensions.postDownloadThirdPartyPrompt"= false;
         #    # HEADERS / REFERERS 
         #    "network.http.referer.XOriginTrimmingPolicy"= 2;
         #    # CONTAINERS 
         #    "privacy.userContext.ui.enabled"= true;
         #    # WEBRTC 
         #    "media.peerconnection.ice.proxy_only_if_behind_proxy"= true;
         #    "media.peerconnection.ice.default_address_only"= true;
         #    # SAFE BROWSING
         #    "browser.safebrowsing.downloads.remote.enabled"= false;
         #    # MOZILLA
         #    "permissions.default.desktop-notification"= 2;
         #    "permissions.default.geo"= 2;
         #    "geo.provider.network.url"= "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
         #    "permissions.manager.defaultsUrl"= "";
         #    "webchannel.allowObject.urlWhitelist"= "";
         #    # TELEMETRY 
         #    "datareporting.policy.dataSubmissionEnabled"= false;
         #    "datareporting.healthreport.uploadEnabled"= false;
         #    "toolkit.telemetry.unified"= false;
         #    "toolkit.telemetry.enabled"= false;
         #    "toolkit.telemetry.server"= "data:,";
         #    "toolkit.telemetry.archive.enabled"= false;
         #    "toolkit.telemetry.newProfilePing.enabled"= false;
         #    "toolkit.telemetry.shutdownPingSender.enabled"= false;
         #    "toolkit.telemetry.updatePing.enabled"= false;
         #    "toolkit.telemetry.bhrPing.enabled"= false;
         #    "toolkit.telemetry.firstShutdownPing.enabled"= false;
         #    "toolkit.telemetry.coverage.opt-out"= true;
         #    "toolkit.coverage.opt-out"= true;
         #    "toolkit.coverage.endpoint.base"= "";
         #    "browser.newtabpage.activity-stream.feeds.telemetry"= false;
         #    "browser.newtabpage.activity-stream.telemetry"= false;
         #    # EXPERIMENTS
         #    "app.shield.optoutstudies.enabled"= false;
         #    "app.normandy.enabled"= false;
         #    "app.normandy.api_url"= "";
         #    # CRASH REPORTS
         #    "breakpad.reportURL" = "";
         #    "browser.tabs.crashReporting.sendReport" = false;
         #    "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
         #    # DETECTION
         #    "captivedetect.canonicalURL" = "";
         #    "network.captive-portal-service.enabled" = false;
         #    "network.connectivity-service.enabled" = false;
         #
         #    #NOTE: section = peskyFox
         #    # MOZILLA UI
         #    "browser.privatebrowsing.vpnpromourl"= "";
         #    "extensions.getAddons.showPane"= false;
         #    "extensions.htmlaboutaddons.recommendations.enabled"= false;
         #    "browser.discovery.enabled"= false;
         #    "browser.shell.checkDefaultBrowser"= false;
         #    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons"= false;
         #    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features"= false;
         #    "browser.preferences.moreFromMozilla"= false;
         #    "browser.tabs.tabmanager.enabled"= false;
         #    "browser.aboutConfig.showWarning"= false;
         #    "browser.aboutwelcome.enabled"= false;
         #    # THEME ADJUSTMENTS
         #    "toolkit.legacyUserProfileCustomizations.stylesheets"= true;
         #    "browser.compactmode.show"= true;
         #    "browser.display.focus_ring_on_anything"= true;
         #    "browser.display.focus_ring_style"= 0;
         #    "browser.display.focus_ring_width"= 0;
         #    "layout.css.prefers-color-scheme.content-override"= 2;
         #    "browser.privateWindowSeparation.enabled"= false; 
         #    # COOKIE BANNER HANDLING 
         #    "cookiebanners.service.mode"= 1;
         #    "cookiebanners.service.mode.privateBrowsing"= 1;
         #    # FULLSCREEN NOTICE
         #    "full-screen-api.transition-duration.enter"= "0 0";
         #    "full-screen-api.transition-duration.leave"= "0 0";
         #    "full-screen-api.warning.delay"= -1;
         #    "full-screen-api.warning.timeout"= 0;
         #    # URL BAR
         #    "browser.urlbar.suggest.calculator"= true;
         #    "browser.urlbar.unitConversion.enabled"= true;
         #    "browser.urlbar.trending.featureGate"= false;
         #    # NEW TAB PAGE
         #    "browser.newtabpage.activity-stream.feeds.topsites"= false;
         #    "browser.newtabpage.activity-stream.feeds.section.topstories"= false;
         #    # POCKET 
         #    "extensions.pocket.enabled"= false;
         #    # DOWNLOADS
         #    "browser.download.always_ask_before_handling_new_types"= true;
         #    "browser.download.manager.addToRecentDocs"= false;
         #    # PDF
         #    "browser.download.open_pdf_attachments_inline"= true;
         #    # TAB BEHAVIOR
         #    "browser.bookmarks.openInTabClosesMenu"= false;
         #    "browser.menu.showViewImageInfo"= true;
         #    "findbar.highlightAll"= true;
         #    "layout.word_select.eat_space_to_next_word"= false;
         #
         #  };

            # userChrome = '' 
            #    *,
            #    *::before,
            #    *::after {
            #       font-family: Cantarell, monospace, monospace;
            #    }
            #    #alltabs-button,
            #    .titlebar-buttonbox-container,
            #    #page-action-buttons,
            #    #tracking-protection-icon-container,
            #    #identity-box {
            #       display: none;
            #    }
            #    #titlebar {
            #       z-index: 2;
            #       background-color: var(--toolbar-bgcolor) !important;
            #    }
            #    #nav-bar {
            #       position: fixed !important;
            #       top: 0;
            #       left: 25%;
            #       right: 25%;
            #       z-index: 1;
            #       transition: top 0.3s cubic-bezier(0.270, 0.910, 0.435, 1.280), opacity 0.1s ease !important;
            #       border-top: none !important;
            #       border-radius: 10px !important;
            #       border: 1px solid var(--tab-selected-bgcolor) !important;
            #       opacity: 0;
            #    }
            #    @media (-moz-bool-pref: "animatedFox.adaptiveTabBarColourSupport") {
            #       #nav-bar {
            #          background-color: var(--tabpanel-background-color) !important;
            #       }
            #    }
            #    #navigator-toolbox {
            #       border-bottom: none !important;
            #    }
            #    #tabs-newtab-button {
            #       opacity: 0;
            #       transition: 0.2s opacity ease;
            #    }
            #    #navigator-toolbox:not(:hover, :focus-within, :has([open])) #nav-bar {
            #       transition-delay: 0.2s !important;
            #    }
            #    #navigator-toolbox:is(:hover, :focus-within, :has([open])) {
            #       #nav-bar {
            #          top: 3.5rem;
            #          opacity: 1;
            #       }
            #       #tabs-newtab-button {
            #          opacity: 1;
            #       }
            #    }
            #    .tab-background {
            #       box-shadow: none !important;
            #       border-radius: 10px !important;
            #    }
            #    .tab-close-button {
            #       display: none;
            #    }
            #    .tabbrowser-tab {
            #       transition: min-width 0.3s cubic-bezier(0.270, 0.910, 0.435, 1.280), max-width 0.3s cubic-bezier(0.270, 0.910, 0.435, 1.280) !important;
            #       &[fadein]:not([pinned]) {
            #          max-width: 175px !important;
            #       }
            #       &[selected]:not([pinned]) {
            #          min-width: 250px !important;
            #          max-width: 250px !important;
            #       }
            #    }
            #    #urlbar-background {
            #       border-radius: 10px !important;
            #    }
            #    .urlbarView-url {
            #       color: var(--toolbar-color) !important;
            #    }
            #    #tabbrowser-arrowscrollbox {
            #       min-width: 100vw !important;
            #    }
            #    @media (-moz-bool-pref: "animatedFox.centeredTabs") {
            #       #tabbrowser-arrowscrollbox:not([overflowing]) {
            #          --uc-flex-justify: center;
            #       }
            #       scrollbox[orient="horizontal"] {
            #          justify-content: var(--uc-flex-justify, initial);
            #       }
            #    }
            # '';
      };
   };
}


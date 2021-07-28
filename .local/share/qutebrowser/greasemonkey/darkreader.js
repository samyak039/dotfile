// ==UserScript==
// @name            Dark Reader (Unofficial)
// @icon            https://darkreader.org/images/darkreader-icon-256x256.png
// @namespace       DarkReader
// @description	    Inverts the brightness of pages to reduce eye strain
// @version         4.9.17
// @author          https://github.com/darkreader/darkreader#contributors
// @homepageURL     https://darkreader.org/ | https://github.com/darkreader/darkreader
// @run-at          document-end
// @grant           none
// @require         https://cdn.jsdelivr.net/npm/darkreader/darkreader.min.js
// @noframes

// @include         *

// @exclude         /^https?://.*animetosho\.org/?/
// @exclude         /^https?://.*distrowatch\.com/?/
// @exclude         /^https?://.*duckduckgo\.com/?/
// @exclude         /^https?://.*calendar\.google\.com/?/
// @exclude         /^https?://.*classroom\.google\.com/?/
// @exclude         /^https?://.*docs\.google\.com/?/
// @exclude         /^https?://.*firebase\.google\.com/?/
// @exclude         /^https?://.*meet\.google\.com/?/
// @exclude         /^https?://.*gsmarena\.com/?/
// @exclude         /^https?://.*monkey-type\.com/?/
// @exclude         /^https?://.*onlinegdb\.com/?/
// @exclude         /^https?://.*reddit\.com/?/
// @exclude         /^https?://.*time\.is/?/
// @exclude         /^https?://.*youtube\.com/?/

// ==/UserScript==

DarkReader.enable({
    mode: 1,
	brightness: 105,
	contrast: 100,
    grayscale: 0,
	sepia: 0,
    engine: 'dynamicTheme',
    stylesheet: '',
    darkSchemeBackgroundColor: '#282828',
    //darkSchemeTextColor: '#fbf1c7',
    lightSchemeBackgroundColor: '#ebdbb2',
    //lightSchemeTextColor: '#282828',
    scrollbarColor: 'auto',
    selectionColor: 'auto',
    styleSystemColors: true,
});

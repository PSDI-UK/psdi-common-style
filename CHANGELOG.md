# Changelog for PSDI Common Style project

## v0.6.0

### New and Changed functionality

- Split the links in the brand in the header, so that the PSDI logo will link to the PSDI home page, and the site title
  will link to the site homepage. Renamed `setBrandLinkTarget` function to `setTitleLinkTarget` to reflect this change,
  but kept the previous name so as not to break backwards compatibility

## v0.5.0

### New and Changed functionality

- Deploys assets live, but not in releases, in `store/`, starting with resource catalogue

## v0.4.1

### Bugfixes

- Fixed bug with incorrect default location for HTML assets

### Miscellaneous Changes

- Set up .gitattributes to hide files we don't want appearing in release tarballs

## v0.4.0

### New and Changed Functionality

- Added JavaScript functions to `psdi-common.js`, `setHeaderSource` and `setFooterSource`, to set the location of the header and footer on a per-file basis
- Added configuration option in `fetch-common-style.sh`, `FORCE_OVERWRITE`, which will force the fetch script and copy scripts it calls to overwrite any files that already exist in target destinations

### Bugfixes

- Fixed bug where brand link and title deliberately set in the header would be overwritten by defaults in the JS code

## v0.3.0

### New and Changed Functionality

- Added configuration option in `fetch-common-style.sh`, `HTML_LOC`, which sets the location to load common header and footer from, and functionality in the scripts to support this

## v0.2.7

### Bugfixes

- Fixed bug in CSS which was incorrectly removing list styling globally

## v0.2.6

### Bugfixes

- Fixed background color of selected options

## v0.2.5

### New and Changed Functionality

- Added Verdana as a possible font ahead of Arial

### Bugfixes

- Fixed bug where options selected in a select box would appear to lose their selection after focus is lost

## v0.2.4

### Bugfixes

- Fixed bug where header and footer were still being loaded from css-template project instead of this one

## v0.2.3

### Bugfixes

- Fixed bug where page cover wouldn't be hidded if neither the header nor footer needed to be loaded remotely

## v0.2.2

### New and Changed Functionality

- Added extra specifier for ul declaration in common CSS, so it'll take precedence in the WP site

### Bugfixes

- Fixed bug which occurred in common scripts when header stub wasn't present on a page, which prevented footer from being loaded

## v0.2.1

### New and Changed Functionality

- Changed behavior of `scripts/copy_dir.sh` when a target file already exists to exit with a warning instead of a failure. This is a common occurence in rebuilds, and shouldn't trigger an error

### Bugfixes

- Fixed inconsistent changing of directory in `fetch-common-style.sh`
- Fixed not using default BASE_TARGET_DIR in `fetch-common-style.conf`

### Miscellaneous Changes

- Misc. formatting changes

## v0.2.0

- First feature-complete release

### New and Changed Functionality

- Added script `fetch-common-style.sh` and its configuration file `fetch-common-style.conf` which can be copied to other projects to assist in retrieving assets from this project
- Added ability to set the site title of the common HTML header in `scripts/copy_html.sh`
- Default image locations in `html/psdi-common-header` and `html/psdi-common-footer` updated to use the live images deployed by this project

### Bugfixes

- Reworked logic in `js/psdi-common.js` for loading elements so that elements which already have children won't be overwritten, and to better ensure that the page-loading cover is removed at the correct time

### Documentation Changes

- README.md completed for current version of project
- CHANGELOG.md added
- Improved commenting for `js/psdi-common.js`

### Miscellaneous Changes

- Updated `.gitignore` to include files created while testing this project

## v0.1.0

- Forked from css-template project
- Initial pre-release for the purpose of testing scripts to download releases

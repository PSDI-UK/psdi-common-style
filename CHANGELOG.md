# Changelog for PSDI Common Style project

## v0.2.0

* First feature-complete release

### New and Changed Functionality

* Added script `fetch-common-style.sh` and its configuration file `fetch-common-style.conf` which can be copied to other projects to assist in retrieving assets from this project
* Added ability to set the site title of the common HTML header in `scripts/copy_html.sh`
* Default image locations in `html/psdi-common-header` and `html/psdi-common-footer` updated to use the live images deployed by this project

### Bugfixes

* Reworked logic in `js/psdi-common.js` for loading elements so that elements which already have children won't be overwritten, and to better ensure that the page-loading cover is removed at the correct time

### Documentation Changes

* README.md completed for current version of project
* CHANGELOG.md added
* Improved commenting for `js/psdi-common.js`

### Miscellaneous Changes

* Updated `.gitignore` to include files created while testing this project

## v0.1.0

* Forked from css-template project
* Initial pre-release for the purpose of testing scripts to download releases
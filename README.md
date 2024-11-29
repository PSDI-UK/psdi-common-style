# PSDI Common Style

This project provides common resources to help provide a consistent style across PSDI websites. The contents of this project are are deployed live at https://psdi-uk.github.io/psdi-common-style/, and can be imported by other projects to use the PSDI style and elements.

## Contributors

- Bryan Gillis (coding)
- Cerys Willoughby (design)

## Provided Resources

### Images

**Deployed at:** https://psdi-uk.github.io/psdi-common-style/img/

This folder contains various images used in the common PSDI header and footer, including a favicon, PSDI and UKRI logos, and icons for social links. Most of the images are linked in the header and footer elements, with the exception of the favicon, which needs to be linked in the header of each HTML file with a line such as:

```HTML
<link rel="icon" type="image/x-icon" href="https://psdi-uk.github.io/psdi-common-style/css/psdi-icon-dark.svg">
```

### Stylesheet

**Deployed at:** https://psdi-uk.github.io/psdi-common-style/css/psdi-common.css

A common CSS stylesheet which can be used for PSDI sites. If no extra styling is required, it can be used directly in the HTML header of a webpage through adding the following line to the header:

```HTML
<link rel="stylesheet" href="https://psdi-uk.github.io/psdi-common-style/css/psdi-common.css">
```

Alternatively, it can be imported at the top of a CSS stylesheet which provides further custom styling with the following command, placed at the top of the file:

```CSS
@import url("https://psdi-uk.github.io/psdi-common-style/css/psdi-common.css");
```

### Scripts

**Deployed at:** https://psdi-uk.github.io/psdi-common-style/js/psdi-common.js

This file provides JavaScript functions used to handle AJAX loading of the common header and footer, plus the code for the light-mode/dark-mode toggle button in the common header.

### HTML Elements

#### Common Footer

**Deployed at:** https://psdi-uk.github.io/psdi-common-style/html/psdi-common-footer.html

This file provides the HTML for the common footer on PSDI sites, which can be loaded into a page via AJAX scripting or incorporated directly through the site's builder (implementation details will differ depending on the builder used). For proper formatting, it must be loaded into or put within an element of the form:

```HTML
<footer class="footer" id="psdi-footer"></footer>
```

#### Common Header

**Deployed at:** https://psdi-uk.github.io/psdi-common-style/html/psdi-common-header.html

This file provides the HTML for the common header on PSDI sites, which can be loaded into a page via AJAX scripting or incorporated directly through the site's builder (implementation details will differ depending on the builder used). For proper formatting, it must be loaded into or put within an element of the form:

```HTML
<header class="header" id="psdi-header"></header>
```

The header is customisable for each site, and at minimum, the site title will need to be set for it. If the header is loaded through AJAX scripting, this can be done through a script such as the following somewhere on the page (ideally immediately after the header element):

```HTML
<script type="module">
import { setTitle,setBrandLinkTarget, setHeaderLinksSource } from
    "https://psdi-uk.github.io/psdi-common-style/js/psdi-common.js";
setTitle("Site Title");
setBrandLinkTarget("./");
setHeaderLinksSource("./header-links.html");
</script>
```

Let's explain each of these functions:

* `setTitle()`

This determines the text that will appear in the header, identifying the website (the whole site, not the specific page). If this function is not called, the text will be blank.

* `setBrandLinkTarget()`

This sets the target that the PSDI brand in the header (including site title) will link to. By default, this is "./", which will link to an "index.html" page in the same directory as this file. If this default is fine, this function does not need to be called. If not (e.g. if the site's homepage is in a different directory), it must be called to set the proper address.

* `setHeaderLinksSource()`

This sets the location of an html file which should contain a list of links which you wish to appear in the top-right of the header, typically linking to different pages within the site. The content of this file should look something like:

```HTML
<a href="./index.html" class="navbar__item navbar__link">Home</a>
<a href="./page-one.html" class="navbar__item navbar__link">Page One</a>
<a href="./page-two.html" class="navbar__item navbar__link">Page Two</a>
```

The default source is "./header-links.html", which is relative to the location of the individual file (not the root of the site). If this is fine, you can create a "header-links.html" file and place it in the same directory as the other ".html" files, and this function call can be removed.

It is possible for different pages within the same site to each link to different files for their header links, for instance if they use relative links and some files are in different directories. This can be done without this function call if you place a different "header-links.html" file in each directory.

Some situations in which you might need to call this function are:

* You wish to put the header links in a file with a different name
* You wish for the header links to differ between different pages in the same directory
* It is not possible or convenient to put a "header-links.html" file alongside a page (e.g. if the page needs to be built and placed in a directory which doesn't yet exist)

## Dependent Projects

The following projects use public resources deployed by this project, and should be tested before any changes are made live to ensure no bugs are introduced:

TODO: Update once other projects migrate to using this new project

## Testing

In order to allow testing of changes to the deployed assets of this project without risk of breaking something, the recommended procedure is to deploy the changes in a fork in the user's namespace. The recommended procedure for testing is:

1. Prepare all changes in a feature branch.
2. When ready, push the feature branch to the fork, and merge it into the `main` branch of the fork. If this is the first time setting up the fork, you will need to manually enable GitHub Pages and the deployment workflow for it, then trigger the workflow
3. Wait for the GitHub Actions job on the fork has completed and the changes to be live
4. For each dependent project in [the list above](#dependent-projects) (ideally all of them, but at minimum test on one which uses all changed elements):
    1. Pull the most recent version of its `main` branch locally
    2. If desired, create a temporary branch for testing any changes
    3. Do a global find-and-replace in the project of "psdi-uk.github.io/css-template" to "brgillis.github.io/css-template"
    4. Save all changed files, and do a clean local build of the project
    5. Check the built site locally and ensure that all components provided by this project are working correctly
    6. If any issues are found, correct them, wait for redeployment, and repeat until checks pass for all dependent projects
5. Once all checks pass, clean up any changes to projects you were testing with (reset if you didn't commit anything, or if on a branch, switch back to the main branch and discard the testing branch), open a pull request to merge the `main` branch of the fork into the `main` branch of the origin project
6. Undertake standard checks for a PR, and once it's passed, the branch can be merged
7. Clean up, including pushing the new state of the origin project to the fork

## Copyright and License

Copyright (c) PSDI Organisation, Bryan Gillis 2024

Official license is awaiting the development of an official PSDI licensing policy.
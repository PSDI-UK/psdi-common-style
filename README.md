# CSS Template

This project provides common resources to help provide a consistent style across PSDI websites. The contents of the "public/" directory are deployed at https://psdi-uk.github.io/css-template/, and can be imported by other projects to use the PSDI style and elements.

## Contributors

- Bryan Gillis (coding)
- Cerys Willoughby (design)

## Provided Resources

### Webpages

The following pages are deployed to help demonstrate the PSDI style:

#### Mockup

**Deployed at:** https://psdi-uk.github.io/css-template/index.html

This page demonstrates what the PSDI style looks like, and includes various page elements to show how they appear in
the style.

#### Static Template

**Deployed at:** https://psdi-uk.github.io/css-template/template.html

This is a template which can be copied to other projects to make static HTML pages. The source code of it includes various TODO notes in comments to guide the user through parts they need to edit to customise the page.

#### AJAX Template

**Deployed at:** https://psdi-uk.github.io/css-template/ajax.html

This is a template similar to the above, except it uses AJAX scripting to remotely load the common PSDI header and footer rather than copying them. This incurs a slight cost in loading time, but the resulting page will automatically inherit any updates to the header and footer without needing to be manually updated. This is deployed alongside the static template so that the additional loading time be observed.

### Other Files

#### Images

**Deployed at:** https://psdi-uk.github.io/css-template/images

This folder contains various images used in the common PSDI header and footer, including a favicon, PSDI and UKRI logos, and icons for social links. If either of the above templates is used, they will include references to these images, and no manual handling of them will be needed (unless e.g. an extra instance of one of the logos somewhere on the page is desired).

### Stylesheet

**Deployed at:** https://psdi-uk.github.io/css-template/psdi-common.css

A common CSS stylesheet which can be used for PSDI sites. If no extra styling is required, it can be used directly in the HTML header of a webpage. Alternatively, it can be imported at the top of a CSS stylesheet which provides further custom styling with the command, placed at the top of the file:

```CSS
@import url("https://psdi-uk.github.io/css-template/psdi-common.css");
```

### Scripts

**Deployed at:** https://psdi-uk.github.io/css-template/psdi-common.js

This file provides JavaScript functions used to handle AJAX loading of the common header and footer, plus the code for the light-mode/dark-mode toggle button in the common header.

### Common Footer

**Deployed at:** https://psdi-uk.github.io/css-template/psdi-common-footer.html

This file provides the HTML for the common footer on PSDI sites, which can be loaded into a page via AJAX scripting. For proper formatting, it must be loaded into an element of the form:

```HTML
<footer class="footer" id="psdi-footer"></footer>
```

#### Common Header

**Deployed at:** https://psdi-uk.github.io/css-template/psdi-common-header.html

This file provides the HTML for the common header on PSDI sites, which can be loaded into a page via AJAX scripting. For proper formatting, it must be loaded into an element of the form:

```HTML
<header class="header" id="psdi-header"></header>
```

The header is customisable for each site, and at minimum, the site title will need to be set for it. This can be done through a script such as the following somewhere on the page (ideally immediately after the header element):

```HTML
<script type="module">
import { setTitle,setBrandLinkTarget, setHeaderLinksSource } from
    "https://psdi-uk.github.io/css-template/psdi-common.js";
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

* [PSDI Data Conversion](https://github.com/PSDI-UK/psdi-data-conversion)

## Copyright and License

Copyright (c) PSDI Organisation, Bryan Gillis 2024

Official license is awaiting the development of an official PSDI licensing policy.
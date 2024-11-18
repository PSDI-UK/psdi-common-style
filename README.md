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

...

## Copyright and License

Copyright (c) PSDI Organisation, Bryan Gillis 2024

Official license is awaiting the development of an official PSDI licensing policy.
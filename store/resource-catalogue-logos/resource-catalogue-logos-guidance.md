# Naming conventions for resource catalogue logos
This folder contains images which are displayed in the PSDI Resource catalogue (at http://resources.psdi.ac.uk).
The mapping of which logos correspond to which resources is given in https://psdi-uk.github.io/metadata/resource-catalogue/psdi-dcat.jsonld (in the "psdiDcatExt:logoURL" fields).

## File guidance
While the majority of common images formats are fine, I would suggest a preference in favour of svg and png in order to avoid potential blurriness. For the size I would recommend that for non svg images they should ideally be at least 200px wide or at least 120px in height but as the resource theme pages can display larger images, logos for these should instead be at least 400px wide or at least 240px in height. The aspect ratio is flexible but should be within these constraints and will likely look better as either a square or rectangular with the width greater than the height. As file size I would recommend keeping them under 150KB to avoid the potential of long load times for users.

Preferences
* Format: svg, png, jpeg, webp, avif
* File dimensions (for formats other than svg):
    - Minimum width: 200px (400px for resource themes)
    - Minimum height: 120px (240px for resource themes)
    - Width >= Height
* Maximum file size: 150KB

## Naming conventions
These are just suggestions to keep this folder tidy and make it obvious which logos are for which resources. 
The filename should follow the pattern: [fileName = {resourceThemeIdentifier} + {-} + {resourceType} ( + {-} + resourceIdentifier]  ) + {.} + {fileextension} ] where:
* resourceType = "r" for resource theme, "s" for services, "d" for data, "t" for tools, and "g" for guidance
* the resourceThemeIdentifier should be a camelCase, human-readable, shortened, alphanumeric rendition of the resource theme label - and this should be the same for all resources from the same resource theme (so they are grouped together). If there is no resource theme for this logo then this part of the filename should simply be "psdi"
* likewise, the resourceIdentifier should be a camelCase, human-readable, shortened, alphanumeric rendition of the resource label
e.g.:
* psdi-s-psdiCrossDataSearch.jpg
* bioSym-r.svg
* dataToKnowledge-t-janusCore.png

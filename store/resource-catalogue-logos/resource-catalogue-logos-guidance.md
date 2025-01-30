# Naming conventions for resource catalogue logos
This folder contains images which are displayed in the PSDI Resource catalogue (at http://resources.psdi.ac.uk).
The mapping of which logos correspond to which resources is given in https://psdi-uk.github.io/metadata/resource-catalogue/psdi-dcat.jsonld (in the "psdiDcatExt:logoURL" fields).

## File guidance
* file type
* file dimensions/aspect ratios
* file maximum bytes

## Naming conventions
These are just suggestions to keep this folder tidy and make it obvious which logos are for which resources. 
The filename should follow the pattern: [fileName = {resourceThemeIdentifier} + {-} + {resourceType} ( + {-} + resourceIdentifier]  ) + {.} + {fileextension} ] where:
* resourceType = "r" for resource theme, "s" for services, "d" for data, "t" for tools, and "g" for guidance
* the resourceThemeIdentifier should be a camelCase, human-readable, shortened, alphanumeric rendition of the resource theme label - and this should be the same for all resources from the same resource theme (so they are grouped together). If there is no resource theme for this logo then this part of the filenmae should simply be "psdi"
* likewise, the resourceIdentifier should be a camelCase, human-readable, shortened, alphanumeric rendition of the resource label
e.g.:
* psdi-s-psdiCrossDataSearch.jpg
* bioSym-r.svg
* dataToKnowledge-t-janusCore.png

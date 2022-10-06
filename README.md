# DocBook Templates and Stylesheets

This repository manages stylesheets and document models for producing OASIS work products from DocBook XML source files.

Advantages of working with XML for committee documents include:
- the enforcement of structured content ensuring consistent results and hands-off publishing,
- the selective enforcement of layered content rules that improve the quality of the work product and features for its users,
- the ability to incorporate readily-generated content in DocBook translated from other XML vocabularies, and
- on-the-fly rendering of the committee document XML in an XSLT-aware web browser (e.g. Safari).

This environment is used to produce HTML deliverables and, with access to appropriate conforming formatting tools, to produce PDF deliverables using W3C-standard XSLT and XSL-FO processes.

## Instructions for committee document editors

In the set of repository releases you will find `v2018.xxxx` and `v2020.xxxx` releases, reflecting the OASIS style guidelines in effect in the years indicated. Each release has three packages of resources. Each package is available in both `tar.gz` and `zip` formats.

Viewing resources in `oasis-docbook-resources-viewing-*.zip` include only those directories needed in a subdirectory in the committee document distribution subdirectory in order to support the dynamic HTML rendering of the specification XML by end users. There are no constraints on the name of the subdirectory used in the committee distribution.

The following directories are included in the downloaded viewing package:
- `css/` - HTML rendering support styles
- `docbook/` - off-the-shelf DocBook stylesheets (HTML subset only)
- `models/` - DocBook document constraints to ensure proper structure creation of the XML 
- `stylesheets/` - OASIS look-and-feel modifications to the DocBook stylesheets

Publishing resources in `oasis-docbook-resources-publishing-*.zip` include the DocBook document models and stylesheets for OASIS and DocBook PDF and HTML renderings of the static PDF and HTML files end-users find in the distribution. This package is of interest only to those authors not using the [RealtaOnline publishing API](https://realta.atlassian.net/wiki/spaces/CustandPub/pages/372047860/OASIS+and+DocBook+publishing) online PDF/HTML formatting tools made available to OASIS technical committees to create the static PDF and HTML distribution files remotely. _Please contact gkholman@CraneSoftwrights.com regarding access to online PDF/HTML formatting tools that are available at no charge to OASIS committee document editors._ A brief review of the [Apache FOP project](https://xmlgraphics.apache.org/fop/) appears to indicate that the tool renders an acceptable PDF result for offline creation of simple use of DocBook.

Authoring resources in `oasis-docbook-resources-authoring-*.zip` include the sample templates and DocBook document models and stylesheets for OASIS and DocBook HTML renderings. These are the resources an editor can use to initiate and then preview their work-in-progress on their committee document.

The following directories are included in the downloaded authoring package in addition to those in the viewing package:
- `documentation/` - guidance in the use of DocBook (can be removed for distribution)
- `templates/` - starter DocBook XML templates for authoring new OASIS documents (can be removed for distribution)
- `validation/` - for active two-pass validation of a committee document against both DocBook model constraints and document-writing rule constraints 

## Editing the XML committee document

The suggestions in this section assume that the committee deliverable subdirectory relative to the XML document being edited and distributed is "`db/`" where the viewing package is unzipped. This same convention must be used at authoring time such that the authoring package is unzipped in a directory with the same name. It is not necessary to use the convention for the unzipped publishing package as the invocation command-line arguments override the references found in the XML file with an appropriate catalogue file keyed using the PUBLIC identifier.

Begin the XML document with a processing instruction used to invoke the stylesheet when browsing the XML: 
- for an OASIS Committee Note:
<pre>&lt;?xml-stylesheet type="text/xsl" href="db/stylesheets/oasis-note-html.xsl"?></pre>

- for an OASIS Standard:
<pre>&lt;?xml-stylesheet type="text/xsl" href="db/stylesheets/oasis-specification-html.xsl"?></pre>

The Document Type Declaration is used to resolve entities and validate the content (the internal declaration subset can be omitted when not using MathML):

<pre>
&lt;!DOCTYPE article PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN"
                         "db/models/docbook/docbookx.dtd"
[
&lt;!ENTITY % MATHML.prefixed "INCLUDE">
&lt;!ENTITY % MATHML.prefix "mml">
&lt;!ENTITY % equation.content "(alt?, (graphic+|mediaobject+|mml:math))">
&lt;!ENTITY % inlineequation.content 
                "(alt?, (inlinegraphic+|inlinemediaobject+|mml:math))">
&lt;!ENTITY % mathml PUBLIC "-//W3C//DTD MathML 2.0//EN"
                         "db/models/mathml2/mathml2.dtd">
%mathml;
]></pre>

See the documentation directory in the authoring package for more information.

## Invoking two-pass standalone validation
Validating your document before submitting it for publishing can save some time when you have errors to be fixed.
- DOS: `call db\validation\validate.bat {xml-document}`
- Shell: `sh db/validation/validate.sh {xml-document}`

## Maintainer

This repository is maintained by Erlend Klakegg Bergheim (user: klakegg).

## Contributions

Contributions to this repository are subject to the terms of the [IPR Mode](https://www.oasis-open.org/policies-guidelines/ipr#def-ipr-mode) ([Non-Assertion Mode](https://www.oasis-open.org/policies-guidelines/ipr#Non-Assertion-Mode) ). Feedback from those who are not members of OASIS is also governed by the terms of the [OASIS Feedback License](https://www.oasis-open.org/policies-guidelines/ipr#appendixa).

## Licensing

Please see the [LICENSE](https://github.com/editorial-resources-admin/docbook-templates/blob/master/LICENSE.md) file for description of the license terms and OASIS policies applicable to the work in this GitHub project. 

## Contact

Please send questions or comments about OASIS Editorial Resources to the [Technical Community Steward](mailto:tc-admin@oasis-open.org).  For questions about content in this repository, please contact [G. Ken Holman](mailto:gkholman@CraneSoftwrights.com).

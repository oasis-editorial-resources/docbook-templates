# DocBook Templates and Stylesheets

This repository manages stylesheets and document models for producing OASIS work products from DocBook XML source files.

Advantages of working with XML for committee documents include:
- the enforcement of structured content ensuring consistent results and hands-off publishing,
- the selective enforcement of layered content rules that improve the quality of the work product and features for its users,
- the ability to incorporate readily-generated content in DocBook translated from other XML vocabularies, and
- on-the-fly rendering of the committee document XML in an XSLT-aware web browser (e.g. Safari).

This environment is used to produce HTML deliverables and, with access to appropriate conformant formatting tools, to produce PDF deliverables using W3C-standard XSLT and XSL-FO processes. _Please contact gkholman@CraneSoftwrights.com regarding access to online formatting tools that are available at no charge to OASIS committee editors._

## Repository contents and optional distribution subset

The following directories are included in the complete repository (approximately 75Mb):
- `2018/` - rendering an OASIS specification according to the November 2018 conventions
- `2020/` - rendering an OASIS specification according to the May 2020 conventions
- `html/` - DocBook stylesheet library support for HTML rendering 
- `models/` - for entity resolution and DTD validation
- `print/` - DocBook stylesheet library support for print rendering using XSL-FO
- `validation/` - for active two-pass validation of a committee document against both DocBook model constraints and document-writing rule constraints 

The published HTML and PDF results can be distributed without additional template support and can be viewed when either online or offline.

An OASIS committee document distributed as XML can be viewed by readers using the XML in an XSLT-aware web browser (e.g. Safari).

*Important note:* The document editor must decide if the reader is required to be online to render the XML on-the-fly, or if the work product distribution files included embedded support using a well-defined subset of only the following three directories (approximately 10Mb) for entity resolution, validation, rendering, and styling – all other base directories can be deleted from an embedded copy of this repository to save space:
- `2018/` or `2020/` - keep only the one of these directories that is needed
- `html/` - DocBook stylesheet library support for HTML rendering 
- `models/` - for entity resolution and DTD validation

## Online XML rendering (without embedded XML runtime support)

Choose this when it is not acceptable to embed in your committee document environment the subset of this repository supporting on-the-fly XML rendering in an XSLT-aware web browser (e.g. Safari). The XML document can be rendered still, but one must be online in order to do so, and the time to render is greatly exaggerated due to the repeated web requests for fragments.

Begin the XML document with a processing instruction used to invoke the stylesheet when browsing the XML: 
- for an OASIS Committee Note:
<pre>&lt;?xml-stylesheet type="text/xsl" 
href="https://raw.githubusercontent.com/editorial-resources-admin/docbook-templates/master/2018/stylesheets/oasis-note-html.xsl"?></pre>

- for an OASIS Standard:
<pre>&lt;?xml-stylesheet type="text/xsl"
href="https://raw.githubusercontent.com/editorial-resources-admin/docbook-templates/master/20xx/stylesheets/oasis-specification-html.xsl"?></pre>

The Document Type Declaration is used to resolve entities and validate the content (the internal declaration subset can be omitted when not using MathML):

<pre>
&lt;!DOCTYPE article PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN"
  "https://raw.githubusercontent.com/editorial-resources-admin/docbook-templates/master/models/docbook/docbookx.dtd"
[
&lt;!ENTITY % MATHML.prefixed "INCLUDE">
&lt;!ENTITY % MATHML.prefix "mml">
&lt;!ENTITY % equation.content "(alt?, (graphic+|mediaobject+|mml:math))">
&lt;!ENTITY % inlineequation.content 
                "(alt?, (inlinegraphic+|inlinemediaobject+|mml:math))">
&lt;!ENTITY % mathml PUBLIC "-//W3C//DTD MathML 2.0//EN"
"https://raw.githubusercontent.com/editorial-resources-admin/docbook-templates/master/models/mathml2/mathml2.dtd">
%mathml;
]></pre>

## Offline XML rendering (with embedded XML runtime support)

Choose this when it is acceptable to embed in your committee document environment the subset of this repository supporting on-the-fly XML rendering in an XSLT-aware web browser (e.g. Safari) documented above. Adjust the URI values accordingly to point the relative URI to the name you choose to use in your distribution for the `docbook-templates/` directory (which can be arbitrary). Performance reasons often balance the burden of embedding the subset of repository directories in the distribution.

Begin the XML document with a processing instruction used to invoke the stylesheet when browsing the XML: 
- for an OASIS Committee Note:
<pre>&lt;?xml-stylesheet type="text/xsl"
href="docbook-templates/20xx/stylesheets/oasis-note-html.xsl"?></pre>

- for an OASIS Standard:
<pre>&lt;?xml-stylesheet type="text/xsl" 
href="docbook-templates/20xx/stylesheets/oasis-specification-html.xsl"?></pre>

The Document Type Declaration is used to resolve entities and validate the content (the internal declaration subset can be omitted when not using MathML):

<pre>&lt;!DOCTYPE article PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN"
                         "docbook-templates/models/docbook/docbookx.dtd"
[
&lt;!ENTITY % MATHML.prefixed "INCLUDE">
&lt;!ENTITY % MATHML.prefix "mml">
&lt;!ENTITY % equation.content "(alt?, (graphic+|mediaobject+|mml:math))">
&lt;!ENTITY % inlineequation.content 
                "(alt?, (inlinegraphic+|inlinemediaobject+|mml:math))">
&lt;!ENTITY % mathml PUBLIC "-//W3C//DTD MathML 2.0//EN"
           "docbook-templates/models/mathml2/mathml2.dtd">
%mathml;
]></pre>

## Invoking two-pass standalone validation
Validating your document before submitting it for publishing can save some time when you have errors to be fixed.
- DOS: `call docbook-templates\validation\validate.bat {document}`
- Shell: `sh docbook-templates/validation/validate.sh {document}`

## More detailed information about this repository's files
- [`2018/oasis-specification-2018.html']( 2018/oasis-specification-2018.html ) - detailed documentation
- [`2020/oasis-specification-2020.html']( 2020/oasis-specification-2020.html ) - detailed documentation
- `20xx/css` - CSS stylesheet support used by HTML stylesheets
- `20xx/stylesheets` - XSLT stylesheets
  - OASIS Committee Note - non-standards track work product
    - `oasis-note-html.xsl` - HTML rendering
    - `oasis-note-fo-a4.xsl` - A4-page print rendering using XSL-FO 
    - `oasis-note-fo-us.xsl` - US-letter-page print rendering using XSL-FO 
  - OASIS Specification / OASIS Standard - standards track work product
    - `oasis-specification-html.xsl` - HTML rendering
    - `oasis-specification-fo-a4.xsl` - A4-page print rendering using XSL-FO 
    - `oasis-specification-fo-us.xsl` - US-letter-page print rendering using XSL-FO 
- `20xx/templates`
  - `note-docbook-template-20xx.xml` - OASIS Committee Note - non-standards track work product
  - `spec-docbook-template-20xx.xml` - OASIS Specification / OASIS Standard - standards track work product
- `20xx/publish.sh` - shell script re-publishing of specification and template outputs

## Maintainer

This repository is maintained by G. Ken Holman (gkholman), Crane Softwrights Ltd., gkholman@CraneSoftwrights.com

## Contributions

Contributions to this repository are subject to the terms of the [IPR Mode](https://www.oasis-open.org/policies-guidelines/ipr#def-ipr-mode) ([Non-Assertion Mode](https://www.oasis-open.org/policies-guidelines/ipr#Non-Assertion-Mode) ). Feedback from those who are not members of OASIS is also governed by the terms of the [OASIS Feedback License](https://www.oasis-open.org/policies-guidelines/ipr#appendixa).

## Licensing

Please see the [LICENSE](https://github.com/editorial-resources-admin/docbook-templates/blob/master/LICENSE.md) file for description of the license terms and OASIS policies applicable to the work in this GitHub project. 

## Contact

Please send questions or comments about OASIS Editorial Resources to the [Technical Community Steward](mailto:tc-admin@oasis-open.org).  For questions about content in this repository, please contact [G. Ken Holman](mailto:gkholman@CraneSoftwrights.com).

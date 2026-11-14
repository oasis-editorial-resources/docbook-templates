# DocBook Templates

This repository manages stylesheets for producting OASIS work products from DocBook XML source files. 

These stylesheets produce HTML deliverables and, with access to appropriate formatting tools, can be used to produce PDF deliverables.

In late 2026 this library was refactored to remove the browser-based XML rendering paths based on the web browsers phasing out support for XSLT. Should they change, this can be reintroduced into this library.

There are multiple layouts but new projects should use the latest layout, which at this time is the 2025 layout. This layout is the same for both specifications and notes. Legacy layout stylesheets exist in the directory but should not be used. Please use only the stylesheets documented here.

## Starter templates

Two starter templates are found at [template/spec-docbook-template.xml](template/spec-docbook-template.xml) and [template/note-docbook-template.xml](template/note-docbook-template.xml). These are rendered at [template/spec-docbook-template.html](template/spec-docbook-template.html) and [template/note-docbook-template.html](template/note-docbook-template.html).

Documentation about the use of DocBook is found at [oasis-specification.html](oasis-specification.html). It does not include the details in this README regarding the names and locations of files.

## Validation

There are two steps for validation: the madatory DocBook schemas and an optional stylesheet checking a set of writing rules adopted by the UBL TC for documents that offer reliable navigation properties and limited content rules.

By choice an older DocBook 4.5 DTD is used in this publishing system because there are no requirements for the OASIS layouts that need any features beyond this version. Moreover, some committees have legacy documents that were written when this version was current. Of course, with stylesheets, the new layouts are accommodated without needing to change the XML.

Use the [DocBook V4.5 DTD](docbook/docbookx.dtd) for document structure validation.

Optionally use the [OASIS Committee stylesheet](oasis-spec-note.xsl) based on the [OASIS Committee Schematron](oasis-spec-note.sch) for validating document writing rules.

## Layout stylesheets

[stylesheets/oasis-2025-spec-note-html.xsl](stylesheets/oasis-2025-spec-note-html.xsl) for HTML OASIS 2025 layout

[stylesheets/oasis-2025-spec-note-fo-a4.xsl](stylesheets/oasis-2025-spec-note-fo-a4.xsl) for XSL-FO A4 OASIS 2025 layout

[stylesheets/oasis-2025-spec-note-fo-us.xsl](stylesheets/oasis-2025-spec-note-fo-us.xsl) for XSL-FO US-letter OASIS 2025 layout

Note that the XSL-FO stylesheets produce only the XSL-FO and it is up to the committee to produce the PDF files from the XSL-FO output files.

Note also that this stylesheet library does not include ISO Directives Part 2 layouts for PDF.

Please see the section below regarding the online SaaS publishing service for comments regarding PDF production.

## Maintainers

This repository is maintained by Kees Duvekot (kduvekot), SiPiCo, [kees@sipico.com](mailto:kees@sipico.com) and G. Ken Holman (gkholman), Crane Softwrights Ltd., [gkholman@CraneSoftwrights.com](gkholman@CraneSoftwrights.com).

## Contributions

Contributions to this repository are subject to the terms of the [IPR Mode](https://www.oasis-open.org/policies-guidelines/ipr#def-ipr-mode) ([Non-Assertion Mode](https://www.oasis-open.org/policies-guidelines/ipr#Non-Assertion-Mode) ). Feedback from those who are not members of OASIS is also governed by the terms of the [OASIS Feedback License](https://www.oasis-open.org/policies-guidelines/ipr#appendixa).

## Licensing

Please see the [LICENSE](https://github.com/oasis-editorial-resources/docbook-templates/blob/master/LICENSE.md) file for description of the license terms and OASIS policies applicable to the work in this GitHub project. 

## Online SaaS publishing service

[Réalta Online Publishing Solutions Inc.](https://RealtaOnline.com) </a> of Ireland offers to OASIS Technical Committees no-charge access to their OASIS document publishing service for TC publications.

This service includes production of both the OASIS layouts in HTML and A4 PDF and, if needed, the ISO Directives Part 2 layout in A4 PDF.

Contact [support@realtaonline.com](mailto:support@realtaonline.com) to describe your committee requirement and obtain credentials and API details.

## Contact

Please send questions or comments about OASIS Editorial Resources to the [Technical Community Steward](mailto:tc-admin@oasis-open.org).  For questions about content in this repository, please create an [issue](issues/).

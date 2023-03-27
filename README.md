# LaTex Template for Calgo Lab Theses 

This is a LaTex template from the Calgo Lab Team for students' theses of the Fachbereich 6 at Berlin University of Applied Sciences and Technology (BHT).


## Usage

This package is used as a template for student theses (bachelor/master).
To use it, clone this repository or copy the necessary files, adapt the main file [`thesis-template.tex`](./thesis-template.tex), and the files for the chapters in the directory [sections](./sections/) by removing the example text and replacing it with your content.
You can (and should) add/remove/change the structure depending on your thesis topic.
Please do not change any layout parameters such as font size, margins, line spacing, etc., so that the theses appear uniformly.
Rename the directory and [`thesis-template.tex`](./thesis-template.tex) file to more sensible names, e.g., to `master-thesis/<lastname>-thesis-<topic-keyword>.tex`, helping your supervisors and reviewers distinguish different theses.


## Language

The standard language of this document is English. You can change the language in the `\documentclass` command at the beginning of [`thesis-template.tex`](./thesis-template.tex). German and English are available.


## Build the PDF

Building PDF files with LaTex is generally a multi-staged process. It contains building the bibliography, glossary, and all the chapter files. Usually, your LaTex editor takes care of executing the necessary steps in the right order (at least after some tweaks). 

This template was tested with the following toolchain:
* LaTex compiler: `PdfLaTeX`
* Bibliography: `biber`
* Glossary: `makeglossaries`


## File structure

### [`thesis-template.tex`](./thesis-template.tex)

This is the main file of your LaTex document. You can set up many things here:
* name + matriculation number
* title
* thesis type
* reviewers + advisors
* editing time
* language of the layout
* `\include` files from [sections](./sections/)
* `\usepackage` for advanced table/figures/math/... features
* hyphenation (optional)
* add/remove `\printglossary` (optional)
* add/remove the appendix (optional)


### [bibentries.bib](./bibentries.bib)

You can use this BibTeX file to collect your literature. We recommend using `BibLaTex` and `biber` instead of BibTeX. The template is already configured in this way.


### [glossentries.tex](./glossentries.tex)

You can use this file to collect your acronyms and reference them with the `\gls` and `\glspl` commands. LaTex takes care of using long or short versions consistently.


### [calgo-lab-thesis.cls](./calgo-lab-thesis.cls)

This is the style template for the document. Please do not modify this file so that all theses appear in the same style.


### [logos](./logos/)

This directory contains the BHT logos as a PDF file. If the thesis is written in cooperation with a company or other institute, you can add their logo here as well.


### [sections](./sections/)

This directory contains your content chapters, split into single `.tex` files. We recommend splitting your chapters or even sections into single files.


### [thesis-template.pdf](./thesis-template.pdf)

The build PDF file contains some basic LaTex examples.


### [README.md](./README.md)

This text.

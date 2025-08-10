#import "template.typ": *

// Load CV data from YAML
#let cvdata = yaml("resume.yml")

#let uservars = (
    headingfont: "Linux Libertine", // Set font for headings
    bodyfont: "EB Garamond",   // Set font for body
    fontsize: 10pt, // 10pt, 11pt, 12pt
    linespacing: 6pt,
    showAddress: true, // true/false Show address in contact info
    showNumber: true,  // true/false Show phone number in contact info
)

// setrules and showrules can be overridden by re-declaring it here
// #let setrules(doc) = {
//      // Add custom document style rules here
//
//      doc
// }

#let customrules(doc) = {
    // Add custom document style rules here
    set page(
        paper: "us-letter", // a4, us-letter
        numbering: "1",
        number-align: center, // left, center, right
        margin: 1.25cm, // 1.25cm, 1.87cm, 2.5cm
    )

    // set text(font: "New Computer Modern")
    doc
}

#let cvinit(doc) = {
    doc = setrules(uservars, doc)
    doc = showrules(uservars, doc)
    doc = customrules(doc)

    doc
}



// Each section function can be overridden by re-declaring it here
// #let cveducation = []

// Content

#show: doc => cvinit(doc)

// #show heading.where(level: 2): it => {
// //   underline(it.body)
//     // underline(stroke: 0.5pt, offset: 5pt, )[#upper(text(it.body))]
//     it
// }

#cvheading(cvdata, uservars)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
    [
        #cveducation(cvdata) \
        #cvwork(cvdata) \
        // #cvaffiliations(cvdata) \
        #cvskills(cvdata, isbreakable:true) \
        #cvcertificates(cvdata) \
        #cvawards(cvdata)
    ],
    [
        #cvprojects(cvdata) \
        // #cvcoursework(cvdata) \
        #cvopensource(cvdata)
        // #cvpublications(cvdata) \
        // #cvreferences(cvdata)
    ]
)

// Single column layout
// #heading(level: 2, "Objective Statement")
// Computer Science major seeking an internship with NASA Jet Propulsion Laboratory working on Engineering in computing and software.
// #cveducation(cvdata) \
// #cvwork(cvdata) \
// #cvopensource(cvdata) \
// #cvskills(cvdata, isbreakable:true) \
// #cvcoursework(cvdata) \
// // #cvaffiliations(cvdata) \
// // #cvcertificates(cvdata) \
// #cvawards(cvdata) \
// #cvprojects(cvdata)

// #cvpublications(cvdata) \
// #cvreferences(cvdata)

#footnote[Code for this resume hosted at https://github.com/japrozs/resume]
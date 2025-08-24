#import "template.typ": *

// Load CV data from YAML
#let cvdata = yaml("resume.yml")

#let uservars = (
  headingfont: "New Computer Modern", // Set font for headings
  bodyfont: "New Computer Modern", // Set font for body
  fontsize: 10pt, // 10pt, 11pt, 12pt
  linespacing: 4pt,
  showAddress: true, // true/false Show address in contact info
  showNumber: true, // true/false Show phone number in contact info
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
    numbering: none,
    number-align: center, // left, center, right
    margin: 0.9cm, // 1.25cm, 1.87cm, 2.5cm
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

// #grid(
//   columns: (1fr, 1fr),
//   column-gutter: 1.5em,
//   [
//     #cveducation(cvdata) \
//     #cvwork(cvdata) \
//     // #cvaffiliations(cvdata) \
//     #cvskills(cvdata, isbreakable: true) \
//     #cvcertificates(cvdata) \
//     #cvawards(cvdata)
//   ],
//   [
//     #cvprojects(cvdata) \
//     #cvcoursework(cvdata) \
//     #cvopensource(cvdata)
//     // #cvpublications(cvdata) \
//     // #cvreferences(cvdata)
//   ],
// )

// Single column layout
// #heading(level: 2, "Objective Statement")
// Computer Science major seeking an internship with NASA Jet Propulsion Laboratory working on Engineering in computing and software.
#cveducation(cvdata)
#v(5pt)
#cvwork(cvdata)
#v(5pt)
#cvprojects(cvdata, singlecolumn: true)
#v(5pt)
#cvskills(cvdata, isbreakable: true)
#v(5pt)
#cvawards(cvdata)
#v(5pt)
// #cvopensource(cvdata)
// #v(5pt)
// #cvcoursework(cvdata)
// #cvaffiliations(cvdata) \
// #cvcertificates(cvdata) \

// #cvpublications(cvdata) \
// #cvreferences(cvdata)

// #footnote[Code for this resume hosted at https://github.com/japrozs/resume]

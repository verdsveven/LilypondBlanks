#(set-global-staff-size 23)
#(set-default-paper-size "a4")
% above lines define the default size of the staff and the size of the paper. Both sizes can be changed to one's liking. "a4" can be changed to "letter" for example

\version "2.19.84"

\paper {
  print-page-number = false
  indent = 0
}
% above lines tell the engraver not to print page numbers nor make a first indentation of the staff

\header {
  tagline = " "
}
% header defines all sorts of headers, tagline defines the footer

\score {
  \repeat unfold 12 {s1 \break \bar ""}
  \layout {
    \context {
      \Score
      \omit BarNumber
      \omit Clef
      \omit TimeSignature
    }
  }
}

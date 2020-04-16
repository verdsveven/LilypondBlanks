#(set-global-staff-size 26)
#(set-default-paper-size "a4")
% above lines define the default size of the staff and the size of the paper. Both sizes can be changed to one's liking. "a4" can be changed to "letter" for example

\version "2.19.84"

\paper {
  print-page-number = false
}
% above lines tell the engraver not to print page numbers

\header {
  tagline = ""
}
% header defines all sorts of headers, tagline defines the footer

global = {
  \repeat unfold 6 {s1 \break \bar ""}
}
% the above global variable contains a repeating blank staff; you can change the amount of bars/lines to your heart's content

upper = \relative c'' {
}

lower = \relative c {
  \clef bass
}

\score {
  \new PianoStaff \with { instrumentName = "Piano" } <<
    \new Staff = "upper" <<\upper \global>>
    \new Staff = "lower" <<\lower \global>>
  >>

  \layout {
    \context {
      \Score
      \omit BarNumber
      \omit TimeSignature
    }
  }
}

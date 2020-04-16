#(set-global-staff-size 26)
#(set-default-paper-size "a4")
% above lines define the default size of the staff and the size of the paper. Both sizes can be changed to one's liking. "a4" can be changed to "letter" for example

\version "2.19.84"

\paper {
  print-page-number = false
  indent = 24
}
% above lines tell the engraver not to print page numbers

\header {
  tagline = ""
}
% header defines all sorts of headers, tagline defines the footer

global = {
  \repeat unfold 8 {s1 \break \bar ""}
}
% the above global variable contains a repeating blank staff; you can change the amount of bars/lines to your heart's content


violinOne = \new Voice \relative c'' {
  \set Staff.instrumentName = #"Violin 1 "
}

violinTwo = \new Voice \relative c'' {
  \set Staff.instrumentName = #"Violin 2 "
}

viola = \new Voice \relative c' {
  \set Staff.instrumentName = #"Viola "
  \clef alto
}

cello = \new Voice \relative c' {
  \set Staff.instrumentName = #"Cello "
  \clef bass
}
% above you can see the different instruments

\score {
\new StaffGroup { <<
  \new Staff << \global \violinOne >>
  \new Staff << \global \violinTwo >>
  \new Staff << \global \viola >>
  \new Staff << \global \cello >>
>>
}

  \layout {
    \context {
      \Score
      \omit BarNumber
      \omit TimeSignature
    }
  }
}

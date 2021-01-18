#(set-global-staff-size 28)
#(set-default-paper-size "a4")
% above lines define the default size of the staff and the size of the paper. Both sizes can be changed to one's liking. "a4" can be changed to "letter" for example

\version "2.19.84"

\paper {
  print-page-number = false
  indent = 20
}
% above lines tell the engraver not to print page numbers and to make first indent size 20

\header {
  tagline = ""
}
% header defines all sorts of headers, tagline defines the footer

global = {
  \repeat unfold 4 {s1 \break \bar ""}
}
% the above global variable contains a repeating blank staff; you can change the amount of bars/lines to your heart's content

string = {
  \magnifyStaff #9/10
}
% tells all string instruments to be 9/10 times smaller than global staff size

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

upper = \relative c'' {
}

lower = \relative c {
  \clef bass
}

% above you can see the different instruments and upper/lower staves of the Piano

\score {
  <<
  \new Staff << \global \violinOne \string >>
  \new Staff << \global \violinTwo \string >>
  \new Staff << \global \viola \string >>
  \new Staff << \global \cello \string >>

  \new PianoStaff \with { instrumentName = "Piano " } <<
    \new Staff = "upper" <<\global \upper>>
    \new Staff = "lower" <<\global \lower>>
  >>
>>

  \layout {
    \context {
      \Score
      \omit BarNumber
      \omit TimeSignature
    }
  }
}

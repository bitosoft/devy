# This file is used to generate the basic-demo.gif using https://github.com/charmbracelet/vhs
# Full spec here - https://github.com/charmbracelet/vhs/blob/main/examples/demo.tape

Set Shell zsh
Output src/assets/demo.gif

# Settings:
#   Set FontSize <number>           Set the font size of the terminal
#   Set FontFamily <string>         Set the font family of the terminal
#   Set Height <number>             Set the height of the terminal
#   Set Width <number>              Set the width of the terminal
#   Set LetterSpacing <float>       Set the font letter spacing (tracking)
#   Set LineHeight <float>          Set the font line height
#   Set LoopOffset <float>%         Set the starting frame offset for the GIF loop
#   Set Theme <json|string>         Set the theme of the terminal
#   Set Padding <number>            Set the padding of the terminal
#   Set Framerate <number>          Set the framerate of the recording
#   Set PlaybackSpeed <float>       Set the playback speed of the recording
#   Set MarginFill <file|#000000>   Set the file or color the margin will be filled with.
#   Set Margin <number>             Set the size of the margin. Has no effect if MarginFill isn't set.
#   Set BorderRadius <number>       Set terminal border radius, in pixels.
#   Set WindowBar <string>          Set window bar type. (one of: Rings, RingsRight, Colorful, ColorfulRight)
#   Set WindowBarSize <number>      Set window bar size, in pixels. Default is 40.
#   Set TypingSpeed <time>          Set the typing speed of the terminal. Default is 50ms.
Set FontSize 14
Set Height 600
Set Width 850
Set Padding 10
Set BorderRadius 10
Set WindowBar Colorful
Set LoopOffset 50000                # Skip the "source" command by starting at the 5th frame.
Set PlaybackSpeed 1.5           # Make the playback 1.5x faster.
Set TypingSpeed 0.1s

Type "source ~/.zshrc"
Enter
Sleep 1s
Type "hello world"
Enter
Sleep 2s
Type "ls"
Enter
Sleep 1s
Type "ls but with file sizes"
Sleep 1s
Enter
Sleep 2s
Type "show my last 3 git commits"
Sleep 1s
Enter
Sleep 2s
Sleep 3s
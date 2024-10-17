# Check if zsh is available
if (Get-Command zsh -ErrorAction SilentlyContinue) {
    # Start zsh
    zsh
    exit
}
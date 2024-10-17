# Devy setup for ZSH.

# This file would be sourced by ~/.zshrc

# Devy distribution directory
# In unix systems, this value could be:
#  - /Users/<user>/<repo>/src
#  - /Users/<user>/<repo>/dist
#  - /Users/<user>/.nvm/versions/node/v20.15.0/lib/node_modules/@bitosoft/devy/dist
#  - /usr/local/lib/node_modules/@bitosoft/devy/dist
# Depending on where the shell script is located.
DEVY_DIST_DIR=$(cd "$(dirname $(realpath $0))/.." && pwd)


# The aliases below do not affect sub-shells (spawned in other programs). https://unix.stackexchange.com/a/30964
alias devy="node --no-warnings $DEVY_DIST_DIR/devy.js"
# Shortcut common query starters to devy
alias what='devy what'
alias why='devy why'
alias who='devy who'
alias how='devy how'
alias when='devy when'
alias the='devy the'
# Technical alias
alias fix='devy fix'
alias run='devy run'
alias test='devy test'
alias build='devy build'
alias generate='devy generate'
alias debug='devy debug'
alias deploy='devy deploy'
alias install='devy install'
# Intentionally overriden (barely used)
alias where='devy where'
alias who='devy who'
alias yes='devy yes' # Only makes sense in automated contexts, not TTY.
alias "#"=":" # for comments in the command line.

# Welcome message for Devy
if [[ -z "$IS_DEVY_IN_SHELL" ]]; then
    echo "\x1b[36m✻\x1b[39m Devy is \e[3min\e[23m here"
    export IS_DEVY_IN_SHELL=true
fi

# Handle failed commands.
LAST_USER_INPUT=""
preexec() {
  LAST_USER_INPUT=$1
  # Use $3 to get input as processed by the shell.
  # See preexec here - https://zsh.sourceforge.io/Doc/Release/Functions.html
  # The equivalent in bash is $BASH_COMMAND
}
# TRAPERR() {    
#     devy "Command '$LAST_USER_INPUT' exited with code $?"
# }

# Handle command not found.
command_not_found_handler() {
    devy "$@" 
    return 0
}

function devy_preexec {
    local result=$(node --no-warnings "$DEVY_DIST_DIR/preexec.js" "$BUFFER")
    
    # Check if the result starts with our expected prefix
    if [[ $result != devy_preexec_result:* ]]; then
        zle accept-line
        return
    fi

    # Remove the prefix and split the result
    result=${result#devy_preexec_result:}
    local IFS=':'
    read -r exit_code command <<< "$result"

    # Unescape colons in the command
    command=${command//\\:/:}

    if [ "$exit_code" -eq 1 ]; then
        # Execute the modified command
        BUFFER="$command"
    fi

    # In both cases (exit_code 0 or 1), we execute the command in BUFFER
    zle accept-line
}

# Create a ZLE widget for our preexec function
zle -N devy_preexec_widget devy_preexec

# Bind the widget to Enter and Ctrl+J
bindkey '^J' devy_preexec_widget
bindkey '^M' devy_preexec_widget

source $DEVY_DIST_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DEVY_DIST_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
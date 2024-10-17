# Devy

Devy is a shell-based AI assistant designed to alleviate the worry of remembering commands, to be proactive support with debugging, and to provide guidance on best practices for clean, efficient, and maintainable code.

![Screenshot](dist/assets/demo.gif)

## Features

- **Command Line Hero**: Suggests and/or automatically executes commands for users. e.g "devy undo my last commit".
- **Code Assistance**: Identify and fix code errors, optimize code, and provide guidance on debugging tools.
- **Proactive Help**: Anticipate user needs and execute commands to help accomplish goals quicker.
- **Multi-language Support**: Generate code snippets in various programming languages.
- **File Management**: Read, create, update, and delete files as needed.
- **System Control**: Execute scripts and control system settings.

## Install

```bash
npm install --foreground-scripts -g @bitosoft/devy
```

## Verify Installation

1. First close all shells that were opened before Devy install
2. Open a new shell, this can be bash, zsh, or fish.
3. The text **✨ Devy is _in_ here** should be at the top. It only appears once, when a shell is created, it won't apear for subshells.

## Usage

1. Invoke Devy directly

```bash
$ devy hello world
```

2. Pipe input to it (ideal for debugging the output of a command)

```bash
$ echo "hello world" | devy
# OR
$ npm run build | devy
```

3. Finally, remember that devy is _in_ the shell, so you can forget the devy command too.

```bash
$ hello world
```

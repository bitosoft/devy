# Devy Builtins

Provide better handling (natural language alternative) to interacting with builtins like ls, cd etc.

### Full list of builtins for zsh

```bash
#    builtin, !, %, ., :, @, [, {, }, alias, alloc, bg, bind, bindkey, break, breaksw, builtins, case, cd, chdir, command, complete,
#    continue, default, dirs, do, done, echo, echotc, elif, else, end, endif, endsw, esac, eval, exec, exit, export, false, fc, fg,
#    filetest, fi, for, foreach, getopts, glob, goto, hash, hashstat, history, hup, if, jobid, jobs, kill, limit, local, log, login, logout,
#    ls-F, nice, nohup, notify, onintr, popd, printenv, printf, pushd, pwd, read, readonly, rehash, repeat, return, sched, set, setenv,
#    settc, setty, setvar, shift, source, stop, suspend, switch, telltc, test, then, time, times, trap, true, type, ulimit, umask, unalias,
#    uncomplete, unhash, unlimit, unset, unsetenv, until, wait, where, which, while
```

For some of these builtins, it would be errorneous to invoke them directly as a command.
E.g. "case", "fi", "break", "continue", "do", "done". Such should be automatically overridden.
TODO: Make the above list exhaustive

For some, it would be highly unlikely to invoke them directly:
E.g. "until", "true", "false", "default"

For some, they have more value in query-space than in command space:
E.g. "which", "what", "where"

For some, we can provide an enhanced natural language variant
E.g. "cd", "ls".

The rest, would be left alone as builtins.
E.g. "builtins", "bind", "chdir", "echo"

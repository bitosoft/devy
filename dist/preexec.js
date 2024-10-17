#!/usr/bin/env node

await (async () => {
  const { dirname } = await import("path");
  const { fileURLToPath } = await import("url");

  /**
   * Shim entry-point related paths.
   */
  if (typeof globalThis.__filename === "undefined") {
    globalThis.__filename = fileURLToPath(import.meta.url);
  }
  if (typeof globalThis.__dirname === "undefined") {
    globalThis.__dirname = dirname(globalThis.__filename);
  }
  /**
   * Shim require if needed.
   */
  if (typeof globalThis.require === "undefined") {
    const { default: module } = await import("module");
    globalThis.require = module.createRequire(import.meta.url);
  }
})();

import{execSync as c}from"child_process";var n=0,s=1,l=["cd","source","export","alias","unalias","set","unset","exec","exit","logout","chroot","umask","pushd","popd","shopt","bind","enable","ulimit","hash","pwd"],f=["do","done","elif","else","esac","fi","in","then","until","while","[[","]]","(",")","{","}","case","select","function"],a="";async function h(e){let r=e.split(" ")[0];if(l.includes(r)||r.includes("="))return t(n,e);if(y(r))return t(s,u(e));if(f.includes(r))return t(s,u(e,{makeQuery:!0}));if(!p(r))return t(n,e);if(!d(e))try{let i=await C(e);return i?t(s,u(i)):t(n,e)}catch{return t(n,e)}return t(n,e)}function t(e,r){let i=r.replace(/:/g,"\\:");return`devy_preexec_result:${e}:${i}`}function u(e,r={}){return r.makeQuery&&(e=`devy ${e}`),e.trim().endsWith("?")&&(e=e.replace("?","")),e}function p(e){try{return c(`which ${e}`,{stdio:"ignore"}),!0}catch{return!1}}function d(e){return!(e.startsWith("ls ")&&e.split(" ").length>3)}function y(e){try{return c(`alias ${e}`,{stdio:"ignore"}),!0}catch{return!1}}async function C(e){return`\u273B ${e}`}var o=process.argv.slice(2).join(" ");h(o).then(e=>{console.log(e)}).catch(e=>{console.log(t(n,o))});

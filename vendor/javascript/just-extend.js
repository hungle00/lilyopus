// just-extend@5.1.1 downloaded from https://ga.jspm.io/npm:just-extend@5.1.1/index.esm.js

var e=extend;function extend(){var e=[].slice.call(arguments);var r=false;"boolean"==typeof e[0]&&(r=e.shift());var t=e[0];if(isUnextendable(t))throw new Error("extendee must be an object");var a=e.slice(1);var n=a.length;for(var o=0;o<n;o++){var l=a[o];for(var i in l)if(Object.prototype.hasOwnProperty.call(l,i)){var c=l[i];if(r&&isCloneable(c)){var s=Array.isArray(c)?[]:{};t[i]=extend(true,Object.prototype.hasOwnProperty.call(t,i)&&!isUnextendable(t[i])?t[i]:s,c)}else t[i]=c}}return t}function isCloneable(e){return Array.isArray(e)||"[object Object]"=={}.toString.call(e)}function isUnextendable(e){return!e||"object"!=typeof e&&"function"!=typeof e}export{e as default};


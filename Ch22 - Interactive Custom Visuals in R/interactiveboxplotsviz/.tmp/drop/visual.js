var interactiveboxplotsviz2CAEF8A92DBA4E7AB2DB9F277A5BECE1;(()=>{"use strict";var e={934:(e,t,r)=>{r.d(t,{Kq:()=>o,ME:()=>l,Tx:()=>i});var s=r(738);let n=0;function i(){n=0}function o(e,t){let r=[];if(!e||!e.hasChildNodes())return;let s=e.children;for(let e=0;e<s.length;e++){let n;n="script"===s.item(e).nodeName.toLowerCase()?a(s.item(e)):s.item(e).cloneNode(!0),t.appendChild(n),r.push(n)}return r}function a(e){let t=document.createElement("script"),r=e.attributes;for(let e=0;e<r.length;e++)t.setAttribute(r[e].name,r[e].textContent),"src"===r[e].name.toLowerCase()&&(n++,t.onload=()=>{n--});return t.innerHTML=e.innerHTML,t}function l(){let e=s.setInterval((()=>{0===n&&(s.clearInterval(e),s.hasOwnProperty("HTMLWidgets")&&s.HTMLWidgets.staticRender&&s.HTMLWidgets.staticRender())}),100)}},50:(e,t,r)=>{r.d(t,{J:()=>n});var s=r(554).U;class n extends s{constructor(){super(...arguments),this.settings_variable_params=new i}}class i{constructor(){this.y_transf_name="standard"}}},728:(e,t,r)=>{r.d(t,{u:()=>l});var s,n=r(50),i=r(934),o=r(738);!function(e){e[e.Data=2]="Data",e[e.Resize=4]="Resize",e[e.ViewMode=8]="ViewMode",e[e.Style=16]="Style",e[e.ResizeEnd=32]="ResizeEnd",e[e.All=62]="All"}(s||(s={}));const a=[s.Resize,s.ResizeEnd,s.Resize+s.ResizeEnd];class l{constructor(e){e&&e.element&&(this.rootElement=e.element),this.headNodes=[],this.bodyNodes=[]}update(e){if(!(e&&e.type&&e.viewport&&e.dataViews&&0!==e.dataViews.length&&e.dataViews[0]))return;const t=e.dataViews[0];this.settings=l.parseSettings(t);let r=null;t.scriptResult&&t.scriptResult.payloadBase64&&(r=t.scriptResult.payloadBase64),-1===a.indexOf(e.type)?r&&this.injectCodeFromPayload(r):this.onResizing(e.viewport)}onResizing(e){}injectCodeFromPayload(e){if((0,i.Tx)(),!e)return;let t=document.createElement("html");try{t.innerHTML=o.atob(e)}catch(e){return}if(0===this.headNodes.length){for(;this.headNodes.length>0;){let e=this.headNodes.pop();document.head.removeChild(e)}let e=t.getElementsByTagName("head");if(e&&e.length>0){let t=e[0];this.headNodes=(0,i.Kq)(t,document.head)}}for(;this.bodyNodes.length>0;){let e=this.bodyNodes.pop();this.rootElement.removeChild(e)}let r=t.getElementsByTagName("body");if(r&&r.length>0){let e=r[0];this.bodyNodes=(0,i.Kq)(e,this.rootElement)}(0,i.ME)()}static parseSettings(e){return n.J.parse(e)}enumerateObjectInstances(e){return n.J.enumerateObjectInstances(this.settings||n.J.getDefault(),e)}}},567:(e,t,r)=>{function s(e,t,r){if(!e)return r;let s=e[t];return void 0===s?r:s}r.d(t,{N:()=>s})},982:(e,t,r)=>{r.d(t,{d9:()=>n});var s=r(567);function n(e,t,r){const n=function(e,t,r){return e?s.N(e[t.objectName],t.propertyName,r):r}(e,t,r);return n&&n.solid?n.solid.color:null==n||"object"==typeof n&&!n.solid?r:n}},554:(e,t,r)=>{r.d(t,{U:()=>n});var s=r(982);class n{static getDefault(){return new this}static createPropertyIdentifier(e,t){return{objectName:e,propertyName:t}}static parse(e){let t,r=this.getDefault();if(!e||!e.metadata||!e.metadata.objects)return r;t=r.getProperties();for(let n in t)for(let i in t[n]){const o=r[n][i];r[n][i]=s.d9(e.metadata.objects,t[n][i],o)}return r}static isPropertyEnumerable(e){return!n.InnumerablePropertyPrefix.test(e)}static enumerateObjectInstances(e,t){let r=e&&e[t.objectName];if(!r)return[];let s={objectName:t.objectName,selector:null,properties:{}};for(let e in r)r.hasOwnProperty(e)&&(s.properties[e]=r[e]);return{instances:[s]}}getProperties(){let e={};return Object.keys(this).forEach((t=>{if(n.isPropertyEnumerable(t)){let r=Object.keys(this[t]);e[t]={},r.forEach((r=>{n.isPropertyEnumerable(t)&&(e[t][r]=n.createPropertyIdentifier(t,r))}))}})),e}}n.InnumerablePropertyPrefix=/^_/},738:e=>{e.exports=Function("return this")()}},t={};function r(s){var n=t[s];if(void 0!==n)return n.exports;var i=t[s]={exports:{}};return e[s](i,i.exports,r),i.exports}r.d=(e,t)=>{for(var s in t)r.o(t,s)&&!r.o(e,s)&&Object.defineProperty(e,s,{enumerable:!0,get:t[s]})},r.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),r.r=e=>{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})};var s={};(()=>{r.r(s),r.d(s,{default:()=>i});var e=r(728),t=r(738).powerbi,n={name:"interactiveboxplotsviz2CAEF8A92DBA4E7AB2DB9F277A5BECE1",displayName:"Interactive Boxplots",class:"Visual",apiVersion:"3.8.0",create:t=>{if(e.u)return new e.u(t);throw"Visual instance not found"},createModalDialog:(e,t,r)=>{const s=globalThis.dialogRegistry;e in s&&new s[e](t,r)},custom:!0};void 0!==t&&(t.visuals=t.visuals||{},t.visuals.plugins=t.visuals.plugins||{},t.visuals.plugins.interactiveboxplotsviz2CAEF8A92DBA4E7AB2DB9F277A5BECE1=n);const i=n})(),interactiveboxplotsviz2CAEF8A92DBA4E7AB2DB9F277A5BECE1=s})();
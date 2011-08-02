/**
 * Adobe Helium: symbol definitions
 */
window.symbols = {
"stage": {
   version: "0.1",
   baseState: "Base State",
   initialState: "Base State",
   parameters: {

   },
   content: {
      dom: [
        {
            id:'sunburst',
            type:'image',
            rect:[0,0,754,754],
            fill:['rgba(0,0,0,0)','images/sunburst.svg'],
        },
        {
            id:'leftArm',
            type:'image',
            rect:[0,0,291,332],
            fill:['rgba(0,0,0,0)','images/left%2Darm2.svg'],
        },
        {
            id:'apeBody',
            type:'image',
            rect:[0,0,291,332],
            fill:['rgba(0,0,0,0)','images/ape%2Dbody2.svg'],
        },
        {
            id:'rightArm',
            type:'image',
            rect:[0,0,291,332],
            fill:['rgba(0,0,0,0)','images/right%2Darm1.svg'],
        },
      ],
      symbolInstances: [
      ],
   },
   states: {
      "Base State": {
         "#stage": [
            ["style", "-webkit-transform-origin", [50,55],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-moz-transform-origin", [50,55],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [50,55],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [50,55],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [50,55],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "overflow", 'hidden'],
            ["style", "height", '400px'],
            ["color", "background-color", 'rgba(255,180,36,1.00)'],
            ["style", "width", '550px']
         ],
         "#sunburst": [
            ["transform", "translateY", '-132.4px'],
            ["style", "opacity", '0.3'],
            ["transform", "translateX", '-86.8px'],
            ["transform", "rotateZ", '0deg']
         ],
         "#rightArm": [
            ["style", "width", '213px'],
            ["transform", "translateX", '111.6px'],
            ["transform", "translateY", '20.4px'],
            ["transform", "rotateZ", '0']
         ],
         "#apeBody": [
            ["style", "height", '360.8px'],
            ["transform", "translateY", '20.4px'],
            ["transform", "translateX", '111.6px'],
            ["style", "width", '304.2px']
         ],
         "#leftArm": [
            ["style", "-webkit-transform-origin", [70,55],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-moz-transform-origin", [70,55],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [70,55],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [70,55],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [70,55],{valueTemplate:'@@0@@% @@1@@%'}],
            ["transform", "translateX", '111.6px'],
            ["transform", "rotateZ", '0'],
            ["style", "height", '316.4px'],
            ["transform", "translateY", '20.39999px'],
            ["style", "width", '329.4px']
         ]
      }
   },
   actions: {

   },
   bindings: [

   ],
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 2000,
         timeline: [
            { id: "eid166", tween: [ "style", "#stage", "-webkit-transform-origin", [50,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid424", tween: [ "style", "#stage", "-moz-transform-origin", [50,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid425", tween: [ "style", "#stage", "-ms-transform-origin", [50,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid426", tween: [ "style", "#stage", "msTransformOrigin", [50,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid427", tween: [ "style", "#stage", "-o-transform-origin", [50,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid192", tween: [ "transform", "#rightArm", "rotateZ", '10deg', { valueTemplate: undefined, fromValue: '0deg'}], position: 450, duration: 140, easing: "linear" },
            { id: "eid185", tween: [ "transform", "#rightArm", "rotateZ", '-35deg', { valueTemplate: undefined, fromValue: '10deg'}], position: 590, duration: 160, easing: "linear" },
            { id: "eid173", tween: [ "transform", "#rightArm", "translateX", '111.6px', { valueTemplate: undefined, fromValue: '111.6px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid144", tween: [ "transform", "#sunburst", "translateX", '-86.8px', { valueTemplate: undefined, fromValue: '-86.8px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid9", tween: [ "transform", "#sunburst", "rotateZ", '45deg', { valueTemplate: undefined, fromValue: '0deg'}], position: 0, duration: 2000, easing: "linear" },
            { id: "eid275", tween: [ "style", "#leftArm", "msTransformOrigin", '70% 55%', { valueTemplate: undefined, fromValue: '70% 55%'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid145", tween: [ "transform", "#sunburst", "translateY", '-132.4px', { valueTemplate: undefined, fromValue: '-132.4px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid194", tween: [ "transform", "#leftArm", "rotateZ", '-10deg', { valueTemplate: undefined, fromValue: '0deg'}], position: 450, duration: 140, easing: "linear" },
            { id: "eid183", tween: [ "transform", "#leftArm", "rotateZ", '35deg', { valueTemplate: undefined, fromValue: '-10deg'}], position: 590, duration: 160, easing: "linear" },
            { id: "eid155", tween: [ "style", "#apeBody", "width", '304.2px', { valueTemplate: undefined, fromValue: '304.2px'}], position: 1000, duration: 0, easing: "linear" },
            { id: "eid187", tween: [ "style", "#leftArm", "height", '316.4px', { valueTemplate: undefined, fromValue: '316.4px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid196", tween: [ "transform", "#leftArm", "translateY", '20.39999px', { valueTemplate: undefined, fromValue: '20.39999px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid188", tween: [ "style", "#leftArm", "width", '329.4px', { valueTemplate: undefined, fromValue: '329.4px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid168", tween: [ "style", "#leftArm", "-webkit-transform-origin", [70,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [70,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid428", tween: [ "style", "#leftArm", "-moz-transform-origin", [70,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [70,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid429", tween: [ "style", "#leftArm", "-ms-transform-origin", [70,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [70,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid430", tween: [ "style", "#leftArm", "msTransformOrigin", [70,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [70,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid431", tween: [ "style", "#leftArm", "-o-transform-origin", [70,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [70,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid156", tween: [ "style", "#rightArm", "width", '213px', { valueTemplate: undefined, fromValue: '213px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid169", tween: [ "transform", "#leftArm", "translateX", '111.6px', { valueTemplate: undefined, fromValue: '111.6px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid231", tween: [ "style", "#stage", "msTransformOrigin", '50% 55%', { valueTemplate: undefined, fromValue: '50% 55%'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid154", tween: [ "style", "#apeBody", "height", '360.8px', { valueTemplate: undefined, fromValue: '360.8px'}], position: 1000, duration: 0, easing: "linear" },
            { id: "eid172", tween: [ "transform", "#apeBody", "translateY", '20.4px', { valueTemplate: undefined, fromValue: '20.4px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid195", tween: [ "transform", "#rightArm", "translateY", '20.39999px', { valueTemplate: undefined, fromValue: '20.4px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid171", tween: [ "transform", "#apeBody", "translateX", '111.6px', { valueTemplate: undefined, fromValue: '111.6px'}], position: 0, duration: 0, easing: "linear" }]
      }
   },
}};

/**
 * Adobe Edge DOM Ready Event Handler
 */
$(window).ready(function() {
     $.Edge.initialize(symbols);
});
/**
 * Adobe Edge Timeline Launch
 */
$(window).load(function() {
    $.Edge.play();
});

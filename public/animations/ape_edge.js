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
        {
            id:'mouth',
            type:'image',
            rect:[0,0,291,332],
            fill:['rgba(0,0,0,0)','images/mouth3.svg'],
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
            ["style", "width", '960px']
         ],
         "#sunburst": [
            ["style", "-webkit-transform-origin", [50,48],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-moz-transform-origin", [50,48],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [50,48],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [50,48],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [50,48],{valueTemplate:'@@0@@% @@1@@%'}],
            ["transform", "translateX", '-98.0379px'],
            ["transform", "rotateZ", '0deg'],
            ["transform", "scaleX", '2'],
            ["style", "opacity", '0.3'],
            ["transform", "translateY", '-145.6px'],
            ["transform", "scaleY", '2']
         ],
         "#rightArm": [
            ["style", "-webkit-transform-origin", [32,40],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-moz-transform-origin", [32,40],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [32,40],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [32,40],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [32,40],{valueTemplate:'@@0@@% @@1@@%'}],
            ["transform", "translateX", '111.6px'],
            ["transform", "rotateZ", '0'],
            ["transform", "translateY", '20.4px'],
            ["style", "width", '213px']
         ],
         "#mouth": [
            ["style", "-webkit-transform-origin", [66,48],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-moz-transform-origin", [66,48],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [66,48],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [66,48],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [66,48],{valueTemplate:'@@0@@% @@1@@%'}],
            ["transform", "scaleY", '0'],
            ["transform", "translateY", '-10px'],
            ["transform", "translateX", '76px']
         ],
         "#apeBody": [
            ["style", "height", '360.8px'],
            ["transform", "translateY", '20.4px'],
            ["transform", "translateX", '111.6px'],
            ["style", "width", '304.2px']
         ],
         "#leftArm": [
            ["style", "-webkit-transform-origin", [50,44],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-moz-transform-origin", [50,44],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [50,44],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [50,44],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [50,44],{valueTemplate:'@@0@@% @@1@@%'}],
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
            { id: "eid651", tween: [ "style", "#stage", "-moz-transform-origin", [50,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid652", tween: [ "style", "#stage", "-ms-transform-origin", [50,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid653", tween: [ "style", "#stage", "msTransformOrigin", [50,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid654", tween: [ "style", "#stage", "-o-transform-origin", [50,55], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,55]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid192", tween: [ "transform", "#rightArm", "rotateZ", '10deg', { valueTemplate: undefined, fromValue: '0deg'}], position: 450, duration: 140, easing: "linear" },
            { id: "eid185", tween: [ "transform", "#rightArm", "rotateZ", '-35deg', { valueTemplate: undefined, fromValue: '10deg'}], position: 590, duration: 160, easing: "linear" },
            { id: "eid173", tween: [ "transform", "#rightArm", "translateX", '111.6px', { valueTemplate: undefined, fromValue: '111.6px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid154", tween: [ "style", "#apeBody", "height", '360.8px', { valueTemplate: undefined, fromValue: '360.8px'}], position: 1000, duration: 0, easing: "linear" },
            { id: "eid169", tween: [ "transform", "#leftArm", "translateX", '111.6px', { valueTemplate: undefined, fromValue: '111.6px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid641", tween: [ "style", "#leftArm", "msTransformOrigin", '70% 55%', { valueTemplate: undefined, fromValue: '70% 55%'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid9", tween: [ "transform", "#sunburst", "rotateZ", '45deg', { valueTemplate: undefined, fromValue: '0deg'}], position: 0, duration: 2000, easing: "linear" },
            { id: "eid172", tween: [ "transform", "#apeBody", "translateY", '20.4px', { valueTemplate: undefined, fromValue: '20.4px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid514", tween: [ "transform", "#sunburst", "translateY", '-145.6px', { valueTemplate: undefined, fromValue: '-145.6px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid171", tween: [ "transform", "#apeBody", "translateX", '111.6px', { valueTemplate: undefined, fromValue: '111.6px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid645", tween: [ "style", "#sunburst", "msTransformOrigin", '50% 48%', { valueTemplate: undefined, fromValue: '50% 48%'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid576", tween: [ "transform", "#mouth", "translateX", '76px', { valueTemplate: undefined, fromValue: '76px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid597", tween: [ "style", "#rightArm", "-webkit-transform-origin", [32,40], { valueTemplate: '@@0@@% @@1@@%', fromValue: [32,40]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid655", tween: [ "style", "#rightArm", "-moz-transform-origin", [32,40], { valueTemplate: '@@0@@% @@1@@%', fromValue: [32,40]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid656", tween: [ "style", "#rightArm", "-ms-transform-origin", [32,40], { valueTemplate: '@@0@@% @@1@@%', fromValue: [32,40]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid657", tween: [ "style", "#rightArm", "msTransformOrigin", [32,40], { valueTemplate: '@@0@@% @@1@@%', fromValue: [32,40]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid658", tween: [ "style", "#rightArm", "-o-transform-origin", [32,40], { valueTemplate: '@@0@@% @@1@@%', fromValue: [32,40]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid194", tween: [ "transform", "#leftArm", "rotateZ", '-10deg', { valueTemplate: undefined, fromValue: '0deg'}], position: 450, duration: 140, easing: "linear" },
            { id: "eid183", tween: [ "transform", "#leftArm", "rotateZ", '35deg', { valueTemplate: undefined, fromValue: '-10deg'}], position: 590, duration: 160, easing: "linear" },
            { id: "eid493", tween: [ "transform", "#sunburst", "scaleX", '2', { valueTemplate: undefined, fromValue: '2'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid156", tween: [ "style", "#rightArm", "width", '213px', { valueTemplate: undefined, fromValue: '213px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid155", tween: [ "style", "#apeBody", "width", '304.2px', { valueTemplate: undefined, fromValue: '304.2px'}], position: 1000, duration: 0, easing: "linear" },
            { id: "eid565", tween: [ "style", "#mouth", "msTransformOrigin", '70% 47%', { valueTemplate: undefined, fromValue: '70% 47%'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid633", tween: [ "style", "#mouth", "msTransformOrigin", '74% 48%', { valueTemplate: undefined, fromValue: '66% 48%'}], position: 0, duration: 1000, easing: "linear" },
            { id: "eid616", tween: [ "style", "#mouth", "msTransformOrigin", '65% 42%', { valueTemplate: undefined, fromValue: '66% 48%'}], position: 0, duration: 2000, easing: "linear" },
            { id: "eid637", tween: [ "style", "#mouth", "msTransformOrigin", '65% 42%', { valueTemplate: undefined, fromValue: '74% 48%'}], position: 1000, duration: 1000, easing: "linear" },
            { id: "eid187", tween: [ "style", "#leftArm", "height", '316.4px', { valueTemplate: undefined, fromValue: '316.4px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid435", tween: [ "transform", "#mouth", "scaleX", '1', { valueTemplate: undefined, fromValue: '1'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid477", tween: [ "transform", "#mouth", "scaleX", '0.5', { valueTemplate: undefined, fromValue: '1'}], position: 310, duration: 140, easing: "linear" },
            { id: "eid478", tween: [ "transform", "#mouth", "scaleX", '1', { valueTemplate: undefined, fromValue: '0.5'}], position: 450, duration: 300, easing: "linear" },
            { id: "eid487", tween: [ "transform", "#mouth", "scaleX", '0', { valueTemplate: undefined, fromValue: '1'}], position: 1000, duration: 115, easing: "linear" },
            { id: "eid188", tween: [ "style", "#leftArm", "width", '329.4px', { valueTemplate: undefined, fromValue: '329.4px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid591", tween: [ "style", "#leftArm", "-webkit-transform-origin", [50,44], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,44]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid659", tween: [ "style", "#leftArm", "-moz-transform-origin", [50,44], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,44]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid660", tween: [ "style", "#leftArm", "-ms-transform-origin", [50,44], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,44]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid661", tween: [ "style", "#leftArm", "msTransformOrigin", [50,44], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,44]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid662", tween: [ "style", "#leftArm", "-o-transform-origin", [50,44], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,44]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid195", tween: [ "transform", "#rightArm", "translateY", '20.39999px', { valueTemplate: undefined, fromValue: '20.4px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid601", tween: [ "style", "#sunburst", "-webkit-transform-origin", [50,48], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,48]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid663", tween: [ "style", "#sunburst", "-moz-transform-origin", [50,48], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,48]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid664", tween: [ "style", "#sunburst", "-ms-transform-origin", [50,48], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,48]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid665", tween: [ "style", "#sunburst", "msTransformOrigin", [50,48], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,48]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid666", tween: [ "style", "#sunburst", "-o-transform-origin", [50,48], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,48]}], position: 0, duration: 0, easing: "linear" },
            { id: "eid494", tween: [ "transform", "#sunburst", "scaleY", '2', { valueTemplate: undefined, fromValue: '2'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid605", tween: [ "style", "#mouth", "-webkit-transform-origin", [74,48], { valueTemplate: '@@0@@% @@1@@%', fromValue: [66,48]}], position: 0, duration: 1000, easing: "linear" },
            { id: "eid667", tween: [ "style", "#mouth", "-moz-transform-origin", [74,48], { valueTemplate: '@@0@@% @@1@@%', fromValue: [66,48]}], position: 0, duration: 1000, easing: "linear" },
            { id: "eid668", tween: [ "style", "#mouth", "-ms-transform-origin", [74,48], { valueTemplate: '@@0@@% @@1@@%', fromValue: [66,48]}], position: 0, duration: 1000, easing: "linear" },
            { id: "eid669", tween: [ "style", "#mouth", "msTransformOrigin", [74,48], { valueTemplate: '@@0@@% @@1@@%', fromValue: [66,48]}], position: 0, duration: 1000, easing: "linear" },
            { id: "eid670", tween: [ "style", "#mouth", "-o-transform-origin", [74,48], { valueTemplate: '@@0@@% @@1@@%', fromValue: [66,48]}], position: 0, duration: 1000, easing: "linear" },
            { id: "eid626", tween: [ "style", "#mouth", "-webkit-transform-origin", [65,42], { valueTemplate: '@@0@@% @@1@@%', fromValue: [74,48]}], position: 1000, duration: 1000, easing: "linear" },
            { id: "eid671", tween: [ "style", "#mouth", "-moz-transform-origin", [65,42], { valueTemplate: '@@0@@% @@1@@%', fromValue: [74,48]}], position: 1000, duration: 1000, easing: "linear" },
            { id: "eid672", tween: [ "style", "#mouth", "-ms-transform-origin", [65,42], { valueTemplate: '@@0@@% @@1@@%', fromValue: [74,48]}], position: 1000, duration: 1000, easing: "linear" },
            { id: "eid673", tween: [ "style", "#mouth", "msTransformOrigin", [65,42], { valueTemplate: '@@0@@% @@1@@%', fromValue: [74,48]}], position: 1000, duration: 1000, easing: "linear" },
            { id: "eid674", tween: [ "style", "#mouth", "-o-transform-origin", [65,42], { valueTemplate: '@@0@@% @@1@@%', fromValue: [74,48]}], position: 1000, duration: 1000, easing: "linear" },
            { id: "eid231", tween: [ "style", "#stage", "msTransformOrigin", '50% 55%', { valueTemplate: undefined, fromValue: '50% 55%'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid468", tween: [ "transform", "#mouth", "scaleY", '0.8', { valueTemplate: undefined, fromValue: '0'}], position: 0, duration: 310, easing: "linear" },
            { id: "eid473", tween: [ "transform", "#mouth", "scaleY", '0.5', { valueTemplate: undefined, fromValue: '0.8'}], position: 310, duration: 140, easing: "linear" },
            { id: "eid475", tween: [ "transform", "#mouth", "scaleY", '1.3', { valueTemplate: undefined, fromValue: '0.5'}], position: 450, duration: 300, easing: "linear" },
            { id: "eid483", tween: [ "transform", "#mouth", "scaleY", '1', { valueTemplate: undefined, fromValue: '1.3'}], position: 750, duration: 250, easing: "linear" },
            { id: "eid488", tween: [ "transform", "#mouth", "scaleY", '0', { valueTemplate: undefined, fromValue: '1'}], position: 1000, duration: 115, easing: "linear" },
            { id: "eid432", tween: [ "style", "#stage", "width", '960px', { valueTemplate: undefined, fromValue: '960px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid592", tween: [ "transform", "#leftArm", "translateY", '20.39999px', { valueTemplate: undefined, fromValue: '20.39999px'}], position: 0, duration: 0, easing: "linear" },
            { id: "eid612", tween: [ "style", "#rightArm", "msTransformOrigin", '32% 40%', { valueTemplate: undefined, fromValue: '32% 40%'}], position: 0, duration: 0, easing: "linear" }]
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

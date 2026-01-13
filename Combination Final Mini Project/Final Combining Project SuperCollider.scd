s.boot;
p = ProxySpace.new.push;

//used for test

~sig.play;

~sig = {SinOsc.ar([440,443] * -5.midiratio) * -20.dbamp * LFPulse.kr(6, 0, 0.3)}
~sig = {PinkNoise.ar(-20.dbamp!2)}
~sig = nil;

~sig.stop(3);
~sig.clear(5);

~sigsig.fadeTime = 2

//test ended

(
SynthDef(\bass,{
    arg freq = 120;
    var env = EnvGen.kr(Env.perc(0.01, 0.05), doneAction:2);
    var sig = SinOsc.ar(freq, 0, 1*env) !2;

    Out.ar(0, sig)
}).add
)

(
SynthDef(\anotherOne,{
    arg freq = 800;
    var env = EnvGen.kr(Env.perc(0.08, 0.12), doneAction:2);
    var sig = SinOsc.ar(freq, 0, 1*env) !2;

    Out.ar(0, sig)
}).add
)

(
SynthDef(\anotherTwo,{
    arg freq = 50;
    var env = EnvGen.kr(Env.perc(0.05, 0.15), doneAction:2);
    var sig = SinOsc.ar(freq, 0, 1*env) !2;

    Out.ar(0, sig)
}).add
)

//might change frequency and add
(
SynthDef(\anotherThree,{
    arg freq = 50;
    var env = EnvGen.kr(Env.perc(0.5, 0.8), doneAction:2);
    var sig = SinOsc.ar(freq, 0, 1*env) !2;

    Out.ar(0, sig)
}).add
)

(
SynthDef(\piano,{
    arg freq = 200;
    var env = EnvGen.kr(Env.perc(0.1, 0.15), doneAction:2);
    var sig = SinOsc.ar(freq, 0, 1*env) !2;

    Out.ar(0, sig)
}).add
)

(
SynthDef(\beat,{
    arg freq = 200;
    var env = EnvGen.kr(Env.perc(0.01, 0.05), doneAction:2);
    var sig = SinOsc.ar(freq, 0, 1*env) !2;

    Out.ar(0, sig)
}).add
)

(
SynthDef(\guitar,{
    arg freq = 82;
    var env = EnvGen.kr(Env.perc(0.1, 0.5), doneAction:2);
    var sig = SinOsc.ar(freq, 0, 1*env) !2;

    Out.ar(0, sig)
}).add
)

Synth(\bass);
Synth(\beat);
Synth(\guitar);

//volume controls must be run after sound section
(
SynthDef(\masterFader, { |vol=1|
    var sig = In.ar(0, 2);
    ReplaceOut.ar(0, sig * vol);
}).add;

q = q ?? { () };

OSCdef(\pdVol, { |msg|
    q[\master].set(\vol, msg[1]);
    msg[1].postln;
}, '/volume');
q[\master] = Synth(\masterFader, [\vol, 1], addAction: \addToTail);
)
//end of volume controls

TempoClock.default.tempo = 250/60;

(
Pbind(
    \instrument, \beat,
    \dur, Pseq([1,2,1/2,1,2], inf),
    \freq, 1000
).play;

Pbind(
    \instrument, \anotherTwo,
    \dur, Pseq([1,2,1/2,1,2], inf),
    \freq, 100
).play;

Pbind(
    \instrument, \bass,
    \freq, Pwhite(100, 200, inf),
    \dur, Prand([2, 3], inf),
    \rel, Pwhite(0.1, 0.8, inf),
).play;

Pbind(
    \instrument, \guitar,
    \freq, Pwhite(400, 500, inf),
    \dur, Prand([1, 5], inf),
    \rel, Pwhite(0.1, 0.8, inf),
).play;

Pbind(
    \instrument, \piano,
    \freq, Pwhite(400, 500, inf),
    \dur, Prand([1, 5], inf),
    \rel, Pwhite(0.1, 0.8, inf),
).play;

Pbind(
    \instrument, \anotherOne,
    \freq, Pwhite(1000, 1200, inf),
    \dur, Prand([1, 5], inf),
    \rel, Pwhite(0.1, 0.8, inf),
).play;

//~sig.play;

//~sig = {SinOsc.ar([220,223] * -2.midiratio) * -20.dbamp * LFPulse.kr(6, 0, 0.3)}
)
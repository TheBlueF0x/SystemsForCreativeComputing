// The code below adds a sample (amen-short.wav) from a folder named 'audio'
// to the buffer using the variable name 'a'.
// PlayBuf then plays it back and, in this instance, loops it.

s.boot;

a = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "../audio/amen-short.wav");

(
{
	PlayBuf.ar(
		2,
		a.bufnum,
		BufRateScale.kr(a.bufnum),
		loop:1
	)
}.play
)



// The same code again, with one change...
// The MouseX command is used to change the playback speed.

(
{

var speed = MouseX.kr(-2, 2);

PlayBuf.ar(
	2,
	a.bufnum,
	BufRateScale.kr(a.bufnum)*speed,
	1,
	loop:1
)
}.play
)

// Let's turn that into a SynthDef
(
SynthDef(\amen, { |out=0, now=0, volume=0.5, speed=1|
    var sig = PlayBuf.ar(
        2, a.bufnum,
        BufRateScale.kr(a.bufnum) * speed,
        trigger: now,
        loop: 1
    ) * volume;
    Out.ar(out, sig);
}).add;
)

a = Synth(\amen);
a.set(\speed, 0.8);
a.set(\speed, 1.2, \volume, 0.2);
a.set(\volume, 0.5);
a.free;


// This code adds a gunshot sample to the buffer using the variable name 'b'.
b = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "../audio/gun-gunshot-02.wav");

(
{
	PlayBuf.ar(
		2,
		b.bufnum,
		BufRateScale.kr(b.bufnum),
		loop:0
	)
}.play
)


// Define SynthDef for playback
// The PlayBuf is wrapped into a synth definition, or SynthDef, which allows us
// to give the code a name: in this case, \gun.

(
SynthDef(\gun, { |out=0, now=0, volume=0.5, speed=1|
    var sig = PlayBuf.ar(
        2, b.bufnum,
        BufRateScale.kr(b.bufnum) * speed,
        trigger: now,
        loop: 0
    ) * volume;
    Out.ar(out, sig);
}).add;
)

// OSC controls
// These 'listen' for a specific OSC address
(
OSCFunc({ |msg| ~gun = Synth(\gun) }, '/gun');
OSCFunc({ |msg| ~gun.set(\volume, msg[1]) }, '/volume');
OSCFunc({ |msg| ~gun.set(\speed, msg[1]) }, '/speed');
)

(
OSCFunc({ |msg| ~amen = Synth(\amen) }, '/amen');
OSCFunc({ |msg| ~amen.set(\volume, msg[1]) }, '/volume');
OSCFunc({ |msg| ~amen.set(\speed, msg[1]) }, '/speed');
)
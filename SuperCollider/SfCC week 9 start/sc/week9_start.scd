s.boot;

a = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "../audio/amen-short.wav");

(
{
	var mouse = MouseX.kr(-1, 1);

	PlayBuf.ar(
		2,
		a.bufnum,
		BufRateScale.kr(a.bufnum) * mouse, //Line.kr(1, 0, 5),
		loop:1
	)
}.play
)


(
SynthDef(\amen, {
	arg pitch = 1, volume = 0.5;
	var sig =  PlayBuf.ar(
		2,
		a.bufnum,
		BufRateScale.kr(a.bufnum) * pitch, //Line.kr(1, 0, 5),
		loop:1
	) * volume;
	Out.ar(0, sig)
}).add
)

//a = Synth(\amen);
//a.set(\pitch, 0.7); //change in real time
//a.set(\volume, 0.5);
//a.set(\pitch, 1.1, \volume, 0.4);
//a.free;

(
a = Synth(\amen);
OSCFunc({ |msg| a = Synth(\amen) }, '/amen');
OSCFunc({ |msg| a.set(\pitch, msg[1])}, '/speed');
OSCFunc({ |msg| a.set(\volume, msg[1])}, '/volume');
)
use_osc "localhost",41234
use_debug false
use_bpm 100

snare = "/Users/iremoztimur/samples/808_drum_kit/808-snare-drum-2.wav"
clap = "/Users/iremoztimur/samples/808_drum_kit/808-clap-2.wav"
hat = "/Users/iremoztimur/samples/808_drum_kit/tr-808-closed-hi-hat.wav"


rhythm= [
  1,0,0,0,  2,0,0,0,
  0,0,1,0,  2,0,0,0,
]

cc=[1,0.5,30,1,5,3,2]
cc2=cc+[0]
live_loop :color_control do
  osc "/color", cc2.choose, cc2.choose, cc2.choose
  sleep 4
end

live_loop :mask_control do
  osc "/mask",1
  sleep 8
end

live_loop :initial_chords do
  ##| stop
  use_synth :bass_foundation
  use_synth_defaults amp: 2, release: 4, sustain: 4, cutoff: 70
  play_pattern_timed [[:f3, :a3, :d4], [:g3, :a3, :c4], [:a3, :c4, :e4], [:g3, :b3, :d4],
                      [:f3, :a3, :d4], [:g3, :a3, :cs4], [:a3, :d4, :g4], [:a3, :d4, :f4]], [4, 4, 4, 4, 4, 4, 4, 4]
end

live_loop :drums, sync: :initial_chords do
  ##| stop
  16.times do |index|
    puts index, rhythm[index]
    sample :bd_ada, amp: 5 if rhythm[index] == 1
    sample hat, amp: 0.2 if rhythm[index] % 2 == 0
    sample clap, amp: 0.8 if rhythm[index] == 2
    sleep 0.25
  end
end

define :bass_1 do |note|
  tick
  use_synth :saw
  use_synth_defaults release: 0.25
  with_fx :ixi_techno, amp: 0.3, mix: 0.8 do
    play note
    sleep 0.5
    play note + 12
    sleep 1
    play note, release: 0.5
    sleep 2.5
  end
end

live_loop :bass, sync: :initial_chords do
  stop
  bass_1 46
  bass_1 45
  bass_1 38
  bass_1 43
end

define :dow_first do
  play :d3
  sleep 0.75
  play :f3
  sleep 0.75
  play :d3
  sleep 1.5
end


live_loop :dowdow, sync: :initial_chords do
  stop
  with_fx :slicer, mix: 0.5, amp: 0.8 do
    use_synth :tb303
    use_synth_defaults release: 0.3
    
    dow_first
    
    play :c3
    sleep 0.25
    play :d3
    sleep 0.75
    
    dow_first
    
    sleep 1
    
  end
end

live_loop :tada, sync: :initial_chords do
  stop
  sleep 8
  use_synth :tb303
  sleep 1.5
  with_fx :reverb, mix: 0.5, amp: 0.4 do
    play [:d5, :a5], release: 0.3
    sleep 0.25
    play [:d5, :a5], release: 0.4
  end
  sleep 6.25
end

live_loop :synth1, sync: :bass do
  stop
  use_synth :tb303
  use_synth_defaults cutoff: 90
  
  with_fx :slicer, mix: 0.6 do
    notes = [
      [:d3], [:e3], [:f3],
      [:c3, :e3], [:d3, :f3], [:e3, :g3],
      [:d3, :f3], [:e3, :g3], [:f3, :a3], [:f3, :a3],
      [:e3, :g3], [:e3, :g3], [:d3, :f3], [:d3, :f3]
    ]
    
    releases = [1, 1, 1.125, 1, 1, 1.125, 1, 1.125, 1.125, 0.5, 0.5, 0.5, 0.5, 1.5]
    sleeps   = [0.75, 0.75, 2.5, 0.75, 0.75, 2.5, 0.75, 0.75, 2.5, 0.25, 0.5, 0.5, 0.5, 2.25]
    
    notes.each_with_index do |n, i|
      play n, release: releases[i]
      sleep sleeps[i]
    end
  end
end

live_loop :mel1, sync: :bass do
  stop
  use_synth :bass_foundation
  use_synth_defaults cutoff: 80
  
  with_fx :ping_pong, mix: 0.6, amp: 1.5 do
    sleep 0.5
    mel1_pattern1
    mel1_pattern2
    mel1_pattern1
    play :g3
    sleep 0.5
    play :a3
    sleep 1
    play :d3
    sleep 2
    mel1_pattern3
    mel1_ending
  end
end

fadein = (ramp *range(1, 0, 0.2))

live_loop :mel2, sync: :bass do
  ##| stop
  tick
  use_synth :prophet
  use_synth_defaults cutoff: 70
  
  with_fx :reverb, mix: 0.6, amp: fadein.look do
    puts fadein.look
    phrase1
    phrase2
    phrase3
    phrase4
    phrase5
    phrase6
    phrase7
  end
end


use_bpm 135
use_debug true


section_a_chords = [[:D3, :F4, :A4, :C4],
                    [:A2, :Bb2, :D3, :F3, :F4]]


define :section_a do
  set :stop_section_a, false
  
  set :amp_pads_a, 0.8
  set :amp_melody_a, 0.5
  
  
  live_loop :pads_a do
    if get(:stop_section_a)
      stop
    end
    with_fx :reverb, room: 0.6, mix: 0.6 do
      section_a_chords.each do |chord_notes|
        use_synth :hollow
        play chord_notes, attack: 16, sustain: 10, release: 10, amp: 2, cutoff: 90
        use_synth :saw
        play chord_notes, attack: 16, sustain: 10, release: 10, amp: 0.5, cutoff: 70
        sleep 32
      end
    end
  end
end



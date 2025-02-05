# Welcome to Sonic Pi
bpm = 128

tabla_samples = {
  "ta" => "/Users/iremoztimur/samples/tabla/ta.aiff"
}

live_loop :tabla_groove do
  3.times do
    sample tabla_samples["ta"], amp: 0.4, release: 0.5
    sleep 0.25
  end
  sleep 0.25
  sample :tabla_dhec , amp: 0.3
  sample tabla_samples["ta"], amp: 0.4
  sleep 0.25
  sample :tabla_na_s, amp: 0.4, cutoff: 70
  sleep 0.25
  sample :tabla_na, amp: 0.4
  sleep 0.5
end



fadein = (ramp *range(0.1, 1, 0.05))
kick_cutoffs = range(70, 90, 2).mirror

live_loop :kick do
  if (spread 1, 2).tick then
    sample :bd_fat, amp: fadein.look
  end
  sleep 0.25
end


# Hi-Hats


live_loop :hats do
  sample :drum_cymbal_closed, amp: 0.2, rate: 1.5
  sleep 0.5
end




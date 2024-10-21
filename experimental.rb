# Welcome to  Sonic Pi
use_bpm 110

live_loop :kick do
  sample (ring, :bd_haus, :bd_808).tick
  sleep 1
end

live_loop :electro do
  sample :elec_bong , amp: 0.8
  sleep 1.5

end
live_loop :hat do
  sample :hat_tap , amp: 0.6
  sleep 1
end

live_loop :bass do
  play (ring, 50, 57, 53, 60).tick, amp: 1.5
  sleep 0.5
end

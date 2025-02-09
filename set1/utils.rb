define :phrase1 do
  play_pattern_timed [:c4, :d4, :f4, :g4], [0.5, 0.5, 0.25, 0.5]
  play :a4, sustain: 2
  sleep 3.25
end

define :phrase2 do
  play :d5
  sleep 0.5
  play :c5, sustain: 2
  sleep 2.5
end

define :phrase3 do
  play_pattern_timed [:f4, :g4, :a4, :f4], [0.5, 0.5, 0.25, 0.5]
  play :g4, sustain: 2
  sleep 3.25
end

define :phrase4 do
  play_pattern_timed [:a4, :g4, :g4, :f4, :f4, :d4, :c4, :d4], [0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25]
  play :a4, sustain: 2
  sleep 2.75
end

define :phrase5 do
  play :d5
  sleep 0.5
  play :e5, sustain: 2
  sleep 2.25
end

define :phrase6 do
  play_pattern_timed [:e5, :f5, :e5, :c5], [0.25, 0.5, 0.5, 0.5]
  play :a4, sustain: 2
  sleep 3.25
end

define :phrase7 do
  play_pattern_timed [:d4, :f4, :g4, :c5, :a4, :a4, :f4, :f4], [0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.5, 0.5]
end


define :mel1_pattern1 do
  play :g3
  sleep 0.5
  play :a3
  sleep 0.5
  2.times do
    play :c4
    sleep 0.5
  end
  sleep 1
end

define :mel1_pattern2 do
  play :a3
  sleep 0.5
  play :d4
  sleep 1
  play :c4
  sleep 3.5
end

define :mel1_pattern3 do
  play :d3
  sleep 0.5
  play :f3
  sleep 0.5
  play :a3
  sleep 0.5
  play :g3
  sleep 0.5
  play :f3
  sleep 0.5
  play :d3
  sleep 1
  play :d3
  sleep 1
  play :c3
  sleep 0.5
  play :d3
  sleep 0.5
  play :f3
  sleep 0.5
  play :g3
  sleep 2
end

define :mel1_ending do
  play :f3
  sleep 0.5
  play :g3
  sleep 0.5
  play :a3
  sleep 0.5
  play :g3
  sleep 0.5
  play :f3
  sleep 0.5
  play :e3
  sleep 1
  play :d3
  sleep 0.5
  play :d3, release: 0.25
  sleep 0.25
  play :c3, release: 0.25
  sleep 0.25
  play :d3
  sleep 4.5
end

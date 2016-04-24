
require 'active_support'
require 'active_support/core_ext'
require 'yaml'

root = File.dirname(File.dirname(File.dirname(__FILE__)))

participants = Hash[Dir[File.join(root, 'teams/*.yml')].map do |file_name|
  YAML.load_file(file_name).with_indifferent_access
end.flat_map do |data|
  data[:participants].map do |participant|
    [participant[:id], participant[:real_name]]
  end
end]

fastest_laps = Hash[YAML.load_file(File.join(root, 'heats/final.yml')).with_indifferent_access[:drivers].flat_map do |driver|
  driver[:lap_times].reject(&:nil?).map do |lap_time|
    [driver[:participant_id], lap_time]
  end
end.reduce(Hash.new) do |memo, lap|
  memo.merge(Hash[[lap]]) do |key, a, b|
    [a, b].min
  end
end.to_a.sort do |a, b|
  a.second <=> b.second
end]

result_string = <<-EOF
# Ranking on fastest lap in finals

This table contains the the drivers that participated in the final heat, sorted
by their fastest lap.

| Participant name | Fastest lap |
| --- | ---: |
EOF

result_string += fastest_laps.map do |participant_id, lap_time|
  "| #{participants[participant_id]} | #{format("%.2f", lap_time)} |"
end.join("\n")

File.write(File.join(File.dirname(__FILE__), 'README.md'), result_string)
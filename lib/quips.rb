require 'yaml'

class Quips
  VERSION = '1.0.1'

  def Quips.create_default_quips
    quipper = Quips.new
    quipper.parse_quips quipper.load_quip_file
    return quipper
  end

  def any_quip
    @quip_storage[rand(@quip_storage.size)]
  end

  def quip_for topic
    selected_array = @topic_arrays[topic]
    return any_quip if selected_array.nil? 
    @quip_storage[selected_array[rand(selected_array.size)]]
  end

  def load_quip_file(file_name = "default_quips.yml")
    YAML.load_file(locate_yaml_file(File.expand_path(__FILE__), file_name))
  end

  def locate_yaml_file directory, file_name
    dir = directory.gsub("quips.rb","")
    fname = dir+"./../data/" + file_name
  end

  def parse_quips quip_hash
    @quip_storage = Array.new
    @topic_arrays = Hash.new
    quip_id = 0
    quip_hash["quips"].each do |quip_entry |
      text = quip_entry["quip"]
      topics = quip_entry["topics"]
      @quip_storage << text
      index = @quip_storage.length - 1
      next if topics.nil?
      topics.each do |topic|
        topic_tracking = @topic_arrays[topic]
        if topic_tracking.nil?
          topic_tracking = []
          @topic_arrays[topic] = topic_tracking
        end
        topic_tracking << index
      end
    end
  end

  def all_quips
    @quip_storage
  end

  def all_topics
    @topic_arrays
  end

end

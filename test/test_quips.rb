require 'quips'
require 'test/unit'
require 'rubygems'
require 'flexmock/test_unit'

class TestQuips < Test::Unit::TestCase

  def setup
    @unit = Quips.new
  end

  def test_load_quip_file_with_no_args_loads_default
   mock_yaml = flexmock(YAML)
   mock_yaml.should_receive(:load_file).once.with("default_quips.yml")
   @unit.load_quip_file
  end

  def test_load_quip_file_with_specific_file
   mock_yaml = flexmock(YAML)
   mock_yaml.should_receive(:load_file).once.with("my_special_quips.yml")
   @unit.load_quip_file "my_special_quips.yml"
  end

  def test_parse_quips
   set_quip_storage_and_topic_arrays
   assert_equal 4, @unit.all_quips.length
   assert_equal [0,1], @unit.all_topics["intarweb"].sort
   assert_equal [0,3], @unit.all_topics["rude"].sort
  end

  def test_any_quip
    set_quip_storage_and_topic_arrays
    flexmock(@unit).should_receive(:rand).with(@unit.all_quips.length).once.and_return(1)
    assert_equal "I poop rainbows", @unit.any_quip
  end
  
  def test_quip_for_intarweb
    flexmock(@unit).should_receive(:rand).with(2).once.and_return(1)
    set_quip_storage_and_topic_arrays
    assert_equal "I poop rainbows", @unit.quip_for("intarweb")
  end

  def test_quip_for_rude
    flexmock(@unit).should_receive(:rand).with(2).once.and_return(1)
    set_quip_storage_and_topic_arrays
    assert_equal "'Go f*#k yourself.' -D. Cheney", @unit.quip_for("rude")
  end

  def test_quip_for_unknown_topic_defaults_to_any
    flexmock(@unit).should_receive(:any_quip).once.and_return("any call")
    set_quip_storage_and_topic_arrays
    assert_equal "any call", @unit.quip_for("microsoft")
  end

  def set_quip_storage_and_topic_arrays
   sample_quip_hash = Hash.new
   sample_quip_hash[:quips] = build_standard_sample_quips
   @unit.parse_quips sample_quip_hash 
  end

  def build_standard_sample_quips
    quip_list = Array.new
    quip_list << build_a_quip("That's what she said", ["intarweb","rude"])
    quip_list << build_a_quip("I poop rainbows", ["intarweb"]) 
    quip_list << build_a_quip("Some days it doesn't pay to chew through the restraints") 
    quip_list << build_a_quip("'Go f*#k yourself.' -D. Cheney", ["rude"]) 
    return quip_list
  end

  def build_a_quip( quip_text, topics_aray = [])
    {"quip" => quip_text, "topics" => topics_aray} 
  end
end

#!/usr/bin/env ruby
require "lifx"
class Rainbow

  CYCLE_TIME = 0.25

  def initialize
    @client = LIFX::Client.lan                  # Talk to bulbs on the LAN
    @client.discover! do |c|                    # Discover lights. Blocks until a light with the label 'Office' is found
      c.lights.with_label('Left')
    end
    @client.discover! do |c|                    # Discover lights. Blocks until a light with the label 'Office' is found
      c.lights.with_label('Right')
    end

    @lights = @client.lights

    puts "Running with #{light_count} lights..."
  end

  def light_count
    @lights.count
  end

  def run
    while (true)
      (0...360).each do |color|
        @lights.each_with_index do |light, light_index|
          light.set_color(color_for_light(color, light_index), duration: CYCLE_TIME)
        end
        @client.flush
        sleep CYCLE_TIME
      end
    end
  end

  def color_for_light(base_color, index)
    offset = (360/light_count) * index
    LIFX::Color.hsb((base_color + offset) % 360, 1, 1)
  end

end
Rainbow.new.run

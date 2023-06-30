# Listening Device

# Below we have a listening device. It lets us record something that is said and
# store it for later use. In general, this is how the device should be used:

# Listen for something, and if anything is said, record it for later use. If
# nothing is said, then do not record anything.

# Anything that is said is retrieved by this listening device via a block. If
# nothing is said, then no block will be passed in. The listening device can
# also output the most recent recording using a Device#play method.

=begin
P:

We need to complete this program so we get the desired outputs. We need to
define two different methods `Device#listen` and `Device#play`. The `#listen`
method accepts a block. If nothing is "said" within the block, then no block
should be passed in.

Modeling:


=end
class Device
  attr_reader :recordings

  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen(&block)
    if block
      record(block.call)
    end
  end

  def play
    puts recordings
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
class Rdata
  attr_accessor :success
  attr_accessor :mssg
  attr_accessor :data
  attr_accessor :code

  def initialize(*args)
    @success = false
    @mssg = ""
    @code = 200
    @data = nil

    if(args.length >= 1)
      @success = args[0]
    end

    if(args.length >= 2)
      @mssg = args[1]
    end

    if(args.length >= 3)
      @code = args[2]
    end

    if(args.length == 4)
      @data = args[3]
    end           
  end

  def set(*args)
    if(args.length >= 1)
      @success = args[0]
    end

    if(args.length >= 2)
      @mssg = args[1]
    end

    if(args.length >= 3)
      @code = args[2]
    end     

    if(args.length == 4)
      @data = args[3]
    end    
  end
end
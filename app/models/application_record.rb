class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # res = OpenStruct.new(:ok, :mssg)
  def verify_destruction
  	return def_struct
  end

  def def_struct
	  res = OpenStruct.new(ok: true, mssg: "")
	  return res
  end

  def self.safe_destroy_all
    cc = 0
  	 self.all.each do |record|
        c = record.safe_destroy
        if c
          cc += 1
        end
    end
    return cc
  end

  def safe_destroy
    if self.verify_destruction.ok
      self.destroy
      return true
    else
      return false
    end
  end

end

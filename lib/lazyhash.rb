module LazyHash
  class << self
    def add(hash, key, value, pre = nil)
      skeys = key.split(".")
      f = skeys.shift
      if skeys.empty?
        if pre.nil?
          hash.send("[]=", f, value) unless hash.has_key?(f)
        else
          pre.send("[]=", f, value) unless pre.has_key?(f)
        end
      else
        pre = pre.nil? ? hash.send("[]", f) : pre.send("[]", f)
        add(hash, skeys.join("."), value, pre)
      end
    end

    def build_hash
      lazy = lambda { |h,k| h[k] = Hash.new(&lazy) }
      Hash.new(&lazy)
    end
  end
end

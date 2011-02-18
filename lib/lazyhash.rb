module LazyHash
  class << self
    def add(hash, key, value)
      skeys = key.split(".")
      f = skeys.shift
      if skeys.empty?
        hash.send("[]=", f, value) unless !hash.is_a?(Hash) || (hash.has_key?(f) && hash[f].is_a?(Hash))
      else
        add(hash[f], skeys.join("."), value)
      end
    end

    def build_hash
      lazy = lambda { |h,k| h[k] = Hash.new(&lazy) }
      Hash.new(&lazy)
    end
  end
end

class Range
  def to_s
    case
      when self.begin == (-1.0/0) && self.end == (1.0/0)
        "All"
      when self.begin == (-1.0/0)
        "<#{self.end}"
      when self.end == (1.0/0)
        "#{self.begin}+"
      else
        "#{self.begin}-#{self.end}"
    end
  end
end
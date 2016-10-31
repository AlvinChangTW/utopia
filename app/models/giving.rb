class Giving < Good
  def status_check
    self.status = "已送出"
    #self.save
  end
end


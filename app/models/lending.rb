class Lending < Good
    def status_check
    self.status = "已借出"
    #self.save
  end
end


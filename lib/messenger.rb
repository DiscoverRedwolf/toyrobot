
class Messenger
  def execute(line)
    dispatch(line.strip.to_sym.downcase)
  end

  private

  def dispatch(cmd)
    puts cmd.inspect
  end
end

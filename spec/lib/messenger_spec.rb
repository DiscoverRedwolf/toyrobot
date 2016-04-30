
RSpec.describe Messenger do
  it 'foramts a command' do
    io = double('IO', strip: "RIGHT\n".strip)
    expect(subject).to receive(:dispatch).with(:right)
    subject.execute(io)
  end
end

require_relative '../calculator'

describe "calculator" do
  describe "add method" do
    c = Calculator.new

    it "when empty string" do
      expect(c.add("")).to eq(0)
    end

    it "when input  string 1" do
      expect(c.add("1")).to eq(1)
    end

    it "when input string 1,5" do
      expect(c.add("1,5")).to eq(6)
    end

    it "when input string 1,2,3,5" do
      expect(c.add("1,2,3,5")).to eq(11)
    end

     it "when input string 1\n2,3" do
       expect(c.add("1\n2,3")).to eq(6)
     end

     it "when input string //;\n1;2" do
       expect(c.add("//;\n1;2")).to eq(3)
     end

     it "when input  string -1" do
       expect { c.add("-1") }.to raise_error("negative numbers not allowed -1")
     end
  end
end
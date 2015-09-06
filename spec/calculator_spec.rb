require "calculator"

describe Calculator do

  let(:calc){ Calculator.new }

  describe "#add" do
    it "returns an integer" do
      expect(calc.add 1, 1).to be_an Integer
    end

    context "when adding zero to an integer" do
      it "returns the integer" do
        expect(calc.add 4, 0).to eq 4
      end
    end

    it "is not dependent on the operation order" do
      expect(calc.add 1, 2).to eq calc.add(2, 1)
    end

    it "accepts more than 2 arguments" do
      expect(calc.add 2, 4, 3).to eq 9
    end
  end
  
  describe "#subtract" do
    it "returns an integer" do
      expect(calc.subtract 1, 1).to be_an Integer
    end
	
   it "is dependent on the operation order" do
      expect(calc.subtract 1, 2).not_to eq calc.add(2, 1)
    end

    context "when subtracting zero from an integer" do
      it "returns the integer" do
        expect(calc.subtract 4, 0).to eq 4
      end
    end
	
	context "when subtracting an integer from itself" do
		it "returns zero" do
			expect(calc.subtract 3,3).to eq 0
		end
	end
 
    it "accepts more than 2 arguments" do
      expect(calc.subtract 2, 4, 3).to eq -5
    end
  end
  
end

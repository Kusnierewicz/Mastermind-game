require "spec_helper.rb"

describe Array do
  context "#all_empty?" do
  	it "returns true if all elements of Array are empty" do
  	  expect(["", "", ""].all_empty?).to eq true
  	end

  	it "returns false if some of the Array elements are not empty" do
  	  expect(["", 1, "", Object.new, :a].all_empty?).to eq false
  	end

  	it "returns true for an empty Array" do
  	  expect([].all_empty?).to eq true
  	end
  end

  context "#all_same?" do
    it "returns true if all elements of Array are the same" do
      expect(["A", "A", "A"].all_same?).to eq true
    end

    it "returns false if some of the Array elements are not the same" do
      expect(["", 1, "", Object.new, :a].all_same?).to eq false
    end

    it "returns true for an empty Array" do
      expect([].all_same?).to eq true
    end
  end

  context "#any.empty?" do
    it "returns false if any elements of Array are the same" do
      expect(["A", "A", "B"].any_empty?).to eq false
    end

    it "returns true if any of the Array elements are empty" do
      expect(["", 1, "", Object.new, :a].any_empty?).to eq true
    end

    it "returns false for the empty Array" do
      expect([].any_empty?).to eq false
    end
  end

  context "#none_empty?" do
    it "returns true if any elements of Array are the same" do
      expect(["A", "A", "B"].none_empty?).to eq true
    end

    it "returns false if any of the Array elements are avalible" do
      expect(["", 1, "", Object.new, :a].none_empty?).to eq false
    end

    it "returns true for the empty Array" do
      expect([].none_empty?).to eq true
    end
  end

end
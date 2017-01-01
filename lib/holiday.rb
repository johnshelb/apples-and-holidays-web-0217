require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  #{
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer].first[1][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each {|key,array| array<<supply}
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
holiday_hash[:spring][:memorial_day]<<supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name]=supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  new_array=[]
  holiday_hash[:winter].each do |holiday,array|
    array.each {|item| new_array<<item}
  end
  new_array
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season,seas_hol_hash| puts "#{season.capitalize}:"
    seas_hol_hash.each do |holiday_symbol,array|
    holiday_array = holiday_symbol.to_s.split("_")
      for i in (0...holiday_array.count)
        holiday_array[i].capitalize!
      end
      holiday_upstring = holiday_array.join(" ")
      puts "  " + holiday_upstring + ": " + array.join(", ")
    end
   end
 end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  has_grill=[]
   holiday_hash.each do |season,seas_hol_hash|
     seas_hol_hash.each do |holiday,supply_array|
       if supply_array.include?("BBQ")
       has_grill<<holiday
      end
     end
  end
  has_grill
end
